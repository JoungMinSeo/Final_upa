package edu.fin.upa.member.model.service;

import edu.fin.upa.member.model.vo.Member;

public interface MemberService {

	Member login(Member inputMember);

	int idDupCheck(String id);

	int signUp(Member inputMember);

}
