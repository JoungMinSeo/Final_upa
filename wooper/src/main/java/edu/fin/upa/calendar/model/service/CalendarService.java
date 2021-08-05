package edu.fin.upa.calendar.model.service;

import java.util.List;

import edu.fin.upa.calendar.model.vo.Calendar;

public interface CalendarService {

	List<Calendar> selectCalendar(String startDate);
	
}
