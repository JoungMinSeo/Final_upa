package edu.fin.upa.workspace.model.service;

import java.util.List;

import edu.fin.upa.calendar.model.vo.Workspace;

public interface WorkspaceService {


	/** 내가 참여중인 워크스페이스 목록 조회
	 * @param memberNo
	 * @return list
	 */
	List<Workspace> selectWorkList(int memberNo);

	/** 참여중인 워크스페이스 정보 조회
	 * @param workNo
	 * @return workspace
	 */
	Workspace selectWorkspace(int workNo);

	/** 워크스페이스 추가 
	 * @param inputWork
	 * @return workspace
	 */
	void addWorkspace(Workspace inputWork);

	/** 워크스페이스조인 추가
	 * @param inputWork
	 */
	void addWorkspaceJoin(Workspace inputWork);

}
