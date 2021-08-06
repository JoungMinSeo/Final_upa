package edu.fin.upa.workspace.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.workspace.model.dao.WorkspaceDAO;

@Service
public class WorkspaceServiceImpl implements WorkspaceService{

	@Autowired
	private WorkspaceDAO dao;

	// 내가 참여중인 워크스페이스 목록 조회 
	@Override
	public List<Workspace> selectWorkList(int memberNo) {
		return dao.selectWorkList(memberNo);
	}

	// 참여중인 워크스페이스 정보 조회
	@Override
	public Workspace selectWorkspace(int workNo) {
		return dao.selectWorkspace(workNo);
	}
	
	
	
	
}
