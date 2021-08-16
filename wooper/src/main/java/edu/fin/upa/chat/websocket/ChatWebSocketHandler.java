package edu.fin.upa.chat.websocket;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import edu.fin.upa.chat.model.service.ChatService;
import edu.fin.upa.chat.model.vo.ChatMessage;
import edu.fin.upa.member.model.vo.Member;


public class ChatWebSocketHandler extends TextWebSocketHandler{

	@Autowired
	private ChatService service;
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessions.add(session);
		System.out.println(session.getId()  + "채팅 웹소켓 연결됨");
		System.out.println(  ( (Member)session.getAttributes().get("loginMember") ).getMemberNm()  );

	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		
		System.out.println("전달 받은 내용 : " + message.getPayload());
		
		JsonObject convertedObj = new Gson().fromJson(message.getPayload() , JsonObject.class);
		
		String memberName = convertedObj.get("memberName").toString();
		String chat = convertedObj.get("chat").toString();

		memberName = memberName.substring(1,memberName.length() -1);
		chat = chat.substring(1,chat.length() -1);
		
		System.out.println("채팅 입력자 : " + memberName);
		System.out.println("채팅 내용 : " + chat);
		
		// 채팅 내용 DB 삽입 구문
		int chatRoomNo = Integer.parseInt(convertedObj.get("chatRoomNo").toString().replaceAll("\"", ""));
		int memberNo =  Integer.parseInt(convertedObj.get("memberNo").toString().replaceAll("\"", ""));
		
		
		ChatMessage cm = new ChatMessage();
		cm.setMemberNo(memberNo);
		cm.setChatRoomNo(chatRoomNo);
		cm.setMessage(chat);

		int result = service.insertMessage(cm);
		
		if (result > 0) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			convertedObj.addProperty("createDate", sdf.format(new Date()) );
			
			
			for(WebSocketSession s : sessions) {
				
				if(s.getAttributes().get("chatRoomNo") != null) {
					int joinChatRoomNo = ((Integer)s.getAttributes().get("chatRoomNo"));
					
					// 같은 채팅방일 경우
					if (chatRoomNo == joinChatRoomNo) {
						
						s.sendMessage(new TextMessage( new Gson().toJson(convertedObj) ));
						
					}
					
				}
				
			}
			
		}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessions.remove(session);
		
	}

}
