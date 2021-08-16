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
	
	/** 
	 * @param allim
	 * @return
	 */
	public int insertAllim(Allim allim) {
		return sqlSession.insert("allimMapper.insertAllim", allim);
	}

	public List<Integer> selectMemberList(Allim allim) {
		return sqlSession.selectList("allimMapper.selectMemberList", allim);
	}

}
