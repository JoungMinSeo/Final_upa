package edu.fin.upa.sign.model.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.dao.SignDAO;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.sign.model.vo.MeetingJoin;
import edu.fin.upa.sign.model.vo.PurchaseList;
import edu.fin.upa.sign.model.vo.SignLine;
import edu.fin.upa.sign.model.vo.Viewer;
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

	// 결재할 문서 수 조회
	@Override
	public Pagination getSignDocuPagination(Pagination pg, Member loginMember) {
		
		// 1) 결재할 문서 수 조회
		Map<String , Object> signDocuMap = new HashMap<String, Object>();
		signDocuMap.put("workNo", pg.getWorkNo());
		signDocuMap.put("memberNo", loginMember.getMemberNo());
		
		Pagination selectPg = dao.getSignDocuListCount(signDocuMap);
		
		// 2) 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getWorkNo());
	}

	// 결재할 문서 목록 조회
	@Override
	public List<Document> selectSignDocumentList(Pagination signDocuPagination, Member loginMember) {
		return dao.selectSignDocumentList(signDocuPagination, loginMember);
	}
	
	// 팀 문서 수 조회
	@Override
	public Pagination getTeamDocuPagination(Pagination pg, Member loginMember) {
		// 1) 결재할 문서 수 조회
		Map<String , Object> teamDocuMap = new HashMap<String, Object>();
		teamDocuMap.put("workNo", pg.getWorkNo());
		teamDocuMap.put("memberNo", loginMember.getMemberNo());
				
		Pagination selectPg = dao.getTeamDocuListCount(teamDocuMap);
				
		// 2) 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getWorkNo());
	}

	// 팀 문서 목록 조회
	@Override
	public List<Document> selectTeamDocumentList(Pagination teamDocuPagination, Member loginMember) {
		return dao.selectTeamDocumentList(teamDocuPagination, loginMember);
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
	
	// 결재 문서 상세 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Document selectDocument(int documentNo, int memberNo) {
		
		// 결재 문서문서 타입 조회
		Document temp = dao.selectDocumentType(documentNo);
		
		temp.setDocumentNo(documentNo);
		temp.setMemberNo(memberNo);
		
		System.out.println("------------------------");
		System.out.println(temp.getSignNo());
		System.out.println(temp.getMemberNo());
		System.out.println(temp.getDocumentNo());
		
		
		Document document = null;
		
		switch(temp.getDocumentType()) {
		case "1" : document= dao.selectER(temp); 
				System.out.println("ER");
				System.out.println(document);
				break;
		case "2" : document= dao.selectM(temp); break;
		case "3" : document= dao.selectV(temp);  break;
		}
		
		return document;
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
	public int insertExpenseReport(Document document) {
		
		document.setExpenseDept( replaceParameter( document.getExpenseDept() ) );
		document.setDocumentTitle( replaceParameter( document.getDocumentTitle() ) );
		document.setExpensePurpose( replaceParameter( document.getExpensePurpose() ) );
		document.setPaymentMethod( replaceParameter( document.getPaymentMethod() ) );
		document.setDocumentEtc( replaceParameter( document.getDocumentEtc() ) );
		document.setDocumentEtc( document.getDocumentEtc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		int documentNo = dao.insertExpenseReport(document);
		
		if(documentNo > 0) {
			
			for(PurchaseList pl : document.getpList()) {
				pl.setDocumentNo(documentNo);
			}
			
			int result = dao.insertPurchaseList( document.getpList());
		}
		return documentNo;
	}
	
	// 회의록 작성
	@Override
	public int insertMeeting(Document document) {

		document.setMeetingDept( replaceParameter( document.getMeetingDept() ) );
		document.setDocumentTitle( replaceParameter( document.getDocumentTitle() ) );
		document.setMeetingPurpose( replaceParameter( document.getMeetingPurpose() ) );
		document.setMeetingPurpose( document.getMeetingPurpose().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		document.setMeetingContent( replaceParameter( document.getMeetingContent() ) );
		document.setMeetingContent( document.getMeetingContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		int documentNo = dao.insertMeeting(document);
		
		if(documentNo > 0) {
			List<MeetingJoin> meetingJoinList = new ArrayList<MeetingJoin>();
			dao.insertMeetingJoinList(meetingJoinList);
			
			document.setMeetingJoin(meetingJoinList);
		}
		
		return documentNo;
	}
	
	// 휴가신청서 작성
	@Override
	public int insertVacation(Document document) {
		
		document.setDocumentTitle( replaceParameter( document.getDocumentTitle() ) );
		document.setVacationReason( replaceParameter( document.getVacationReason() ) );
		document.setVacationReason( document.getVacationReason().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		document.setDocumentEtc( replaceParameter( document.getDocumentEtc() ) );
		document.setDocumentEtc( document.getDocumentEtc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		return dao.insertVacation(document);
	}
	
	// 게시글 수정용 상세 조회
	@Override
	public Document selectUpdateDocument(int documentNo) {
		
		Document document = dao.selectDocument(documentNo);
		
		if(document.getDocumentEtc() != null)
		document.setDocumentEtc( document.getDocumentEtc().replaceAll("<br>", "\r\n") );
		
		if(document.getMeetingPurpose() != null)
		document.setMeetingPurpose( document.getMeetingPurpose().replaceAll("<br>", "\r\n") );
		
		if(document.getMeetingContent() != null)
		document.setMeetingContent( document.getMeetingContent().replaceAll("<br>", "\r\n") );
		
		if(document.getVacationReason() != null)
		document.setVacationReason( document.getVacationReason().replaceAll("<br>", "\r\n") );
		
		return document;
	}
	
	// 품의서 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateExpenseReport(Document document, List<PurchaseList> pList, List<PurchaseList> deletedpList) {

		document.setExpenseDept( replaceParameter( document.getExpenseDept() ) );
		document.setDocumentTitle( replaceParameter( document.getDocumentTitle() ) );
		document.setExpensePurpose( replaceParameter( document.getExpensePurpose() ) );
		document.setPaymentMethod( replaceParameter( document.getPaymentMethod() ) );
		document.setDocumentEtc( replaceParameter( document.getDocumentEtc() ) );
		document.setDocumentEtc( document.getDocumentEtc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		int result = dao.updateExpenseReport(document);
		
		if(result > 0) {
			if(deletedpList != null) {
				int documentNo = document.getDocumentNo();
				
				int flag = dao.deletepList(documentNo);
				
				if(flag > 0) {
					dao.insertPurchaseList(pList);
				}
			} else {
				dao.insertPurchaseList(pList);
			}
		}
		
		return result;
	}
	
	// 회의록 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMeeting(Document document, List<MeetingJoin> meetingJoin, List<MeetingJoin> deletedMeetingJoin) {

		document.setMeetingDept( replaceParameter( document.getMeetingDept() ) );
		document.setDocumentTitle( replaceParameter( document.getDocumentTitle() ) );
		document.setMeetingPurpose( replaceParameter( document.getMeetingPurpose() ) );
		document.setMeetingPurpose( document.getMeetingPurpose().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		document.setMeetingContent( replaceParameter( document.getMeetingContent() ) );
		document.setMeetingContent( document.getMeetingContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		int result = dao.updateMeeting(document);
		
		if(result > 0) {
			if(deletedMeetingJoin != null) {
				int documentNo = document.getDocumentNo();
				
				int flag = dao.deleteMeetingJoin(documentNo);
				
				if(flag > 0) {
					dao.insertMeetingJoinList(meetingJoin);
				}
			} else {
				dao.insertMeetingJoinList(meetingJoin);
			}
		}
		return result;
	}
		
	
	// 휴가신청서 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateVacation(Document document) {
		
		document.setDocumentTitle( replaceParameter( document.getDocumentTitle() ) );
		document.setVacationReason( replaceParameter( document.getVacationReason() ) );
		document.setVacationReason( document.getVacationReason().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		document.setDocumentEtc( replaceParameter( document.getDocumentEtc() ) );
		document.setDocumentEtc( document.getDocumentEtc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") );
		
		return dao.updateVacation(document);
	}
	
	
	// 전자 결재 문서 삭제
	@Override
	public int deleteDocument(int documentNo) {
		return dao.deleteDocument(documentNo);
	}
	
	
	// 결재 회원 검색
	@Override
	public List<WorkspaceJoin> selectSignMemList(Search search, int workNo) {
		return dao.selectSignMemList(search, workNo);
	}
	
	
	// 결재선 지정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertSignLine(Document document, int[] signLine, int[] viewer) {

		List<SignLine> signLineList = new ArrayList<SignLine>();
		
		for(int i = 0 ; i < signLine.length ; i ++) {
			
			SignLine s = new SignLine();
			s.setMemberNo(signLine[i]);
			s.setWorkNo(document.getWorkNo());
			s.setSignOrder(i+1);
			
			signLineList.add(s);
		}
		
		List<Viewer> viewerList = new ArrayList<Viewer>();
		
		for(int i = 0 ; i < viewer.length ; i ++) {
			
			Viewer v = new Viewer();
			v.setMemberNo(viewer[i]);
			v.setWorkNo(document.getWorkNo());
			
			viewerList.add(v);
		}

		return dao.insertSignLine(document, signLineList, viewerList);
	}

	
	// 결재 진행
	@Override
	public void signDocument(SignLine signLine) {
		dao.signDocument(signLine);
		
		if(signLine.getSignStatus().equals("2")) {
			dao.endSign(signLine);
		}else {
			dao.endSignYes(signLine);
		}
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
