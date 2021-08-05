package edu.fin.upa.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.calendar.model.dao.CalendarDAO;
import edu.fin.upa.calendar.model.vo.Calendar;



@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAO dao;
	
	@Override
	public List<Calendar> selectCalendar(String startDate) {
		return dao.selectCalendar(startDate);
	}
	
}
