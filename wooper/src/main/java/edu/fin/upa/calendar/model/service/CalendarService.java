package edu.fin.upa.calendar.model.service;

import java.util.List;
import java.util.Map;

import edu.fin.upa.calendar.model.vo.Calendar;

public interface CalendarService {

	
	/** 캘린더 조회
	 * @param map
	 * @return
	 */
	List<Calendar> selectCalendar(Map<String, Object> map);

}
