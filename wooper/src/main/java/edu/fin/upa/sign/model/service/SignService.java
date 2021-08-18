package edu.fin.upa.sign.model.service;

import java.util.List;

import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.sign.model.vo.MeetingJoin;
import edu.fin.upa.sign.model.vo.PurchaseList;
import edu.fin.upa.sign.model.vo.SignLine;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;

public interface SignService {


	/** 작성한 문서 수 조회
	 * @param pg
	 * @param loginMember
	 * @return myDocuPagination
	 */
	Pagination getMyDocuPagination(Pagination pg, Member loginMember);

	/** 작성한 문서 목록 조회 
	 * @param myDocuPagination
	 * @return documentList
	 */
	List<Document> selectMyDocumentList(Pagination myDocuPagination, Member loginMember);

	/** 결재할 문서 수 조회
	 * @param pg
	 * @param loginMember
	 * @return signDocuPagination
	 */
	Pagination getSignDocuPagination(Pagination pg, Member loginMember);
	
	/** 결재할 문서 목록 조회 
	 * @param myTempDocuPagination
	 * @return signDocumentList
	 */
	List<Document> selectSignDocumentList(Pagination signDocuPagination, Member loginMember);
	
	/** 팀 문서 수 조회
	 * @param pg
	 * @param loginMember
	 * @return teamDocuPagination
	 */
	Pagination getTeamDocuPagination(Pagination pg, Member loginMember);
	
	/** 팀 문서 목록 조회 
	 * @param myTempDocuPagination
	 * @return documentList
	 */
	List<Document> selectTeamDocumentList(Pagination teamDocuPagination, Member loginMember);

	/** 임시보관함 문서 수 조회
	 * @param pg
	 * @param loginMember
	 * @return myTempDocuPagination
	 */
	Pagination getMyTempDocuPagination(Pagination pg, Member loginMember);

	/** 임시보관함 문서 목록 조회
	 * @param myTempDocuPagination
	 * @return myTempDocumentList
	 */
	List<Document> selectMyTempDocumentList(Pagination myTempDocuPagination, Member loginMember);

	/** 결재 문서 상세 조회
	 * @param documentNo
	 * @param memberNo
	 * @return document
	 */
	Document selectDocument(int documentNo, int memberNo);
	
	/** 워크스페이스 참가자 목록 조회
	 * @param workNo
	 * @return workspaceJoin
	 */
	List<WorkspaceJoin> selectWorkspaceJoin(int workNo);

	/** 회원 직급 조회
	 * @param workNo
	 * @param memberNo
	 * @return memberRank
	 */
	String selectRank(int workNo, int memberNo);

	/** 품의서 작성
	 * @param document
	 * @return documentNo
	 */
	int insertExpenseReport(Document document);

	/** 회의록 작성
	 * @param document
	 * @return documentNo
	 */
	int insertMeeting(Document document);

	/** 휴가신청서 작성
	 * @param document
	 * @return documentNo
	 */
	int insertVacation(Document document);

	/** 게시글 수정용 상세 조회
	 * @param documentNo
	 * @return document
	 */
	Document selectUpdateDocument(int documentNo);

	/** 품의서 수정
	 * @param document
	 * @param plist
	 * @param deletedpList
	 * @return result
	 */
	int updateExpenseReport(Document document, List<PurchaseList> pList, List<PurchaseList> deletedpList);

	/** 회의록 수정
	 * @param document
	 * @param meetingJoin
	 * @param deletedMeetingJoin
	 * @return result
	 */
	int updateMeeting(Document document, List<MeetingJoin> meetingJoin, List<MeetingJoin> deletedMeetingJoin);

	/** 휴가신청서 수정
	 * @param document
	 * @return result
	 */
	int updateVacation(Document document);

	/** 전자결재 문서 삭제
	 * @param documentNo
	 * @return result
	 */
	int deleteDocument(int documentNo);

	/** 결재 회원 검색
	 * @param search
	 * @param workNo 
	 * @return signMemList
	 */
	List<WorkspaceJoin> selectSignMemList(Search search, int workNo);

	/** 결재선 지정
	 * @param document
	 * @param signLine
	 * @param viewer
	 * @return result
	 */
	int insertSignLine(Document document, int[] signLine, int[] viewer);
	

	/** 결재 진행
	 * @param document
	 */
	void signDocument(SignLine signLine);









}
