package edu.fin.upa.list.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.list.model.vo.ListList;
import edu.fin.upa.member.model.vo.Member;

@Repository
public class ListDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 리스트 조회
	 * @param cardList
	 * @return list
	 */
	public List<ListList> selectList(List<Card> cardList) {
		return sqlSession.selectList("listMapper.selectList", cardList);
	}
	
	
	/** 리스트 삽입
	 * @param llist
	 */
	public void insertLlist(ListList llist) {
		sqlSession.insert("listMapper.insertLlist", llist);
	}


	/** 리스트 삭제
	 * @param listNo
	 */
	public void deleteList(int listNo) {
		sqlSession.update("listMapper.deleteList", listNo);
	}


	/** 리스트 드랍했을때
	 * @param dlist
	 */
	public void dropList(ListList dlist) {
		sqlSession.update("listMapper.dropList", dlist);
	}


	/** 단순 리스트 조회
	 * @param dropListNo
	 * @return list
	 */
	public ListList selectListView(int dropListNo) {
		return sqlSession.selectOne("listMapper.selectListView", dropListNo);
	}


	/** 리스트 참여자 멤버 삽입
	 * @param llist
	 */
	public void insertListJoin(ListList llist) {
		sqlSession.insert("listMapper.insertListJoin", llist);
	}

 
	/** 리스트 삽입 상태
	 * @param llist
	 */
	public void insertListDo(ListList llist) {
		sqlSession.insert("listMapper.insertListDo", llist);
	}


	/** 리스트 참여 멤버 조회
	 * @param dropListNo
	 * @return joinMemList
	 */
	public List<Member> selectMemList(int dropListNo) {
		return sqlSession.selectList("listMapper.selectMemList", dropListNo);
	}


	


}
