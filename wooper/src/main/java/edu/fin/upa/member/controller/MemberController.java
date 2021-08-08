
package edu.fin.upa.member.controller;

import java.util.Date;
import java.util.Random;

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
	
	// 로그인 화면 전환
	@RequestMapping("login")
	public String login(Model model) {
		
		return "redirect:/login";
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
	         model.addAttribute("loginMember", loginMember);

	         ra.addFlashAttribute("icon", "success");
	         ra.addFlashAttribute("title", "로그인 성공");
	         ra.addFlashAttribute("text", "아이디 또는 비밀번호가 일치하지않습니다");
	         
	         path = "redirect:/calendar/calendar";
	         
	         
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
		}else {// 로그인에 실패했을 경우
			path = "redirect:/login";
			
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "로그인 실패");
			ra.addFlashAttribute("text", "아이디 또는 비밀번호가 일치하지않습니다");
		}
	         
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
	
	// 아이디 찾기 화면 전환
	@RequestMapping("findId")
	public String findId() {
		
		
		return "member/findId";
	}
	// 비밀번호 찾기 화면 전환
	@RequestMapping("findPw")
	public String findPw() {
		
		return "member/findPw";
	}
	
	// 마이페이지 화면 전환
	@RequestMapping("myPage")
	public String myPage() {
		
		return "member/myPage";
	}
	
	// 비밀번호 변경 화면 전환
	@RequestMapping("changePwd")
	public String changePw() {
		
		return "member/changePw";
	}
	
	// 마이페이지 화면 전환
	@RequestMapping("secession")
	public String secession() {
		
		return "member/secession";
	}
	
	
	// 휴대폰 인증
	@ResponseBody
	@RequestMapping(value="sendSMS",method=RequestMethod.POST)
	public String sendSMS(@RequestParam("memberPhone") String memberPhone) {
		
		Random rand = new Random();
		String numStr = "";
		for(int i=0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		
		System.out.println("수신자 번호" + memberPhone);
		System.out.println("인증 번호" + numStr);
		
		service.certifiedPhoneNumber(memberPhone,numStr);
		
		return numStr;
	}
	

}















