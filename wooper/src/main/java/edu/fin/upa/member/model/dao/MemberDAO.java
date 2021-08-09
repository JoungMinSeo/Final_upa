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

	// 로그인
	public Member login(String memberId) {
		return sqlSession.selectOne("memberMapper.login", memberId);
	}

	// 아이디 중복 검사
	public int idDupCheck(String id) {
		return sqlSession.selectOne("memberMapper.idDupCheck",id);
	}
	
	// 회원 가입
	public int signUp(Member inputMember) {
		
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}


	// 인터셉터 자동 로그인
	public Member getMemberSessionId(String sessionId) {
		return sqlSession.selectOne("memberMapper.getMemberSessionId",sessionId);
	}
	
	// 자동 로그인
	public int keepLogin(Map<String, Object> map) {
		return sqlSession.update("memberMapper.keepLogin",map);
	}

	// 카카오 회원 조회
	public Member selectKakaoMember(int kakaoId) {
		return sqlSession.selectOne("memberMapper.selectKakaoMember", kakaoId);
	}
	
	// 카카오 회원가입
	public int insertKakaoMember(Member kakaoMember) {
		return sqlSession.insert("memberMapper.insertKakaoMember", kakaoMember);
	}
	
	// 닉네임 수정
	public int updateNickName(Member updateMember) {
		return sqlSession.update("memberMapper.updateNickName",updateMember);
	}
	
	// 프로필 사진 변경
	public int updateImg(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateImg",map);
	}

	// 비밀번호 조회
	public String selectPassword(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectPassword", memberNo);
	}

	// 비밀번호 변경
	public int changePwd(Member loginMember) {
		return sqlSession.update("memberMapper.changePwd", loginMember);
	}
	
	// 회원 탈퇴
	public int secession(Member loginMember ) {
		return sqlSession.update("memberMapper.secession", loginMember);
	}
	




}
