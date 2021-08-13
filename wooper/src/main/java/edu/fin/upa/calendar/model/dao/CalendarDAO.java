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

	/** 개인 캘린더 조회 
	 * @param map
	 * @return
	 */
	public List<Calendar> selectCalendar(Map<String, Object> map) {
		return sqlSession.selectList("calMapper.selectCalendar", map);
	}

	/** 개인 캘린더 수정
	 * @param listNo
	 * @return
	 */
	public int updateCalendar(int listNo) {
		return sqlSession.update("calMapper.updateCalendar", listNo);
	}

	/** 팀캘린더 조회 
	 * @param map
	 * @return
	 */
	public List<Calendar> selectTeamCal(Map<String, Object> map) {
		return sqlSession.selectList("calMapper.selectTeamCal", map);
	}
	


}
