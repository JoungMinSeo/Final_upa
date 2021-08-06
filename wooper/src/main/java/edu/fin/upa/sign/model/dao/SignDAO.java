package edu.fin.upa.sign.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SignDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
