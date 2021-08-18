package edu.fin.upa.chat.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.chat.model.dao.ChatDAO;
import edu.fin.upa.chat.model.vo.ChatMessage;
import edu.fin.upa.chat.model.vo.ChatRoom;
import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDAO dao;

	// 채팅방 목록 조회
	@Override
	public List<ChatRoom> selectRoomList(int memberNo) {
		return dao.selectRoomList(memberNo);
	}
	
	// 멤버 조회
	@Override
	public List<Member> selectMemberList(Search search) {
		
		return dao.selectMemberList(search);
	}

	// 채팅방 개설
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int createChatRoom(ChatRoom room) {
		
		int chatRoomNo = dao.nextChatRoomNo();
		
		System.out.println("서비스 채팅방 번호 " + chatRoomNo);
		
		if (chatRoomNo > 0) { 
			
			room.setChatRoomNo(chatRoomNo);
			
			System.out.println("서비스 채팅룸 : " + room);
			
			int result = dao.createChatRoom(room);
			
			if(result == 0) {
				chatRoomNo = 0;
			}
		}
		
		return chatRoomNo;
	}
	
	// 채팅방 들어가기
	@Override
	public int insertChatRoom(int memberJoinNo, int chatRoomNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberJoinNo", memberJoinNo);
		map.put("chatRoomNo", chatRoomNo);
		
		return dao.insertChatRoom(map);
	}
	
	// 채팅 목록 조회
	@Override
	public List<ChatMessage> selectChat(int chatRoomNo) {
		
		
		return dao.selectChat(chatRoomNo);
	}

	// 채팅 내용 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMessage(ChatMessage cm) {
		
		return dao.insertMessage(cm);
	}
	
}
