
package edu.fin.upa.member.controller;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

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
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Member inputMember, Model model, RedirectAttributes ra,
			 			@RequestParam(value="autoLogin", required=false) String autoLogin,
			 			SessionStatus status,HttpServletRequest request, HttpServletResponse response) {

		// 로그인 진행
		Member loginMember = service.login(inputMember);
		
		String path = null;
		
		// 로그인이 되었다면
		if(loginMember != null) {
	         // session에 loginMember 올리고 result로 보냄
	         model.addAttribute("loginMember", loginMember);
	         path = "redirect:/calendar/calendar";
//	         redirect:/member/calendar/calendar.jsp
	         
		}else {// 로그인에 실패했을 경우
			path = "redirect:/login";
		}

			Cookie cookie = new Cookie("autoLogin", loginMember.getMemberId());
	         // 자동 로그인을 체크한 경우
	         if(autoLogin != null) { 
	            
	            // db에 저장할 생명 주기
	            int limitTime = 60*60*24*30;
	            cookie.setMaxAge(limitTime);
	            
	            Long expiredDate = System.currentTimeMillis()+(limitTime*1000000);
	    		
	    		Date limitDate = new Date(expiredDate);
	            
	    		String inputId = inputMember.getMemberId();
	    		
	    		String loginId = loginMember.getMemberId();
	    		service.keepLogin(loginId, limitDate, inputId);
	            
	    		System.out.println(limitDate);
	         }else { // 자동 로그인을 체크하지 않은 경우
	        	// cookie의 생명 주기 저장
	            cookie.setMaxAge(0);
	         }
	         
	         // if else 문이 끝나고 요청에 담아 보내기
	         cookie.setPath(request.getContextPath());
	         response.addCookie(cookie);
	         
		 return path;
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
	
	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value="idDupCheck", method=RequestMethod.POST)
	public int idDupCheck(@RequestParam("id") String id) {
		
		int result = service.idDupCheck(id);
		
		
		return result;
	}
	
	// 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(SessionStatus status,HttpServletRequest request,
						HttpServletResponse response,@ModelAttribute("loginMember") Member loginMember) {
		
		
		if (loginMember != null) {
			status.setComplete();
		
			Cookie autoLogin = WebUtils.getCookie(request, "autoLogin");
		
			if (autoLogin != null) {
				autoLogin.setMaxAge(0);
				autoLogin.setPath(request.getContextPath());
				response.addCookie(autoLogin);
				service.keepLogin("none", new Date(0), loginMember.getMemberId());
			}
		
		}
		return "redirect:/login";
	}
	
	
	// 휴대폰 인증
	@RequestMapping(value="phoneCheck", method=RequestMethod.POST)
	public String phoneCheck(@RequestParam("certificationNo") int certificationNo) {
		
		System.out.println(certificationNo);
		
		return null;
	}
	
}















