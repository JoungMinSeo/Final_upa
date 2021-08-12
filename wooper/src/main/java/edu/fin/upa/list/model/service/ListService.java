package edu.fin.upa.list.model.service;

import java.util.List;

import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.list.model.vo.ListList;

public interface ListService {

	/** 카드에 대한 리스트 조회
	 * @param cardList
	 * @return list
	 */
	List<ListList> selectList(List<Card> cardList);
	
	/** 리스트 삽입
	 * @param Llist
	 */
	void insertLlist(ListList llist);

	/** 리스트 삭제
	 * @param listNo
	 */
	void deleteList(int listNo);

	/** 리스트 드랍됫을때
	 * @param dlist
	 */
	void dropList(ListList dlist);

	
	
}
