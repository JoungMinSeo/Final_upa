package edu.fin.upa;

import java.util.Locale;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "login";
	}
	
	@RequestMapping("/auth/kakao/callback")
	@ResponseBody
	public String kakaoCallback(String code) {
		
		// POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
		RestTemplate rt = new RestTemplate();
		
		// HttpHeader 객체 생성
		HttpHeaders headers =  new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpBody 객체 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "6caa5f8c1a7322cc5a6efe9757e2b243");
		params.add("redirect_uri", "http://localhost:8080/member/auth/kakao/callback");
		params.add("grant_type", code);
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params,headers);
		
		// Http 요청 하기
		ResponseEntity<String> response = rt.exchange(
			"https://kauth.kakao.com/oauth/token",
			HttpMethod.POST,
			kakaoTokenRequest,
			String.class
		);
		
		System.out.println("카카오 인증 완료 : " + response);
		
		return "카카오 인증 완료";
	}	
	
	
	
}
