package edu.fin.upa.card.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.calendar.model.vo.Card;

@Repository
public class CardDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 현재 참여중인 워크스페이스 카드리스트 얻어오기
	 * @param workNo
	 * @return list
	 */
	public List<Card> selectCardList(int workNo) {
		return sqlSession.selectList("cardMapper.selectCardList", workNo);
	}

	/** 카드 삽입
	 * @param card
	 */
	public void insertCard(Card card) {
		sqlSession.insert("cardMapper.insertCard", card);
	}

	/** 카드 삭제
	 * @param cardNo
	 */
	public void deleteCard(int cardNo) {
		sqlSession.update("cardMapper.deleteCard", cardNo);
	}

	/** 카드 이름 변경
	 * @param card
	 */
	public void updateCard(Card card) {
		sqlSession.update("cardMapper.updateCard", card);
	}

	
	
}
