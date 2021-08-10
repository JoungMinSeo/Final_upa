package edu.fin.upa.sign.model.service;

import java.util.List;

import edu.fin.upa.workspace.model.vo.WorkspaceJoin;

public interface SignService {

	/** 워크스페이스 참여자 조회
	 * @return workspaceJoin
	 */
	List<WorkspaceJoin> selectWorkspaceJoin();

}
