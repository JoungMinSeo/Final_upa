package edu.fin.upa.sign.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.sign.model.vo.MeetingJoin;
import edu.fin.upa.sign.model.vo.PurchaseList;
import edu.fin.upa.sign.model.vo.SignLine;
import edu.fin.upa.sign.model.vo.Viewer;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;
import oracle.net.aso.d;

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
		
		return sqlSession.selectList("signMapper.selectMyDocumentList", myDocuMap);
	}
	
	
	/** 결재할 문서 수 조회
	 * @param myDocuMap
	 * @return selectPg
	 */
	public Pagination getSignDocuListCount(Map<String, Object> signDocuMap) {
		return sqlSession.selectOne("signMapper.getSignDocuListCount", signDocuMap);
	}
	
	
	/** 결재할 문서 목록 조회
	 * @param myDocuPagination
	 * @return myDocumentList
	 */
	public List<Document> selectSignDocumentList(Pagination signDocuPagination, Member loginMember) {
		
		int offset = (signDocuPagination.getCurrentPage() - 1) * signDocuPagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, signDocuPagination.getLimit());
		
		Map<String , Object> signDocuMap = new HashMap<String, Object>();
		signDocuMap.put("workNo", signDocuPagination.getWorkNo());
		signDocuMap.put("memberNo", loginMember.getMemberNo());
		
		return sqlSession.selectList("signMapper.selectSignDocumentList", signDocuMap);
	}


	/** 팀 문서 수 조회
	 * @param teamDocuMap
	 * @return teamDocuPagination
	 */
	public Pagination getTeamDocuListCount(Map<String, Object> teamDocuMap) {
		return sqlSession.selectOne("signMapper.getTeamDocuListCount", teamDocuMap);
	}


	/** 팀 문서 목록 조회
	 * @param teamDocuPagination
	 * @param loginMember
	 * @return teamDocumentList
	 */
	public List<Document> selectTeamDocumentList(Pagination teamDocuPagination, Member loginMember) {
		
		int offset = (teamDocuPagination.getCurrentPage() - 1) * teamDocuPagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, teamDocuPagination.getLimit());
		
		Map<String , Object> teamDocuMap = new HashMap<String, Object>();
		teamDocuMap.put("workNo", teamDocuPagination.getWorkNo());
		teamDocuMap.put("memberNo", loginMember.getMemberNo());
		
		return sqlSession.selectList("signMapper.selectTeamDocumentList", teamDocuMap);
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
		
		return sqlSession.selectList("signMapper.selectMyTempDocumentList", myTempMap);
	}
	
	
	/** 결재 문서 상세 조회
	 * @param documentNo
	 * @return document
	 */
	public Document selectDocument(int documentNo) {
		return sqlSession.selectOne("signMapper.selectDocument", documentNo);
	}


	/** 워크스페이스 참가자 목록 조회
	 * @param workNo
	 * @return workspaceJoin
	 */
	public List<WorkspaceJoin> selectWorkspaceJoin(int workNo) {
		return sqlSession.selectList("signMapper.selectWorkspaceJoin", workNo);
	}


	/** 회원 직급 조회
	 * @param rMap 
	 * @param workNo
	 * @param memberNo
	 * @return memberRank
	 */
	public String selectRank(Map<String, Object> rMap) {
		return sqlSession.selectOne("signMapper.selectRank", rMap);
	}

	
	/** 품의서 작성
	 * @param erMap 
	 * @param document
	 * @return documentNo
	 */
	public int insertExpenseReport(Document document) {
		
		Map<String , Object> erMap1 = new HashMap<String, Object>();
		erMap1.put("documentTitle", document.getDocumentTitle());
		erMap1.put("documentEtc", document.getDocumentEtc());
		erMap1.put("memberNo", document.getMemberNo());
		erMap1.put("workNo", document.getWorkNo());
		erMap1.put("documentNo", 0);
		
		
		int result1 = sqlSession.insert("signMapper.insertExpenseReport1", erMap1);
		
		System.out.println(erMap1);
		
		document.setDocumentNo((int)erMap1.get("documentNo"));
		
		Map<String , Object> erMap2 = new HashMap<String, Object>();
		erMap2.put("documentNo", document.getDocumentNo());
		erMap2.put("expenseDept", document.getExpenseDept());
		erMap2.put("expensePurpose", document.getExpensePurpose());
		erMap2.put("accountPhone", document.getAccountPhone());
		erMap2.put("accountDt", document.getAccountDt());
		erMap2.put("deliveryStartDt", document.getDeliveryStartDt());
		erMap2.put("deliveryEndDt", document.getDeliveryEndDt());
		erMap2.put("paymentMethod", document.getPaymentMethod());
		
		int result2 = sqlSession.insert("signMapper.insertExpenseReport2", erMap2);
		
		
		if(result1 > 0 && result2 > 0) {
			return document.getDocumentNo();
		}else {
			return 0;
		}
	}


	/** 구매 목록 삽입(list)
	 * @param pList
	 * @return 
	 */
	public int insertPurchaseList(List<PurchaseList> pList) {
		return sqlSession.insert("signMapper.insertPurchaseList", pList);
	}


	/** 회의록 작성
	 * @param document
	 * @return documentNo
	 */
	public int insertMeeting(Document document) {
		
		Map<String , Object> mMap1 = new HashMap<String, Object>();
		mMap1.put("documentTitle", document.getDocumentTitle());
		mMap1.put("documentEtc", document.getDocumentEtc());
		mMap1.put("memberNo", document.getMemberNo());
		mMap1.put("workNo", document.getWorkNo());
		
		System.out.println(mMap1);
		
		int result1 = sqlSession.insert("signMapper.insertMeeting1", mMap1);
		
		document.setDocumentNo((int)mMap1.get("documentNo"));
		
		Map<String , Object> mMap2 = new HashMap<String, Object>();
		mMap2.put("documentNo", document.getDocumentNo());
		mMap2.put("meetingDt", document.getMeetingDt());
		mMap2.put("meetingDept", document.getMeetingDept());
		mMap2.put("meetingPurpose", document.getMeetingPurpose());
		mMap2.put("meetingContent", document.getMeetingContent());
		
		int result2 = sqlSession.insert("signMapper.insertMeeting2", mMap2);
		
		if(result1 > 0 && result2 > 0) {
			return document.getDocumentNo();
		}else {
			return 0;
		}
	}


	/** 회의 참가자 목록 삽입(List)
	 * @param meetingJoinList
	 * @return result
	 */
	public int insertMeetingJoinList(List<MeetingJoin> meetingJoinList) {
		return sqlSession.insert("signMapper.insertMeetingJoinList", meetingJoinList);
	}

	
	/** 휴가신청서 작성
	 * @param document
	 * @return documentNo
	 */
	public int insertVacation(Document document) {

		Map<String , Object> vMap1 = new HashMap<String, Object>();
		vMap1.put("documentTitle", document.getDocumentTitle());
		vMap1.put("documentEtc", document.getDocumentEtc());
		vMap1.put("memberNo", document.getMemberNo());
		vMap1.put("workNo", document.getWorkNo());
		
		System.out.println(vMap1);
		
		int result1 = sqlSession.insert("signMapper.insertVacation1", vMap1);
		
		document.setDocumentNo((int)vMap1.get("documentNo"));
		
		Map<String , Object> vMap2 = new HashMap<String, Object>();
		vMap2.put("documentNo", document.getDocumentNo());
		vMap2.put("vacationType", document.getVacationType());
		vMap2.put("vacationStartDt", document.getVacationStartDt());
		vMap2.put("vacationEndDt", document.getVacationEndDt());
		vMap2.put("vacationReason", document.getVacationReason());
		
		int result2 = sqlSession.insert("signMapper.insertVacation2", vMap2);
		
		if(result1 > 0 && result2 > 0) {
			return document.getDocumentNo();
		}else {
			return 0;
		}
	}


	/** 품의서 수정
	 * @param document
	 * @return result
	 */
	public int updateExpenseReport(Document document) {
		
		int result1 = sqlSession.update("signMapper.updateExpenseReport1", document);
		int result2 = sqlSession.update("signMapper.updateExpenseReport2", document);
		
		if( result1 > 0 && result2 > 0) {
			return result1 + result2;
		}else {
			return 0;
		}
	}


	/** 구매 목록 삭제
	 * @param documentNo
	 * @return flag
	 */
	public int deletepList(int documentNo) {
		return sqlSession.delete("signMapper.deletepList", documentNo);
	}

 
	/** 회의록 수정
	 * @param document
	 * @return result
	 */
	public int updateMeeting(Document document) {
		
		int result1 = sqlSession.update("signMapper.updateMeeting1", document);
		int result2 = sqlSession.update("signMapper.updateMeeting2", document);
		
		if( result1 > 0 && result2 > 0) {
			return result1 + result2;
		}else {
			return 0;
		}
	}


	/** 회의 참가자 목록 삭제
	 * @param documentNo
	 * @return flag
	 */
	public int deleteMeetingJoin(int documentNo) {
		return sqlSession.delete("signMapper.deleteMeetingJoin", documentNo);
	}


	/** 휴가신청서 수정
	 * @param document
	 * @return result
	 */
	public int updateVacation(Document document) {
		
		int result1 = sqlSession.update("signMapper.updateVacation1", document);
		int result2 = sqlSession.update("signMapper.updateVacation2", document);
		
		if( result1 > 0 && result2 > 0) {
			return result1 + result2;
		}else {
			return 0;
		}
	}


	/** 전자 결재 문서 삭제
	 * @param documentNo
	 * @return result
	 */
	public int deleteDocument(int documentNo) {
		return sqlSession.update("signMapper.deleteDocument", documentNo);
	}


	/** 결재 회원 검색
	 * @param search
	 * @return 
	 */
	public List<WorkspaceJoin> selectSignMemList(Search search, int workNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("workNo", workNo);
		return sqlSession.selectList("signMapper.selectSignMemList",map);
	}

	
	/** 결재선 지정
	 * @param slMap
	 * @param viewerList 
	 * @return result
	 */
	public int insertSignLine(Document document, List<SignLine> signLineList, List<Viewer> viewerList) {
		
		System.out.println(document.getMemberNo());
		System.out.println(document.getWorkNo());
		System.out.println(document.getDocumentNo());
		
		int result1 = sqlSession.insert("signMapper.insertSignLine1", document);
		int result2 = sqlSession.insert("signMapper.insertSignLine2", signLineList);
		int result3 = sqlSession.insert("signMapper.insertSignLine3", viewerList);

		if(result1 > 0 && result2 > 0 && result3 > 0) {
			sqlSession.update("signMapper.insertSignLine4", document.getDocumentNo());
			return result1+result2+result3;
		}else {
			return 0;
		}
	}

	
	/** 결재 진행
	 * @param document
	 * @param loginMember
	 */
	public void signDocument(SignLine signLine) {
		sqlSession.update("signMapper.signDocument", signLine);
	}


	/** 결재 문서 타입 조회
	 * @param documentNo
	 * @return documentType
	 */
	public Document selectDocumentType(int documentNo) {
		return sqlSession.selectOne("signMapper.selectDocumentType", documentNo);
	}


	/** 품의서 상세 조회
	 * @param temp
	 * @return
	 */
	public Document selectER(Document temp) {
		return sqlSession.selectOne("signMapper.selectER",temp);
	}


	/** 회의록 상세 조회
	 * @param temp
	 * @return
	 */
	public Document selectM(Document temp) {
		return sqlSession.selectOne("signMapper.selectM", temp);
	}


	/** 휴가신청서 상세 조회
	 * @param temp
	 * @return
	 */
	public Document selectV(Document temp) {
		return sqlSession.selectOne("signMapper.selectV", temp);
		
	}


	/** 결재 반려
	 * @param signLine
	 */
	public void endSign(SignLine signLine) {
		sqlSession.update("signMapper.endSign", signLine);
	}


	public void endSignYes(SignLine signLine) {
		sqlSession.update("signMapper.endSignYes", signLine);
	}


	
	






	

}
