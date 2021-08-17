package edu.fin.upa.calendar.model.service;

import java.util.List;
import java.util.Map;

import edu.fin.upa.calendar.model.vo.Calendar;
import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.member.model.vo.Member;

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
	/*
	 * int updateCalendar(int listNo);
	 */
	/** 팀캘린더조회
	 * @param map
	 * @return
	 */
	List<Calendar> selectTeamCal(Map<String, Object> map);

	List<Card> selectCardList(int workNo);

	List<Member> selectMemberList(int workNo);
	
	/** 새 일정 등록
	 * @param cal
	 * @return result
	 */
	int insertList(Calendar cal);

	/** 일정 수정
	 * @param cal
	 * @return result
	 */
	int updateList(int listNo, Calendar cal);

	/** 일정 삭제
	 * @param cal
	 * @return result
	 */
	int deleteList(int listNo2);


}
