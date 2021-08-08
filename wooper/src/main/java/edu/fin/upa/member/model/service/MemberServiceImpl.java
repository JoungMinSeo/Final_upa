package edu.fin.upa.member.model.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.transaction.Transaction;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	
	
	
}
