package edu.fin.upa.calendar.model.service;

import java.util.List;

import edu.fin.upa.calendar.model.vo.CalendarTest;

public interface CalendarService {

	List<CalendarTest> selectCalTest(String startDate);
	
}
