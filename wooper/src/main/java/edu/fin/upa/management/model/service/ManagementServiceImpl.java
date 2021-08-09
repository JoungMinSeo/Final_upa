package edu.fin.upa.management.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.management.model.dao.ManagementDAO;
import edu.fin.upa.management.model.vo.Management;
import edu.fin.upa.management.model.vo.Pagination;


@Service
public class ManagementServiceImpl implements ManagementService{
	
	@Autowired
	private ManagementDAO mDao;

	// 특정 팀의 모든 팀원 수 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg =mDao.getListCount(pg.getWorkNo());
		
		System.out.println(selectPg);
		
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getWorkNo(), selectPg.getWorkNm());
	}

	// 멤버 리스트조회
	@Override
	public List<Management> selectMemberList(Pagination pagination) {
		return mDao.selectMemberList(pagination);
	}

	// 회원 등급 수정
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateMemberRank(Management management) {
		
		int result = mDao.updateMemberRank(management);
		
		return result;
	}

	// 팀 회원 삭제
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int deleteJoinMember(int workNo, Management management) {
		
		int result = 0;
		
		result=mDao.deleteJoinMember(workNo, management);
		
		return result;
	}
	
	



}
