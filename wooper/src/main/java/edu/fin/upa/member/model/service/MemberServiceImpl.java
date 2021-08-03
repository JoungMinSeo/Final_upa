package edu.fin.upa.member.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.transaction.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.member.model.dao.MemberDAO;
import edu.fin.upa.member.model.vo.Member;

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


}
