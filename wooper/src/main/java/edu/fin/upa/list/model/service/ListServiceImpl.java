package edu.fin.upa.list.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.list.model.dao.ListDAO;
import edu.fin.upa.list.model.vo.ListList;

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
	
	
	
	
	
	
}
