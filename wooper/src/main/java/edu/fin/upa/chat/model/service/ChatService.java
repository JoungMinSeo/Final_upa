package edu.fin.upa.chat.model.service;

import java.util.List;

import edu.fin.upa.chat.model.vo.ChatMessage;
import edu.fin.upa.chat.model.vo.ChatRoom;
import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.member.model.vo.Member;

public interface ChatService {
	
	// 채팅방 목록 조회
	List<ChatRoom> selectRoomList(int memberNo);

	// 멤버 조회
	List<Member> selectMemberList(Search search);

	// 채팅방 개설
	int createChatRoom(ChatRoom room);

	// 채팅방 들어가기
	int insertChatRoom(int memberJoinNo, int chatRoomNo);
	
	// 채팅 조회하기
	List<ChatMessage> selectChat(int chatRoomNo);
	
	// 채팅 삽입 하기
	int insertMessage(ChatMessage cm);

}
