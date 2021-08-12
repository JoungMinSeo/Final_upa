package edu.fin.upa.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// http://localhost:8080/wooper/management/2/add
@WebFilter(filterName = "mailFilter", urlPatterns = {"/management/*"})
public class MailFilter implements Filter {

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 회원 전용 서비스 요청이 왔을 때
		// Session에 loginMember가 있는지 확인하여
		// 없으면 메인페이지로 돌려보내기
		
		// HttpSession session = request.getSession();을 사용하려면
		// request.getSession();의 자료형이 ServletRequest가 아니라
		// HttpServletRequset여야함 -> 다운캐스팅 필요
		// 1. Session을 얻어오기 위한 request 다운 캐스팅
		HttpServletRequest req = (HttpServletRequest)request;
		
		// /wooper/management/2/add
		String uri = req.getRequestURI();
		
		// /wooper/management/2/add
		
		// "", wooper, management , 2,       add
		// "", wooper, management , insert, add
		// "", wooper, management , insert, file, test

		String[] uriArr = uri.split("/");

		//System.out.println( Arrays.toString(uriArr));
		//System.out.println(uriArr.length);
		
		if(uriArr.length == 5 && uriArr[4].equals("add")) {
			
			int workNo = 0;
			
			try {
				workNo = Integer.parseInt(uriArr[3]);
			} catch (Exception e) {
				chain.doFilter(request, response);
			}
			
			// 2. Session 얻어오기
			HttpSession session = req.getSession();
			// 3. Session에서 loginMember를 얻어와 null인지 확인
			if( session.getAttribute("loginMember") == null) {
				( (HttpServletResponse)response ).sendRedirect(req.getContextPath());
				// ==> 메인페이지 재요청
			}else {
				chain.doFilter(request, response);
			}
			
		}else {
			chain.doFilter(request, response);
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("메일 필터 생성");
	}

}
