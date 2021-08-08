package edu.fin.upa.management.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.management.model.dao.ManagementDAO;


@Service
public class ManagementServiceImpl implements ManagementService{
	
	@Autowired
	private ManagementDAO dao;

}
