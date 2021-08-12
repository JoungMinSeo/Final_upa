package edu.fin.upa.management.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.management.model.vo.Management;
import edu.fin.upa.management.model.vo.Pagination;

@Repository
public class ManagementDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 특정 팀의 모든 팀원 수 조회
	 * @param workNo
	 * @return
	 */
	public Pagination getListCount(int workNo) {
		return sqlSession.selectOne("managementMapper.memberCount", workNo);
	}

	/** 멤버 리스트조회
	 * @param pagination
	 * @return
	 */
	public List<Management> selectMemberList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("managementMapper.selectMember", pagination.getWorkNo(), rowBounds);
	}

	/** 팀 회원 추가
	 * @param management
	 * @return result
	 */
	public int addJoinMember(Management management) {
		return sqlSession.insert("managementMapper.addJoinMember", management);
	}

	/**  팀 멤버 초대 메일 보내기(누구에게 메일을 보냈는가 기록)
	 * @param inputAddEmail
	 * @return result
	 */
	public int invitation(Management inputAddEmail) {
		return sqlSession.insert("managementMapper.invitation", inputAddEmail);
	}

	/** 초대 테이블에서 회원등급 조회
	 * @param management
	 * @return memberRank
	 */
	public String selectIvitation(Management management) {
		return sqlSession.selectOne("managementMapper.selectIvitation", management);
	}
 
	/** 초대 테이블 삭제
	 * @param management
	 */
	public void deleteInvitation(Management management) {
		sqlSession.delete("managementMapper.deleteInvitation", management);
	}
 
	/** 팀에 존재하는 회원인지 확인
	 * @param inputAddEmail
	 * @return 
	 */
	public Map<String, Object> selectWorkspaceJoin(Management inputAddEmail) {
		return sqlSession.selectOne("managementMapper.selectWorkspaceJoin", inputAddEmail);
	}
	
	/** 회원 등급 수정
	 * @param workNo
	 * @param memberNo
	 * @return result
	 */
	public int updateMemberRank(Management m) {
		return sqlSession.update("managementMapper.updateMemberRank", m);
	}

	/** 팀 회원 삭제
	 * @param workNo
	 * @param management
	 * @return result
	 */
	public int deleteJoinMember(Management m) {
		return sqlSession.delete("managementMapper.deleteJoinMember", m);
	}

	/** 이미 워크스페이스에 가입된 회원인지 확인
	 * @param management
	 * @return result
	 */
	public int checkWorkspceMember(Management management) {
		return sqlSession.selectOne("managementMapper.checkWorkspceMember", management);
	}
	
	
	
	
}
