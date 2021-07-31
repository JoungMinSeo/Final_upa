package edu.fin.upa.member.model.service;

import java.sql.Date;

import edu.fin.upa.member.model.vo.Member;

public interface MemberService {

	Member login(Member inputMember);

	int idDupCheck(String id);

	int signUp(Member inputMember);

	void keepLogin(String loginId, Date limitDate, String inputId);
	
	
}
