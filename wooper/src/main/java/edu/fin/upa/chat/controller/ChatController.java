package edu.fin.upa.chat.controller;


import java.nio.file.spi.FileSystemProvider;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
@SessionAttributes({"loginMember","chatRoomNo"})
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	// 채팅 목록 조회
	@RequestMapping(value="/chat/chatRoom")
	public String charRoomList(Model model,@ModelAttribute("loginMember") Member loginMember) {
		
		// 프로젝트 끝
		int memberNo = loginMember.getMemberNo();
		//채팅룸 목록을 조회하여 화면으로 요청 위임
		List<ChatRoom> chatRoomList = service.selectRoomList(memberNo);
		
		model.addAttribute("chatRoomList", chatRoomList);
		
		System.out.println("chatRoomList" + chatRoomList);
		
		return "chat/chatRoom";
	}
	
	@RequestMapping(value="/chat/memberList",method=RequestMethod.POST)
	@ResponseBody
	public String memberSearch(Model model,@RequestParam("sk") String sk,
							Search search, @RequestParam("sv") String sv) {
		
		search.setSk(sk);
		search.setSv(sv);
		
		List<Member> memberList = service.selectMemberList(search);
		
		Gson gson = new Gson();
		
		return gson.toJson(memberList);
		
	}
	
	// 채팅방 생성
	@RequestMapping(value="/chat/createChatRoom",method=RequestMethod.POST)
	public String createChatRoom(HttpServletRequest request, Model model,
								@RequestParam("joinMemberNo") int[] joinMemberNo,
								ChatRoomJoin join,ChatRoom room,@RequestParam("chatTitle") String chatTitle,
								@ModelAttribute("loginMember") Member loginMember) {
		
		room.setMemberNo(loginMember.getMemberNo());
		room.setTitle(chatTitle);
		
		System.out.println("room : " + room);
		
		// 채팅방 먼저 개설
		int chatRoomNo = service.createChatRoom(room);
		
		model.addAttribute("chatRoomNo", chatRoomNo);
		
		if (chatRoomNo > 0) {
			// 채팅방에 사람 넣어버리기
			for(int i =0; i<joinMemberNo.length; i++) {
				
				int memberJoinNo = joinMemberNo[i];
				System.out.println("잘 나오니 멤버 넘버야? : " + memberJoinNo);
				
				service.insertChatRoom(memberJoinNo,chatRoomNo);
				
			}
		}
		
		System.out.println("이후 로그인 멤버 번호 : " + loginMember.getMemberNo());
		
		return "redirect:/chat/chatRoom";
	}
	
	
	// 채팅한거 조회
	@RequestMapping(value="/chat/selectChatMessage",method=RequestMethod.POST)
	@ResponseBody
	public String selectChatMessage(@RequestParam("chatRoomNo") int chatRoomNo, Model model) {
		
		
		List<ChatMessage> list = service.selectChat(chatRoomNo);
		
		model.addAttribute("chatRoomNo", chatRoomNo);
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	
}
