package edu.fin.upa.management.model.service;

import java.util.List;

import edu.fin.upa.management.model.vo.Management;
import edu.fin.upa.management.model.vo.Pagination;

public interface ManagementService {

	/** 멤버 리스트 조회
	 * @param pagination
	 * @return
	 */
	List<Management> selectMemberList(Pagination pagination);
	
	/** 멤버리스트 페이징 처리 
	 * @param pg
	 * @return
	 */
	Pagination getPagination(Pagination pg);

	/** 팀 멤버 초대 메일 보내기
	 * @param inputAddEmail
	 * @return result
	 */
	int invitation(Management inputAddEmail);
	
	/**  팀멤버 추가
	 * @param inputAddEmail
	 * @return result
	 */
	int addJoinMember(Management inputAddEmail);

	/** 회원등급 수정
	 * @param workNo
	 * @param memberNo
	 * @return result
	 */
	int updateMemberRank(List<Management> list);

	/** 팀 회원 삭제
	 * @param workNo
	 * @param management
	 * @return result
	 */
	int deleteJoinMember(List<Management> list);




}
