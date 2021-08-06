package edu.fin.upa.member.model.service;


import java.util.Date;

import edu.fin.upa.member.model.vo.Member;

public interface MemberService {

	Member login(Member inputMember);

	int idDupCheck(String id);

	int signUp(Member inputMember);
	
	
	// 인터셉터 로그인 구문
	Member getMemberSessionId(String sessionId);

	void keepLogin(String loginId, Date limitDate, String inputId);

	void certifiedPhoneNumber(String memberPhone, String numStr);
	
	/*
	 * //카카오 회원 조회 Member selectKakaoMember(String id);
	 * 
	 * public abstract int selectMemberNo();
	 */
}
