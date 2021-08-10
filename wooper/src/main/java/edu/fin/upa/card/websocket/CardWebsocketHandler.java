package edu.fin.upa.card.websocket;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import edu.emory.mathcs.backport.java.util.Collections;
import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.member.model.vo.Member;

public class CardWebsocketHandler extends TextWebSocketHandler{

	// SockJs가 연결되면 WebSocketSession으로 들어옴 
	// -> 연결된 클라이언트의 Session을 다룰 수 있음
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	// 클라이언트 - 서버간 연결이 완료되고, 통신할 준비가 되면 실행되는 메소드
	// card.jsp 화면이 보여지고 new SockJs("/card"); 구문이 수행될 떄 해당 메소드가 자동으로 수행됨
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// session : 접속한 사람의 session 정보가 들어있다. HttpSession 정보가 담겨있다. 
		
		// Set에 접속한 사람의 정보를 모아둠 (같은 워크스페이스를 사용하는 사람의 정보가 모임 / 워크스페이스별 사람들을 모을 수 있다는것)
		sessions.add(session);
		
		System.out.println(session.getId() + "연결됨");
		System.out.println( ( (Member)session.getAttributes().get("loginMember") ).getMemberNm() );
	}

	// 클라이언트로부터 텍스트를 받았을때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// session : 텍스트를 입력한 사람의 SockJs가 들어옴
		// message : JSON으로 전환된 문자열이 담겨있다
		
		// sockJs로 들어온 내용을 출력해봄
		System.out.println("전달받은 내용" + message.getPayload());
		
		// JSON 형태의 문자열을 JsonObject로 변경하여 값을 꺼낼쓸 수 있는 형태로 변환
		JsonObject convertedObj = new Gson().fromJson(message.getPayload(), JsonObject.class);
		
		// 변경된 JsonObject에서 값 추출
		int memberNo = Integer.parseInt(convertedObj.get("memberNo").toString().replaceAll("\"", ""));
		String cardNm = convertedObj.get("cardNm").toString();
		
		// 쌍따옴표 없애기
		cardNm = cardNm.substring(1, cardNm.length()-1);
		
		System.out.println("카드 작성자 멤버번호 " + memberNo);
		System.out.println("카드 이름 " + cardNm);
		
		
		// 카드 이름 DB 삽입 구문
		int workNo = Integer.parseInt(convertedObj.get("workNo").toString().replaceAll("\"", ""));
		
		System.out.println("workNo : " + workNo);
		
		
		// 화면에 보이게.... 
		
		for(WebSocketSession s : sessions) {
			
			int joinWorkNo = ((Workspace)s.getAttributes().get("work")).getWorkNo();
			
			if(workNo == joinWorkNo) {
				// 서버에서 클라이언트로 메세지 전달 
				s.sendMessage(new TextMessage(new Gson().toJson(convertedObj)));
				
			}
		}
		
		
		
		
		
		
		
		
		
		
	
	}

	// 클라이언트 - 서버간 연결이 종료될 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
	
	}

	
	
}
