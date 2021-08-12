package edu.fin.upa.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.chat.model.vo.ChatRoom;
import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.member.model.vo.Member;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 채팅방 리스트 조회
	public List<ChatRoom> selectRoomList() {
		return sqlSession.selectList("chatMapper.selectChatRoomList");
	}

	// 멤버 조회
	public List<Member> selectMemberList(Search search) {
		
		System.out.println(search);
		return sqlSession.selectList("chatMapper.selectMemberList",search);
	}
	
}
