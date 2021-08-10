package edu.fin.upa.member.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.fin.upa.member.commons.Exception.SaveFileException;
import edu.fin.upa.member.model.dao.MemberDAO;
import edu.fin.upa.member.model.vo.Member;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired  
	private JavaMailSender mailSender;   //메일
	
	// 로그인
	@Override
	public Member login(Member inputMember) {
		
		Member loginMember = dao.login(inputMember.getMemberId());

		if (loginMember != null) {
			if (!bCryptPasswordEncoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
				loginMember = null;
			} else {
				loginMember.setMemberPw(null);
			}
		}
		return loginMember;
	}
	
	// 아이디 중복 검사
	@Override
	public int idDupCheck(String id) {
		return dao.idDupCheck(id);
	}
	
	// 회원가입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member inputMember) {
		
		String encPwd = bCryptPasswordEncoder.encode(inputMember.getMemberPw());
		
		inputMember.setMemberPw(encPwd);
		
		return dao.signUp(inputMember);
	}
	
	// 인터셉터 자동 로그인
	@Override
	public Member getMemberSessionId(String sessionId) {
		return dao.getMemberSessionId(sessionId);
	}
	
	// 쿠키 유효시간 저장
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void keepLogin(String loginId, Date limitDate, String inputId) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberId", loginId);
		map.put("limitDate", limitDate);
		map.put("inputId", inputId);
		
		dao.keepLogin(map);
	}
	
	// 휴대폰 인증
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

        String api_key = "";
        String api_secret = "";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", "010-9070-3879");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "우파루파에서 보낸 메세지 입니다. 인증번호는" + "["+cerNum+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }

	// 카카오 회원 정보 조회
	@Override
	public Member selectKakaoMember(int kakaoId) {
		
		return dao.selectKakaoMember(kakaoId);
	}
	
	// 카카오 회원 가입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertKakaoMember(Member kakaoMember) {

		String encPwd = bCryptPasswordEncoder.encode(kakaoMember.getMemberPw());
		
		kakaoMember.setMemberPw(encPwd);
		
		
		return dao.insertKakaoMember(kakaoMember);
	}

	// 비밀번호 수정
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int changePwd(String currentPwd, String newPwd, Member loginMember) {
		
		String savePwd = dao.selectPassword(loginMember.getMemberNo());
		
		int result = 0;
		
		if(bCryptPasswordEncoder.matches(currentPwd, savePwd)) {
			
			// 2) 비밀번호 변경
			// - 새 비밀번호 암호화
			String encPwd = bCryptPasswordEncoder.encode(newPwd);
			
			// 마이바티스 메소드는 SQL 수행 시 사용할 파라미터를
			// 하나만 추가할 수 있다 -> loginMember에 담아서 전달
			loginMember.setMemberPw(encPwd);
			
			result = dao.changePwd(loginMember);
			
			// loginMember에 저장한 encPwd를 제거 (Session에 비밀번호 저장하면 안됨)
			loginMember.setMemberPw(null);
			
		}
		
		return result;
	}
	
	
	// 회원 탈퇴
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int secession(String currentPwd, Member loginMember) {
		
		String savePwd = dao.selectPassword(loginMember.getMemberNo());
		
		int result = 0;
		
		if(bCryptPasswordEncoder.matches(currentPwd, savePwd)) {
			
			result  = dao.secession(loginMember);
		}
		
		return result;
	}

	// 파일명 변경 메소드
	@Override
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}
	
	// 회원 정보 수정
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateMember(Member updateMember, Map<String, Object> map, String webPath, String savePath, MultipartFile img) {
		
		int result = dao.updateNickName(updateMember);
		
		System.out.println("업데이트 멤버 : " + updateMember);
		if (result > 0) {
			
			if (!img.getOriginalFilename().equals("")) {
				
				
				result = dao.updateImg(map);
				
				if (result > 0) {
					try {
						img.transferTo(new File(savePath + map.get("fileName")));
					} catch (Exception e) {
						e.printStackTrace();
						throw new SaveFileException();
					}
					
				}
			}
		}
		return result;
	}
	
	// 회원 번호 조회
	@Override
	public Member selectPhone(String memberPhone, String memberName) {
		
		Member member = new Member();
		
		member.setMemberNm(memberName);
		member.setMemberPhone(memberPhone);
		
		return dao.selectPhone(member);
	}
	
	// 이메일 조회
	@Override
	public int selectEmail(Member inputMember) {
		return dao.selectEmail(inputMember);
	}
	
	// 이메일 보내기
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int sendEmail(Member inputMember) {
		
		// 임시 비밀번호 생성
		UUID garbagePassword = UUID.randomUUID();
		String encPwd = bCryptPasswordEncoder.encode(garbagePassword.toString());
		
		inputMember.setMemberPw(encPwd);
		
		int result = dao.updatePassword(inputMember);
		
		if (result > 0) {
			
			String setfrom = "upalupa789@gmail.com"; // 보내는 서버 이메일
			String tomail = inputMember.getMemberId(); // 받는 사람 이메일
			String title = "우파루파 임시 비밀번호입니다."; // 제목
			
			String content =  "임시 비밀번호는 " + garbagePassword + " 입니다."; // 내용
			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content, true); // 메일 내용
				
				mailSender.send(message);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			result = -1;
		}
		
		return result;
	}

	
	
	
	
}
