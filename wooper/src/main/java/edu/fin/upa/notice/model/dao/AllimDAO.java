package edu.fin.upa.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.notice.model.vo.Allim;

@Repository
public class AllimDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 전달할 알림메시지 추가
	 * @param allim
	 * @return
	 */
	public int insertAllim(Allim allim) {
		return sqlSession.insert("allimMapper.insertAllim", allim);
	}

	/** 알림전송받을 멤버 조회 : 현재 워크스페이스에 참여중인 멤버
	 * @param allim
	 * @return
	 */
	public List<Integer> selectMemberList(Allim allim) {
		return sqlSession.selectList("allimMapper.selectMemberList", allim);
	}
	
	/** 알림내역 조회 
	 * @param allim
	 * @return
	 */
	public List<Integer> selectAllim(Allim allim) {
		return sqlSession.selectList("allimMapper.selectAllim", allim);
	}

	/** 알림 조회 시 읽음 처리
	 * @param allim
	 * @return
	 */
	public int readAllim(Allim allim) {
		return sqlSession.update("allimMapper.readAllim", allim);
	}

	/** 알림 조회 시 읽지않음 처리
	 * @param allim
	 * @return
	 */
	public int unreadAllim(Allim allim) {
		return sqlSession.update("allimMapper.unreadAllim", allim);
	}

	/** 알림삭제 
	 * @param allim
	 * @return
	 */
	public int deleteAllim(Allim allim) {
		return sqlSession.update("allimMapper.deleteAllim", allim);
	}


}
