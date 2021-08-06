package edu.fin.upa.member.model.dao;

import java.util.Map;

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

	public int signUp(Member inputMember) {
		
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}


	// 인터셉터 자동 로그인
	public Member getMemberSessionId(String sessionId) {
		return sqlSession.selectOne("memberMapper.getMemberSessionId",sessionId);
	}

	public int keepLogin(Map<String, Object> map) {
			
			
		return sqlSession.update("memberMapper.keepLogin",map);
	}
	
	/** 카카오 회원 조회 DAO
	 * @param id
	 * @return member
	 */
	public Member selectKakaoMember(String id) {
		//return sqlSession.selectOne("memberMapper.selectKakoMember", id);
		return null;
	}

	public int selectMemberNo() {
		//return sqlSession.selectOne("memberMapper.selectMemberNo");
		return 0;
	}

}
