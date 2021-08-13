package edu.fin.upa.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.calendar.model.dao.CalendarDAO;
import edu.fin.upa.calendar.model.vo.Calendar;


@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAO dao;
	
	// 개인 캘린더 조회 
	@Override
	public List<Calendar> selectCalendar(Map<String, Object> map) {
		return dao.selectCalendar(map);
	}

	// 개인캘린더 수정
	@Override
	public int updateCalendar(int listNo) {
		return dao.updateCalendar(listNo);
	}

	// 팀캘린더 조회 
	@Override
	public List<Calendar> selectTeamCal(Map<String, Object> map) {
		return dao.selectTeamCal(map);
	}



	
}
