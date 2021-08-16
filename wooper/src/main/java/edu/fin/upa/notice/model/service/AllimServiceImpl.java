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

}
