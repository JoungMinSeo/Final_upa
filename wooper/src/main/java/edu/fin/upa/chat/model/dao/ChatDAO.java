package edu.fin.upa.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.fin.upa.chat.model.vo.ChatMessage;
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
		
		return sqlSession.selectList("chatMapper.selectMemberList",search);
	}
	
	// 다음 채팅방 번호 조회
	public int nextChatRoomNo() {
		return sqlSession.selectOne("chatMapper.nextChatRoomNo");
	}

	// 채팅방 개설
	public int createChatRoom(ChatRoom room) {
		return sqlSession.insert("chatMapper.createChatRoom",room);
	}

	// 채팅방 사람 넣기
	public int insertChatRoom(Map<String, Object> map) {
		
		System.out.println(map);
		return sqlSession.insert("chatMapper.insertChatRoom",map);
	}

	// 채팅 목록 조회
	public List<ChatMessage> selectChat(int chatRoomNo) {

		return sqlSession.selectList("chatMapper.selectChat",chatRoomNo);
	}
	
	// 채팅 내용 삽입
	public int insertMessage(ChatMessage cm) {
		return sqlSession.insert("chatMapper.insertMessage",cm);
	}
	
}
