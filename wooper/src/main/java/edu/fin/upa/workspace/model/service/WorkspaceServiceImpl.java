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

	// 워크스페이스 추가
	@Override
	public void addWorkspace(Workspace inputWork) {
		dao.addWorkspace(inputWork);
	}

	// 워크스페이스조인 추가
	@Override
	public void addWorkspaceJoin(Workspace inputWork) {
		dao.addWorkspaceJoin(inputWork);
	}

	// 워크스페이스 나가기 조인테이블 delete
	@Override
	public int deleteWorkspace(int workNo) {
		return dao.deleteWorkspace(workNo);
	}

	// 워크스페이스에 왕도롱뇽이 몇명인지 확인
	@Override
	public int selectKing(int workNo) {
		return dao.selectKing(workNo);
	}

	// 워크스페이스에 멤버가 몇명인지 확인
	@Override
	public int selectJoinMember(int workNo) {
		return dao.selectJoinMember(workNo);
	}

	//  워크스페이스 상태 n 만들기
	@Override
	public void updateWorkspaceStatus(int workNo) {
		dao.updateWorkspaceStatus(workNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
