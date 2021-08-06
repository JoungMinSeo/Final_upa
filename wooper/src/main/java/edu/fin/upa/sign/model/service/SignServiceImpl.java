package edu.fin.upa.sign.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.sign.model.dao.SignDAO;

@Service
public class SignServiceImpl implements SignService {
	
	@Autowired
	private SignDAO dao;

}
