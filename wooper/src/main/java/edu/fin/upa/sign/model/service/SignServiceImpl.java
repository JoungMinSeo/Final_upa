package edu.fin.upa.sign.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.dao.SignDAO;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;

@Service
public class SignServiceImpl implements SignService {
	
	@Autowired
	private SignDAO dao;

	
	// 작성한 문서 수 조회
	@Override
	public Pagination getMyDocuPagination(Pagination pg, Member loginMember) {
		
		// 1) 작성한 문서 수 조회
		Map<String , Object> myDocuMap = new HashMap<String, Object>();
		myDocuMap.put("workNo", pg.getWorkNo());
		myDocuMap.put("memberNo", loginMember.getMemberNo());
		
		Pagination selectPg = dao.getMyDocuListCount(myDocuMap);
		
		// 2) 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getWorkNo());
	}

	// 작성한 문서 목록 조회
	@Override
	public List<Document> selectMyDocumentList(Pagination myDocuPagination, Member loginMember) {
		return dao.selectMyDocumentList(myDocuPagination, loginMember);
	}

	// 임시보관함 문서 수 조회
	@Override
	public Pagination getMyTempDocuPagination(Pagination pg, Member loginMember) {
		
		// 1) 임시보관함 문서 수 조회
		Map<String , Object> myTempDocuMap = new HashMap<String, Object>();
		myTempDocuMap.put("workNo", pg.getWorkNo());
		myTempDocuMap.put("memberNo", loginMember.getMemberNo());
		
		Pagination selectPg = dao.getMyTempDocuListCount(myTempDocuMap);
		
		// 2) 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getWorkNo());
	}

	// 임시보관함 문서 목록 조회
	@Override
	public List<Document> selectMyTempDocumentList(Pagination myTempDocuPagination, Member loginMember) {
		return dao.selectMyTempDocumentList(myTempDocuPagination, loginMember);
	}

	// 워크스페이스 참가자 목록 조회
	@Override
	public List<WorkspaceJoin> selectWorkspaceJoin(int workNo) {
		return dao.selectWorkspaceJoin(workNo);
	}
	




}
