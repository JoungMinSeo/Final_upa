package edu.fin.upa.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.calendar.model.dao.CalendarDAO;
import edu.fin.upa.calendar.model.vo.Calendar;
import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.member.model.vo.Member;


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

	// 팀 카드 목록 조회
	@Override
	public List<Card> selectCardList(int workNo) {
		return dao.selectCardList(workNo);
	}

	// 팀 멤버 조회
	@Override
	public List<Member> selectMemberList(int workNo) {
		return dao.selectMemberList(workNo);
	}

	// 새 일정 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertList(Calendar cal) {
		int result =dao.insertList(cal); 
		
		if(result > 0) {
			if(cal.getSelectMemNo().length != 0) {
				result = dao.insertListJoin(cal);
			}
			result = dao.insertListDo(cal);
		}
		
		return  result;
	}

	// 일정 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateList(Calendar cal) {
		return dao.updateList(cal);
	}

	// 일정 삭제 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteList(int listNo2) {
		return dao.deleteList(listNo2);
	}

	
	
	


	
}
