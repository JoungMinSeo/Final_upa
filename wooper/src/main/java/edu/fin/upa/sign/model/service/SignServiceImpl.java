package edu.fin.upa.sign.model.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.dao.SignDAO;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.sign.model.vo.ExpenseReport;
import edu.fin.upa.sign.model.vo.Meeting;
import edu.fin.upa.sign.model.vo.PurchaseList;
import edu.fin.upa.sign.model.vo.Vacation;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;

@Service
public class SignServiceImpl implements SignService {
	
	@Autowired
	private SignDAO dao;

	
	// 작성한 문서 수 조회
	@Override
	public Pagination getMyDocuPagination(Pagination pg, Member loginMember) {
		
		// 1) 작성한 문서 수 조회
		Map<String , Object> myDocuMap = new HashMap<String, Object>();
		myDocuMap.put("workNo", pg.getWorkNo());
		myDocuMap.put("memberNo", loginMember.getMemberNo());
		
		Pagination selectPg = dao.getMyDocuListCount(myDocuMap);
		
		// 2) 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getWorkNo());
	}

	// 작성한 문서 목록 조회
	@Override
	public List<Document> selectMyDocumentList(Pagination myDocuPagination, Member loginMember) {
		return dao.selectMyDocumentList(myDocuPagination, loginMember);
	}

	// 임시보관함 문서 수 조회
	@Override
	public Pagination getMyTempDocuPagination(Pagination pg, Member loginMember) {
		
		// 1) 임시보관함 문서 수 조회
		Map<String , Object> myTempDocuMap = new HashMap<String, Object>();
		myTempDocuMap.put("workNo", pg.getWorkNo());
		myTempDocuMap.put("memberNo", loginMember.getMemberNo());
		
		Pagination selectPg = dao.getMyTempDocuListCount(myTempDocuMap);
		
		// 2) 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getWorkNo());
	}

	// 임시보관함 문서 목록 조회
	@Override
	public List<Document> selectMyTempDocumentList(Pagination myTempDocuPagination, Member loginMember) {
		return dao.selectMyTempDocumentList(myTempDocuPagination, loginMember);
	}

	// 워크스페이스 참가자 목록 조회
	@Override
	public List<WorkspaceJoin> selectWorkspaceJoin(int workNo) {
		return dao.selectWorkspaceJoin(workNo);
	}

	// 회원 직급 조회
	@Override
	public String selectRank(int workNo, int memberNo) {
		
		Map<String , Object> rMap = new HashMap<String, Object>();
		rMap.put("workNo", workNo);
		rMap.put("memberNo", memberNo);
		
		return dao.selectRank(rMap);
	}

	// 품의서 작성
	@Override
	public int insertExpenseReport(ExpenseReport expenseReport, Document document) {
		
		expenseReport.setExpenseDept( replaceParameter( expenseReport.getExpenseDept() ) );
		document.setDocumentTitle( replaceParameter( document.getDocumentTitle() ) );
		expenseReport.setExpensePurpose( replaceParameter( expenseReport.getExpensePurpose() ) );
		expenseReport.setPaymentMethod( replaceParameter( expenseReport.getPaymentMethod() ) );
		document.setDocumentEtc( replaceParameter( document.getDocumentEtc() ) );
		document.setDocumentEtc( document.getDocumentEtc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		int DocumentNo = dao.insertExpenseReport(expenseReport, document);
		
		if(DocumentNo > 0) {
			List<PurchaseList> pList = new ArrayList<PurchaseList>();
			
			if(!pList.isEmpty()) {
				
				dao.insertPurchaseList(pList);
			}
		}
		return DocumentNo;
	}
	
	// 회의록 작성
	@Override
	public int insertMeeting(Meeting meeting, Document document) {

		meeting.setMeetingDept( replaceParameter( meeting.getMeetingDept() ) );
		document.setDocumentTitle( replaceParameter( document.getDocumentTitle() ) );
		meeting.setMeetingPurpose( replaceParameter( meeting.getMeetingPurpose() ) );
		meeting.setMeetingPurpose( meeting.getMeetingPurpose().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		meeting.setMeetingContent( replaceParameter( meeting.getMeetingContent() ) );
		meeting.setMeetingContent( meeting.getMeetingContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		int DocumentNo = dao.insertMeeting(meeting, document);
		
		return DocumentNo;
	}
	
	// 휴가신청서 작성
	@Override
	public int insertVacation(Vacation vacation, Document document) {
		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 크로스 사이트 스크립트 방지 처리 메소드
			public static String replaceParameter(String param) {
				String result = param;
				if(param != null) {
					result = result.replaceAll("&", "&amp;");
					result = result.replaceAll("<", "&lt;");
					result = result.replaceAll(">", "&gt;");
					result = result.replaceAll("\"", "&quot;");
				}
				
				return result;
			}






}
