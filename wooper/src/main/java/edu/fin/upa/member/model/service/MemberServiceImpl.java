package edu.fin.upa.member.model.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.ibatis.transaction.Transaction;
import org.eclipse.jdt.internal.compiler.apt.util.ArchiveFileObject;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}
	
	// 회원 정보 수정
	@Override
	public int updateMember(Member updateMember, MultipartFile img, String webPath, String savePath) {
		
		int result = dao.updateNickName(updateMember);
		
		System.out.println("업데이트 멤버 : " + updateMember);
		if (result > 0) {
			
			if (!img.getOriginalFilename().equals("")) {
				String fileName = rename(img.getOriginalFilename());
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fileName", fileName);
				map.put("memberNo", updateMember.getMemberNo());
				
				System.out.println(map);
				
				result = dao.updateImg(map);
				
				if (result > 0) {
					try {
						img.transferTo(new File(savePath + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						throw new SaveFileException();
					}
					
				}
			}
		}
		return result;
	}
		
	
	
	
	
}
