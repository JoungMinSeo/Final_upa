package edu.fin.upa.chat.websocket;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
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
	
	// WebSocketHandler 인터페이스 : 웹소켓 통신을 위한 메소드를 제공하는 인터페이스
	
	// TextWebSocketHandler : 텍스트(문자열) 전용 웹소켓 통신 핸들러
	
	// WebSocketSession : 클라이언트 - 서버 전이중 통신을 담당하는 객체
	// -> 연결된 클라이언트의 Session을 다룰 수 있음
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	// Collections : 자바 컬렉션 관련 기능을 제공하는 클래스
	// synchronizedSet : 동기화된 Set 객체를 반환하는 메소드
	
	// 클라이언트 - 서버간 연결이 완료되고, 통신할 준비가 되면 실행되는 메소드
	// chatRoom.jsp 화면이 보여지고 
	// new SockJs("/chat"); 구문이 수행될 때 해당 메소드가 자동으로 수행됨
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// 연결이 완료되면 WebSocketSession이 전달되어오고, 이 안에는 HttpSession 정보가 담겨있다.
		// -> HttpSession 담겨있다 == 접속한 회원의 정보나 다른 정보도 활용할 수 있다.
		
		// Set에 접속한 사람들의 정보를 모아둠 == 채팅 기능을 이용하는 사람의 정보가 모임
		sessions.add(session);
		System.out.println(session.getId()  + "연결됨");
		System.out.println(  ( (Member)session.getAttributes().get("loginMember") ).getMemberNm()  );

	}
	
	// 클라이언트로부터 텍스트를 받았을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 매개변수 WebSocketSession session : "보내기" 버튼을 누른 사람의  SockJs가 넘어옴
		// 매개변수 TextMessage message : JSON으로 변환된 문자열이 담겨있다.
		
		System.out.println("전달 받은 내용 : " + message.getPayload());
		
		// JSON 형태의 문자열을 JsonObject로 변경하여 값을 꺼내쓸 수 있는 형태로 변환
		JsonObject convertedObj = new Gson().fromJson(message.getPayload() , JsonObject.class);
		
		// 변경된 JsonObject에서 값 추출
		// JsonObject.get("key") ->  (Object)value 반환
		String memberName = convertedObj.get("memberName").toString();
		String chat = convertedObj.get("chat").toString();
		
		// "유공일"
		// 0 1 2 3 4 
		memberName = memberName.substring(1,memberName.length() -1);
		chat = chat.substring(1,chat.length() -1);
		
		System.out.println("채팅 입력자 : " + memberName);
		System.out.println("채팅 내용 : " + chat);
		
		// 채팅 내용 DB 삽입 구문
		
		// 메세지를 보낸 사람의 채팅방 번호
		int  chatRoomNo = Integer.parseInt(convertedObj.get("chatRoomNo").toString().replaceAll("\"", ""));

		// 회원 번호를 얻어오는 방법
		// 1) WebSocketSession -> Session -> loginMember -> memberNo
		// 2) convertedObj에 있는 memberNo 사용
		int memberNo =  Integer.parseInt(convertedObj.get("memberNo").toString().replaceAll("\"", ""));
		
		// CHAT_MESSAGE 테이블에 삽입하려는 내용을 하나의 vo에 담기
		ChatMessage cm = new ChatMessage();
		cm.setMemberNo(memberNo);
		cm.setChatRoomNo(chatRoomNo);
		cm.setMessage(chat);
		
		// 채팅 메세지를 DB에 삽입하는 Service 호출
	}
	
	// 클라이언트 서버 - 서버간 연결이 종료될때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessions.remove(session);
		
	}

}
