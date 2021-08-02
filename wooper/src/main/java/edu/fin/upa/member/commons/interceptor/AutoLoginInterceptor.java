package edu.fin.upa.member.commons.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import edu.fin.upa.member.model.service.MemberService;
import edu.fin.upa.member.model.vo.Member;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

	@Inject
	private MemberService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		Object obj = session.getAttribute("loginMember");

		if (obj == null) { // 로그인이 되어있지 않은 경우
			// 웹에서 autoLogin 쿠키 가져옴
			Cookie autoLogin = WebUtils.getCookie(request, "autoLogin");
			
			
			if (autoLogin != null) { // 쿠키가 있을 경우
				// 쿠키에서 sessionID를 가져옴
				String sessionId = autoLogin.getValue();
				
				// 인터셉터 자동 로그인
				Member loginMember = service.getMemberSessionId(sessionId);
				
				System.out.println(loginMember);
				if (loginMember != null) {// 자동 로그인이 되었다면
					// session에 loginMember 올리기
					session.setAttribute("loginMember", loginMember);
					// 성공 시 result로 보냄
					response.sendRedirect(request.getContextPath() + "/member/result");
					return true;
				}
			}
			// 로그인도안되어있고 쿠키도 존재 하지않음 다시 로그인 화면으로 돌려보내야함
			return true;
		}
		
		return true;

	}

   @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception 
    {
        super.postHandle(request, response, handler, modelAndView);
    }
 
}
	
