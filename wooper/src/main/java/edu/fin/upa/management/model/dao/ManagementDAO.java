package edu.fin.upa.management.model.dao;

import java.util.List;

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

	/** 회원 등급 수정
	 * @param workNo
	 * @param memberNo
	 * @return result
	 */
	public int updateMemberRank(Management management) {
		return sqlSession.update("managementMapper.updateMemberRank", management);
	}

	/** 팀 회원 삭제
	 * @param workNo
	 * @param management
	 * @return result
	 */
	public int deleteJoinMember(int workNo, Management management) {
		return sqlSession.update("managementMapper.deleteJoinMember", management);
	}

	/** 팀 회원 추가
	 * @param inputAddEmail
	 * @return result
	 */
	public int addJoinMember(Management inputAddEmail) {
		return sqlSession.insert("memberMapper.addJoinMember", inputAddEmail);
	}
	
	
	
	
}
