package edu.fin.upa.notice.model.service;

import java.util.List;

import edu.fin.upa.notice.model.vo.Allim;

public interface AllimService {

	/** 새 게시글 작성 시 알림 추가
	 * @param allim
	 * @return result
	 */
	List<Integer> insertAllim(Allim allim);

	/** 알림 조회
	 * @param allim
	 * @return
	 */
	List<Allim> selectAllim(int memberNo);

	/** 알림 조회 시 읽음 처리
	 * @param allim
	 * @return
	 */
	int readAllim(int allimNo);

	/** 알림 조회 시 읽지않음 처리
	 * @param allim
	 * @return
	 */
	int unreadAllim(int allimNo);

	/** 알림삭제
	 * @param allim
	 * @return
	 */
	int deleteAllim(Allim allim);








}
