package edu.fin.upa.sign.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;

@Repository
public class SignDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 작성한 문서 수 조회
	 * @param myDocuMap
	 * @return selectPg
	 */
	public Pagination getMyDocuListCount(Map<String, Object> myDocuMap) {
		return sqlSession.selectOne("signMapper.getMyDocuListCount", myDocuMap);
	}

	
	/** 작성한 문서 목록 조회
	 * @param myDocuPagination
	 * @return myDocumentList
	 */
	public List<Document> selectMyDocumentList(Pagination myDocuPagination, Member loginMember) {
		
		int offset = (myDocuPagination.getCurrentPage() - 1) * myDocuPagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, myDocuPagination.getLimit());
		
		Map<String , Object> myDocuMap = new HashMap<String, Object>();
		myDocuMap.put("workNo", myDocuPagination.getWorkNo());
		myDocuMap.put("memberNo", loginMember.getMemberNo());
		
		return sqlSession.selectList("signMapper.selectMyDocumentList", myDocuMap, rowBounds);
	}


	/** 임시보관함 문서 수 조회
	 * @param myTempDocuMap
	 * @return selectPg
	 */
	public Pagination getMyTempDocuListCount(Map<String, Object> myTempDocuMap) {
		return sqlSession.selectOne("signMapper.getMyTempDocuListCount", myTempDocuMap);
	}


	/** 임시보관함 문서 목록 조회
	 * @param myTempDocuPagination
	 * @return myTempDocumentList
	 */
	public List<Document> selectMyTempDocumentList(Pagination myTempDocuPagination, Member loginMember) {
		
		int offset = (myTempDocuPagination.getCurrentPage() - 1) * myTempDocuPagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, myTempDocuPagination.getLimit());
		
		Map<String , Object> myTempMap = new HashMap<String, Object>();
		myTempMap.put("workNo", myTempDocuPagination.getWorkNo());
		myTempMap.put("memberNo", loginMember.getMemberNo());
		
		return sqlSession.selectList("signMapper.selectMyTempDocumentList", myTempMap, rowBounds);
	}


	/** 워크스페이스 참가자 목록 조회
	 * @param workNo
	 * @return workspaceJoin
	 */
	public List<WorkspaceJoin> selectWorkspaceJoin(int workNo) {
		return sqlSession.selectList("signMapper.selectWorkspaceJoin", workNo);
	}

}
