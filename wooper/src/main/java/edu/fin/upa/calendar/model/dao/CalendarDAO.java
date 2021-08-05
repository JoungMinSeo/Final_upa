package edu.fin.upa.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.calendar.model.vo.Calendar;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Calendar> selectCalendar(String startDate) {
		return sqlSession.selectList("calMapper.selectCalendar", startDate);
	}

}
