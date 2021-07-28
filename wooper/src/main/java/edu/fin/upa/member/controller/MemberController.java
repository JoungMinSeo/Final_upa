
package edu.fin.upa.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.fin.upa.member.model.service.MemberService;
import edu.fin.upa.member.model.vo.Member;

@Controller

@RequestMapping("/member/*")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;

	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {

		return "member/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Member inputMember, Model model, RedirectAttributes ra) {

		Member loginMember = service.login(inputMember);
		
		String result = null;
		
		 if (loginMember != null) {
		 swalSetMessage(ra, "success","fh 성공", null); 
		 result = "로그인 성공";
		 model.addAttribute("loginMember", loginMember); 
		 model.addAttribute("result",result);
		 } else {
		 swalSetMessage(ra, "error", "회원가입 실패", null); 
		 result = "로그인 실패";
		 model.addAttribute("result",result);
		 }

		 return "member/result";
	}
	
	@RequestMapping(value="signUp", method=RequestMethod.GET)
	public String signUp() {
		
		return "member/signUp";
	}
	
	@RequestMapping(value="signUp", method=RequestMethod.POST)
	public String singUp(Member inputMember) {
		
		
		return "redirect:/member/login";
	}
	
	@ResponseBody
	@RequestMapping(value="idDupCheck", method=RequestMethod.POST)
	public int idDupCheck(@RequestParam("id") String id) {
		
		int result = service.idDupCheck(id);
		
		
		return result;
	}
	
}















