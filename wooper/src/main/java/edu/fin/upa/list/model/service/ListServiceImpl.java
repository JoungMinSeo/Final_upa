package edu.fin.upa.list.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.list.model.dao.ListDAO;
import edu.fin.upa.list.model.vo.ListList;
import edu.fin.upa.member.model.vo.Member;

@Service
public class ListServiceImpl implements ListService {

	@Autowired
	private ListDAO dao;

	// 카드에 대한 리스트 조회
	@Override
	public List<ListList> selectList(List<Card> cardList) {
		return dao.selectList(cardList);
	}
	
	// 리스트 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertLlist(ListList llist) {
		dao.insertLlist(llist);
	}

	// 리스트 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteList(int listNo) {
		dao.deleteList(listNo);
	}

	// 리스트 드랍했을때
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void dropList(ListList dlist) {
		dao.dropList(dlist);
	}

	// 단순 리스트 조회
	@Override
	public ListList selectListView(int dropListNo) {
		return dao.selectListView(dropListNo);
	}

	// 리스트 참여자 멤버 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertListJoin(ListList llist) {
		dao.insertListJoin(llist);
	}

	// 리스트 삽입 상태
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertListDo(ListList llist) {
		dao.insertListDo(llist);
	}

	// 리스트 참여 멤버 조회
	@Override
	public List<Member> selectMemList(int dropListNo) {
		return dao.selectMemList(dropListNo);
	}

	// 해당 리스트 참여 멤버 조회
	@Override
	public List<Member> listJoinMemList(List<ListList> listList) {
		return dao.listJoinMemList(listList);
	}

	//리스트 참여자 업데이트시 기존 참여자 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteListJoin(int upListNo) {
		dao.deleteListJoin(upListNo);
		
	}

	//리스트 상태 업데이트
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void updateListStatus(ListList upLlist) {
		dao.updateListStatus(upLlist);
	}

	// 리스트 바뀐 내용 업데이트
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void updateList(ListList upLlist) {
		dao.updateList(upLlist);
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
