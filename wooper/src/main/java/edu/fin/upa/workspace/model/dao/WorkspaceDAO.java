package edu.fin.upa.workspace.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.calendar.model.vo.Workspace;

@Repository
public class WorkspaceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 내가 참여중인 워크스페이스 목록 조회 
	 * @param memberNo
	 * @return list
	 */
	public List<Workspace> selectWorkList(int memberNo) {
		return sqlSession.selectList("workspaceMapper.selectWorkList", memberNo);
	}

	/** 참여중인 워크스페이스 정보 조회
	 * @param workNo
	 * @return workspace
	 */
	public Workspace selectWorkspace(int workNo) {
		return sqlSession.selectOne("workspaceMapper.selectWorkspace", workNo);
	}

	/** 워크스페이스 추가
	 * @param inputWork
	 */
	public void addWorkspace(Workspace inputWork) {
		sqlSession.insert("workspaceMapper.addWorkspace", inputWork);
	}

	/** 워크스페이스조인 추가
	 * @param inputWork
	 */
	public void addWorkspaceJoin(Workspace inputWork) {
		sqlSession.insert("workspaceMapper.addWorkspaceJoin", inputWork);
	}


}
