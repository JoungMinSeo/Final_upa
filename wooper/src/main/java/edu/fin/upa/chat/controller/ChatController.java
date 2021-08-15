package edu.fin.upa.chat.controller;


import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.sonatype.inject.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.fin.upa.chat.model.service.ChatService;
import edu.fin.upa.chat.model.vo.ChatMessage;
import edu.fin.upa.chat.model.vo.ChatRoom;
import edu.fin.upa.chat.model.vo.ChatRoomJoin;
import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	// 채팅 목록 조회
	@RequestMapping(value="/chat/chatRoom")
	public String charRoomList(Model model) {
		
		//채팅룸 목록을 조회하여 화면으로 요청 위임
		List<ChatRoom> chatRoomList = service.selectRoomList();
		
		model.addAttribute("chatRoomList", chatRoomList);
		
		
		return "chat/chatRoom";
	}
	
	@RequestMapping(value="/chat/memberList",method=RequestMethod.POST)
	@ResponseBody
	public String memberSearch(Model model,@RequestParam("sk") String sk,
							Search search, @RequestParam("sv") String sv) {
		
		search.setSk(sk);
		search.setSv(sv);
		
		System.out.println("컨트롤러 임미당 : " + sk);
		System.out.println("----------------" + sv);
		
		List<Member> memberList = service.selectMemberList(search);
		
		System.out.println("컨트롤러 memberList : " + memberList);
		Gson gson = new Gson();
		
		return gson.toJson(memberList);
		
	}
	
	// 채팅방 생성
	@RequestMapping(value="/chat/createChatRoom",method=RequestMethod.POST)
	public String createChatRoom(HttpServletRequest request, Model model,
								@RequestParam("memberNo") int[] joinMemberNo,
								ChatRoomJoin join,ChatRoom room,@RequestParam("chatTitle") String chatTitle,
								@ModelAttribute("loginMember") Member loginMember) {
		
		room.setChatRoomNo(loginMember.getMemberNo());
		room.setTitle(chatTitle);
		
		// 채팅방 먼저 개설
		int chatRoomNo = service.createChatRoom(room);
		
		if (chatRoomNo > 0) {
			// 채팅방에 사람 넣어버리기
			for(int i =0; i<joinMemberNo.length; i++) {
				
				int memberJoinNo = joinMemberNo[i];
				
				int result = service.insertChatRoom(memberJoinNo,chatRoomNo);
				System.out.println(joinMemberNo[i]);
				
			}
		}
		
		
		return "redirect:/chat/chatRoom";
	}
	
	
	@RequestMapping(value="/chat/selectChatMessage",method=RequestMethod.POST)
	@ResponseBody
	public String selectChatMessage(@RequestParam("chatRoomNo") int chatRoomNo) {
		
		
		List<ChatMessage> list = service.selectChat(chatRoomNo);
		
		System.out.println("컨트롤러 리스트 : " + list);
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	
}
