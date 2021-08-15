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
import edu.fin.upa.sign.model.vo.ExpenseReport;
import edu.fin.upa.sign.model.vo.Meeting;
import edu.fin.upa.sign.model.vo.PurchaseList;
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
	 * @param expenseReport
	 * @param document
	 * @return documentNo
	 */
	public int insertExpenseReport(ExpenseReport expenseReport, Document document) {
		
		Map<String , Object> erMap1 = new HashMap<String, Object>();
		erMap1.put("memberNo", document.getMemberNo());
		erMap1.put("workNo", document.getWorkNo());
		erMap1.put("documentTitle", document.getDocumentTitle());
		erMap1.put("documentEtc", document.getDocumentEtc());
		
		System.out.println(erMap1);
		
		int result1 = sqlSession.insert("signMapper.insertExpenseReport1", erMap1);
		int result2 = sqlSession.insert("signMapper.insertExpenseReport2", erMap1);
		
		Map<String , Object> erMap2 = new HashMap<String, Object>();
		erMap2.put("documentNo", document.getDocumentNo());
		erMap2.put("expenseDept", expenseReport.getExpenseDept());
		erMap2.put("expensePurpose", expenseReport.getExpensePurpose());
		erMap2.put("accountPhone", expenseReport.getAccountPhone());
		erMap2.put("accountDt", expenseReport.getAccountDt());
		erMap2.put("deliveryStartDt", expenseReport.getDeliveryStartDt());
		erMap2.put("deliveryEndDt", expenseReport.getDeliveryEndDt());
		erMap2.put("paymentMethod", expenseReport.getPaymentMethod());
		
		int result3 = sqlSession.insert("signMapper.insertExpenseReport3", erMap2);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			return expenseReport.getDocumentNo();
		}else {
			return 0;
		}
	}


	/** 구매 목록 삽입(list)
	 * @param pList
	 */
	public void insertPurchaseList(List<PurchaseList> pList) {
		sqlSession.insert("signMapper.insertPurchaseList", pList);
	}


	/** 회의록 작성
	 * @param meeting
	 * @param document
	 * @return documentNo
	 */
	public int insertMeeting(Meeting meeting, Document document) {
		return 0;
	}

	

}
