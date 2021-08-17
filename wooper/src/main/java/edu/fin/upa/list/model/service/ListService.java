package edu.fin.upa.list.model.service;

import java.util.List;

import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.list.model.vo.ListList;
import edu.fin.upa.member.model.vo.Member;

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

	/** 단순 리스트 조회
	 * @param dropListNo
	 * @return list
	 */
	ListList selectListView(int dropListNo);

	/** 리스트 참여자 멤버 삽입
	 * @param llist
	 */
	void insertListJoin(ListList llist);

	/** 리스트 삽입 상태
	 * @param llist
	 */
	void insertListDo(ListList llist);

	/** 리스트 참여 멤버 조회
	 * @param dropListNo
	 * @return joinMemList
	 */
	List<Member> selectMemList(int dropListNo);

	/** 해당 리스트 참여 멤버 조회
	 * @param listList
	 * @return listJoinMemList
	 */
	List<Member> listJoinMemList(List<ListList> listList);



	
	
}
