package edu.fin.upa.chat.model.service;

import java.util.List;

import edu.fin.upa.chat.model.vo.ChatRoom;
import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.member.model.vo.Member;

public interface ChatService {
	
	// 채팅방 목록 조회
	List<ChatRoom> selectRoomList();

	// 멤버 조회
	List<Member> selectMemberList(Search search);

}
