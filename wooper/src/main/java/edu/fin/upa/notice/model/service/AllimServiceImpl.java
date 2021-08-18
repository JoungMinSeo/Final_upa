package edu.fin.upa.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.notice.model.dao.AllimDAO;
import edu.fin.upa.notice.model.vo.Allim;

@Service
public class AllimServiceImpl implements AllimService{

	@Autowired
	private AllimDAO allimDao;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Integer> insertAllim(Allim allim) {
		int result =allimDao.insertAllim(allim);
		
		return allimDao.selectMemberList(allim); 
	}
	
	// 알림조회
	@Override
	public List<Allim> selectAllim(int memberNo) {
		return allimDao.selectAllim(memberNo);
	}

	// 알림 조회 시 읽음 처리
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int readAllim(int allimNo) {
		return allimDao.readAllim(allimNo);
	}

	// 알림 조회 시 읽지않음 처리
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int unreadAllim(int allimNo) {
		return allimDao.unreadAllim(allimNo);
	}

	// 알림삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteAllim(Allim allim) {
		return allimDao.deleteAllim(allim);
	}


}
