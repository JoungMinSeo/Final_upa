package edu.fin.upa.card.websocket;


import java.text.SimpleDateFormat;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import edu.emory.mathcs.backport.java.util.Collections;
import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.card.model.service.CardService;
import edu.fin.upa.list.model.service.ListService;
import edu.fin.upa.list.model.vo.ListList;
import edu.fin.upa.member.model.vo.Member;

public class CardWebsocketHandler extends TextWebSocketHandler{

	@Autowired
	private CardService service;
	
	@Autowired
	private ListService listService;
	
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
		
		// 팀(워크스페이스) 번호
		int workNo = Integer.parseInt(convertedObj.get("workNo").toString().replaceAll("\"", ""));
		
		// 로그인한 회원 번호
		int memberNo = Integer.parseInt(convertedObj.get("memberNo").toString().replaceAll("\"", ""));
		
	
		
		// 소켓 동작 상태 구분값
		String status = convertedObj.get("status").toString().replaceAll("\"", "");
		System.out.println("status : " + status);
		
		switch(status) {
		
		case "insertCard" :
			String cardNm = convertedObj.get("cardNm").toString();
			
			// 쌍따옴표 없애기
			cardNm = cardNm.substring(1, cardNm.length()-1);
			
			System.out.println("카드 작성자 멤버번호 " + memberNo);
			System.out.println("카드 이름 " + cardNm);
			
			System.out.println("workNo : " + workNo);
			
			// CARD 테이블에 삽입하려는 내용을 하나의 VO에 담기
			Card card = new Card();
			card.setWorkNo(workNo);
			card.setMemberNo(memberNo);
			card.setCardNm(cardNm);
			
			// 카드를 DB에 삽입하는 service 호출
			service.insertCard(card);
			
			convertedObj.addProperty("cardNo", card.getCardNo());
		
		break;
		
		case "updateCard" : 
			
			cardNm = convertedObj.get("cardNm").toString();
			
			// 쌍따옴표 없애기
			cardNm = cardNm.substring(1, cardNm.length()-1);
			
			
			
			System.out.println("카드 이름변경하는 멤버번호 " + memberNo);
			System.out.println("카드 변경하는 이름 " + cardNm);
			
			System.out.println("workNo : " + workNo);
			
			// CARD 테이블에 삽입하려는 내용을 하나의 VO에 담기
			card = new Card();
			card.setWorkNo(workNo);
			card.setMemberNo(memberNo);
			card.setCardNm(cardNm);
			card.setCardNo(Integer.parseInt(convertedObj.get("cardNo").toString().replaceAll("\"", "")));
			
			// 카드를 DB에 삽입하는 service 호출
			service.updateCard(card);
			
			
			
		break;
			
		case "deleteCard" :
			
			// 카드 넘버 가져오기
			int cardNo = Integer.parseInt(convertedObj.get("cardNo").toString().replaceAll("\"", ""));
			
			System.out.println("얻어온 cardNo : " + cardNo);
			
			service.deleteCard(cardNo);
			
			
		break;
		
		case "insertList" :
			
			int addListCardNo = Integer.parseInt(convertedObj.get("addListCardNo").toString().replaceAll("\"", ""));
			
			String listNm = convertedObj.get("listNm").toString();
			listNm = listNm.substring(1, listNm.length()-1);
			
			String listStartDt = convertedObj.get("listStartDt").toString();
			listStartDt = listStartDt.substring(1, listStartDt.length()-1);
			
			
			String listEndDt = convertedObj.get("listEndDt").toString();
			listEndDt = listEndDt.substring(1, listEndDt.length()-1);
			
			
			String statusCategory = convertedObj.get("statusCategory").toString();
			statusCategory = statusCategory.substring(1, statusCategory.length()-1);
			
			//System.out.println(convertedObj.get("memList"));
			String[] arr = convertedObj.get("memList").toString().replaceAll("\\[", "")
					.replaceAll("]", "").replaceAll("\"", "").split(",");
			
			int[] memList = new int[arr.length];
			
			for(int i=0 ; i<arr.length ;i++) {
				memList[i] = Integer.parseInt(arr[i]); 
			}
			
			ListList Llist = new ListList();
			Llist.setCardNo(addListCardNo);
			Llist.setListNm(listNm);
			Llist.setListStartDt(listStartDt);
			Llist.setListEndDt(listEndDt);
			Llist.setDoName(statusCategory);
			Llist.setMemberNo(memberNo);
			Llist.setMemList(memList);
			Llist.setWorkNo(workNo);
			
			listService.insertLlist(Llist);
			// 리스트 참여자 멤버 삽입
			listService.insertListJoin(Llist);
			// 리스트 삽입 상태
			listService.insertListDo(Llist);
			
			convertedObj.addProperty("listNo", Llist.getCardNo());
			
		break;
		
		case "updateList" :
			
			int upListNo = Integer.parseInt(convertedObj.get("upListNo").toString().replaceAll("\"", ""));
			
			String upListNm = convertedObj.get("upListNm").toString();
			upListNm = upListNm.substring(1, upListNm.length()-1);
			
			String upListStartDt = convertedObj.get("upListStartDt").toString();
			upListStartDt = upListStartDt.substring(1, upListStartDt.length()-1);
			
			String upListEndDt = convertedObj.get("upListEndDt").toString();
			upListEndDt = upListEndDt.substring(1, upListEndDt.length()-1);
			
			String upStatusCategory = convertedObj.get("upStatusCategory").toString();
			upStatusCategory = upStatusCategory.substring(1, upStatusCategory.length()-1);
			
			//System.out.println(convertedObj.get("memList"));
			String[] upArr = convertedObj.get("upMemList").toString().replaceAll("\\[", "")
					.replaceAll("]", "").replaceAll("\"", "").split(",");
			
			int[] upMemList = new int[upArr.length];
			
			for(int i=0 ; i<upArr.length ;i++) {
				upMemList[i] = Integer.parseInt(upArr[i]); 
			}
			
			ListList upLlist = new ListList();
			upLlist.setListNo(upListNo);
			upLlist.setListNm(upListNm);
			upLlist.setListStartDt(upListStartDt);
			upLlist.setListEndDt(upListEndDt);
			upLlist.setDoName(upStatusCategory);
			upLlist.setMemberNo(memberNo);
			upLlist.setMemList(upMemList);
			upLlist.setWorkNo(workNo);
			
			// 기존에 있던 리스트 참여자 삭제
			listService.deleteListJoin(upListNo);
			// 리스트 참여자 수정( 수정된 멤버 삽입)
			listService.insertListJoin(upLlist);
			// 바뀐 리스트 참여자 조회 
			List<Member> updateMemList = listService.selectMemList(upListNo);
			// 리스트 상태 업데이트
			listService.updateListStatus(upLlist);
			// 리스트 바뀐 내용 업데이트
			listService.updateList(upLlist);
			
			// 바뀐 내역 조회
			ListList upList = listService.selectListView(upListNo);
			
			convertedObj.addProperty("listNm", upList.getListNm());
			convertedObj.addProperty("listStartDt", upList.getListStartDt());
			convertedObj.addProperty("listEndDt", upList.getListEndDt());
			convertedObj.addProperty("doName", upList.getDoName());
			/* convertedObj.addProperty("upMemList", updateMemList); */
			
		break;
			
		case "deleteList" : 
			
			int listNo = Integer.parseInt(convertedObj.get("listNo").toString().replaceAll("\"", ""));
			
			listService.deleteList(listNo);
			
		break;
			
		
		case "dropList" :
			
			int dropCardNo = Integer.parseInt(convertedObj.get("dropCardNo").toString().replaceAll("\"", ""));
			int dropListNo = Integer.parseInt(convertedObj.get("dropListNo").toString().replaceAll("\"", ""));
			
			ListList Dlist = new ListList();
			Dlist.setCardNo(dropCardNo);
			Dlist.setListNo(dropListNo);
			
			listService.dropList(Dlist);
			
			ListList SDlist = listService.selectListView(dropListNo);
			//System.out.println(SDlist);
			
			// 리스트 참여 멤버 조회
			List<Member> joinMemList = listService.selectMemList(dropListNo);
			//System.out.println(joinMemList);
			
			convertedObj.addProperty("listNm", SDlist.getListNm());
			convertedObj.addProperty("listStartDt", SDlist.getListStartDt());
			convertedObj.addProperty("listEndDt", SDlist.getListEndDt());
			convertedObj.addProperty("doName", SDlist.getDoName());
			/* convertedObj.add("joinMemList", joinMemList); */
			
		break;
		
		
			
		}
		
		
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
