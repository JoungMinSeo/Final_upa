package edu.fin.upa.notice.model.service;

import java.util.List;

import edu.fin.upa.notice.model.vo.Allim;

public interface AllimService {

	/** 알림 추가
	 * @param allim
	 * @return result
	 */
	List<Integer> insertAllim(Allim allim);

}
