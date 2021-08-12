package edu.fin.upa.card.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.card.model.dao.CardDAO;


@Service
public class CardServiceImpl implements CardService{

	@Autowired
	private CardDAO dao;

	
	// 현재 참여중인 워크스페이스 카드리스트 얻어오기
	@Override
	public List<Card> selectCardList(int workNo) {
		return dao.selectCardList(workNo);
	}

	// 카드 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertCard(Card card) {
		dao.insertCard(card);
	}

	// 카드 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteCard(int cardNo) {
		dao.deleteCard(cardNo);
	}

	// 카드 이름 변경
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void updateCard(Card card) {
		dao.updateCard(card);
	}


	
	
	
	
	
	
	
	
}
