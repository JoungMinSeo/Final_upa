package edu.fin.upa.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.calendar.model.vo.Calendar;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 캘린더 조회 
	 * @param map
	 * @return
	 */
	public List<Calendar> selectCalendar(Map<String, Object> map) {
		return sqlSession.selectList("calMapper.selectCalendar", map);
	}


}
