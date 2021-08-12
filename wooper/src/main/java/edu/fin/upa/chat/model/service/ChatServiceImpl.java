package edu.fin.upa.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fin.upa.chat.model.dao.ChatDAO;
import edu.fin.upa.chat.model.vo.ChatRoom;
import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDAO dao;

	// 채팅방 목록 조회
	@Override
	public List<ChatRoom> selectRoomList() {
		return dao.selectRoomList();
	}
	
	// 멤버 조회
	@Override
	public List<Member> selectMemberList(Search search) {
		
		return dao.selectMemberList(search);
	}
	
}
