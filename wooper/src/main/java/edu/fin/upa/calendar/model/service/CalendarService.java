package edu.fin.upa.calendar.model.service;

import java.util.List;
import java.util.Map;

import edu.fin.upa.calendar.model.vo.Calendar;

public interface CalendarService {

	List<Calendar> selectCalendar(Map<String, Object> map);
	
}
