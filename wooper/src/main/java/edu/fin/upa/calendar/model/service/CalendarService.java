package edu.fin.upa.calendar.model.service;

import java.util.List;
import java.util.Map;

import edu.fin.upa.calendar.model.vo.Calendar;

public interface CalendarService {

	
	/** 개인캘린더 조회
	 * @param map
	 * @return
	 */
	List<Calendar> selectCalendar(Map<String, Object> map);

	/** 개인캘린더 수정
	 * @param listNo
	 * @return
	 */
	int updateCalendar(int listNo);

	/** 팀캘린더조회
	 * @param map
	 * @return
	 */
	List<Calendar> selectTeamCal(Map<String, Object> map);


}
