package edu.fin.upa.sign.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.sign.model.dao.SignDAO;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;

@Service
public class SignServiceImpl implements SignService {
	
	@Autowired
	private SignDAO dao;

	// 워크스페이스 참여자 조회
	@Override
	public List<WorkspaceJoin> selectWorkspaceJoin() {
		return null;
	}

}
