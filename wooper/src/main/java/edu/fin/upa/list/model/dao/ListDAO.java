package edu.fin.upa.list.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.list.model.vo.ListList;

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
}
