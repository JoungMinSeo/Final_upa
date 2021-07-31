
package edu.fin.upa.member.controller;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.fin.upa.member.model.service.MemberService;
import edu.fin.upa.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"})
@Service("MemberController")
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

	@RequestMapping(value="result", method=RequestMethod.GET)
	public String result() {
		return "member/result";
	}
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Member inputMember, Model model, RedirectAttributes ra,
			 			@RequestParam(value="autoLogin", required=false) String autoLogin,
			 			SessionStatus status,HttpServletRequest request, HttpServletResponse response) {

		Member loginMember = service.login(inputMember);
		
		
		
		if(loginMember != null) {
	         
	         model.addAttribute("loginMember", loginMember);

	         Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
	         
	         if(autoLogin != null) { 
	            
	            cookie.setMaxAge(60 * 60 * 24 * 30);
	            
	            Long limitTime = (long) (60*60*24*30);
	    		
	    		Long expiredDate = System.currentTimeMillis()+(limitTime*1000);
	    		
	    		Date limitDate = new Date(expiredDate);
	    		
	    		String inputId = inputMember.getMemberId();
	    		
	    		String loginId = loginMember.getMemberId();
	    		service.keepLogin(loginId, limitDate, inputId);
	    		
	            
	         }else { 
	            
	            cookie.setMaxAge(0);
	         }
	         
	         cookie.setPath(request.getContextPath());
	         
	         response.addCookie(cookie);
	         
	      }else {
	         
	    	  ra.addFlashAttribute("icon", "error");
	    	  ra.addFlashAttribute("title", "로그인 실패");
	    	  ra.addFlashAttribute("text", "아이디 또는 비밀번호가 일치하지않습니다");
	    	  
	      }
		
		 return "redirect:/member/result";
	}
	
	
	// 회원가입 전환
	@RequestMapping(value="signUp", method=RequestMethod.GET)
	public String signUp() {
		
		return "member/signUp";
	}
	
	// 회원 가입 진행
	@RequestMapping(value="signUp", method=RequestMethod.POST)
	public String singUp(Member inputMember) {
		
		
		int result = service.signUp(inputMember);
		
		if(result > 0) {
			System.out.println("회원 가입 성공");
		}else {
			System.out.println("회원 가입 실패");
		}
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="idDupCheck", method=RequestMethod.POST)
	public int idDupCheck(@RequestParam("id") String id) {
		
		int result = service.idDupCheck(id);
		
		
		return result;
	}
	
	
	
}















