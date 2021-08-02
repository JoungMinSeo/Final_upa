/*
 * package edu.fin.upa.calendar.model.dao;
 * 
 * import java.util.List;
 * 
 * import org.mybatis.spring.SqlSessionTemplate; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Repository;
 * 
 * import edu.fin.upa.calendar.model.vo.CalendarTest;
 * 
 * @Repository public class CalendarDAO {
 * 
 * @Autowired private SqlSessionTemplate sqlSession;
 * 
 * public List<CalendarTest> selectCalTest(String startDate) { return
 * sqlSession.selectList("calMapper.selectCalTest", startDate); }
 * 
 * }
 */