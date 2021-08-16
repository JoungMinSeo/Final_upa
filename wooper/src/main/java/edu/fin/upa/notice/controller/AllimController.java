package edu.fin.upa.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.fin.upa.member.model.vo.Member;

@RequestMapping("/notice/*")
@Controller
@SessionAttributes({"loginMember"})
public class AllimController {
	
	
	// 알림화면연결
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String result() {
		return "/notification/notification";
}
}
