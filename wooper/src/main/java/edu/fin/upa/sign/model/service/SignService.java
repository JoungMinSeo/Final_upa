package edu.fin.upa.sign.model.service;

import java.util.List;

import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.sign.model.vo.ExpenseReport;
import edu.fin.upa.sign.model.vo.Meeting;
import edu.fin.upa.sign.model.vo.Vacation;
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
	 * @param expenseReport
	 * @param document
	 * @return documentNo
	 */
	int insertExpenseReport(ExpenseReport expenseReport, Document document);

	/** 회의록 작성
	 * @param meeting
	 * @param document
	 * @return documentNo
	 */
	int insertMeeting(Meeting meeting, Document document);

	/** 휴가신청서 작성
	 * @param vacation
	 * @param document
	 * @return documentNo
	 */
	int insertVacation(Vacation vacation, Document document);




}
