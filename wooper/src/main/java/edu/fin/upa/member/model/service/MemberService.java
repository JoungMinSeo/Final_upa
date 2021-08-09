package edu.fin.upa.member.model.service;


import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import edu.fin.upa.member.model.vo.Member;

public interface MemberService {

	// 로그인
	Member login(Member inputMember);

	// 아이디 중복 체크
	int idDupCheck(String id);
	
	// 회원 가입
	int signUp(Member inputMember);
	
	// 인터셉터 로그인 구문
	Member getMemberSessionId(String sessionId);
	void keepLogin(String loginId, Date limitDate, String inputId);

	// 휴대폰 인증
	void certifiedPhoneNumber(String memberPhone, String numStr);
	
	// 카카오 로그인 회원 조회
	Member selectKakaoMember(int kakaoId);

	// 카카오 회원 정보 삽입
	int insertKakaoMember(Member kakaoMember);

	// 비밀번호 변경
	int changePwd(String currentPwd, String newPwd, Member loginMember);
	
	// 회원 탈퇴
	int secession(String currentPwd, Member loginMember);
	
	// 회원 수정
	int updateMember(Member updateMember, MultipartFile img, String webPath, String savePath);
	

	
}
