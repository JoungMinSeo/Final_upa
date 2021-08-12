package edu.fin.upa.card.model.service;

import java.util.List;

import edu.fin.upa.calendar.model.vo.Card;

public interface CardService {

	/** 현재 참여중인 워크스페이스 카드리스트 얻어오기
	 * @param workNo
	 * @return list
	 */
	List<Card> selectCardList(int workNo);

	/** 카드 삽입
	 * @param card
	 */
	void insertCard(Card card);

	/** 카드 삭제
	 * @param cardNo
	 */
	void deleteCard(int cardNo);

	/** 카드 이름 변경
	 * @param card
	 */
	void updateCard(Card card);

	

	

}
