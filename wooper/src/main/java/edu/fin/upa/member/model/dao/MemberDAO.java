package edu.fin.upa.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member login(String memberId) {
		return sqlSession.selectOne("memberMapper.login", memberId);
	}

	public int idDupCheck(String id) {
		return sqlSession.selectOne("memberMapper.idDupCheck",id);
	}

}
