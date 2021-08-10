package edu.fin.upa.sign.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.fin.upa.sign.model.service.SignService;
import edu.fin.upa.sign.model.vo.Meeting;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;


@Controller
@RequestMapping("/sign/*")
@SessionAttributes({"loginMember", "workspaceJoin"})
public class SignController {

	@Autowired
	private SignService service;
	
	
	// 회의록 작성 화면 전환
	@RequestMapping(value="/meeting", method = RequestMethod.GET)
	public String insertMeetingForm(Model model) {
		
		// DB에서 WORKSPACE_JOIN 테이블 내용을 모두 조회
		List<WorkspaceJoin> workspaceJoin = service.selectWorkspaceJoin();
		
		model.addAttribute("workspaceJoin", workspaceJoin);
		// 요청 위임 페이지에서 사용할 수 있도록 데이터 전달
		
		return "sign/insertMeeting";
	}
	
	
	// 회의록 작성
	@RequestMapping(value="/meeting", method=RequestMethod.POST)
	public String insertMeeting(@ModelAttribute Meeting meeting) {
		
		
		return null;
		
	}

}
