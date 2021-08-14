package edu.fin.upa.sign.model.service;

import java.util.List;

import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.vo.Document;
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



}
