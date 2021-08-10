package edu.fin.upa.card.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.card.model.dao.CardDAO;

@Service
public class CardServiceImpl implements CardService{

	@Autowired
	private CardDAO dao; 
	
	
}
