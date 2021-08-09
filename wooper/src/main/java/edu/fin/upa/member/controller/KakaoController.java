package edu.fin.upa.member.controller;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.fin.upa.member.model.service.MemberService;
import edu.fin.upa.member.model.vo.KakaoProfile;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.member.model.vo.OAuthToken;

@Controller
@JsonIgnoreProperties(ignoreUnknown = true)
@SessionAttributes("loginMember")
public class KakaoController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="kakaoLogin")
	public String kakaoCallback(String code, Model model, RedirectAttributes ra) {
		
		
		// POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
		RestTemplate rt = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "553db56a5579581d35b20b05bdcdb925");
		params.add("redirect_uri", "http://localhost:8080/wooper/kakaoLogin");
		params.add("code", code);
		
		// kakaoTokenRequest -> body 값과 head값을 가진 Entity가 됨
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
				new HttpEntity<>(params,headers);
		
		// Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답을 받음
		ResponseEntity<String> response = rt.exchange(
			"https://kauth.kakao.com/oauth/token",
			HttpMethod.POST,
			kakaoTokenRequest,
			String.class
		);
		
		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		RestTemplate rt2 = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = 
				new HttpEntity<>(headers2);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class
		);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		
		KakaoProfile kakaoProfile = null;
		
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonParseException e) {
			
			e.printStackTrace();
		} catch (JsonMappingException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		UUID garbagePassword = UUID.randomUUID();
		
		Member kakaoMember = new Member();
		kakaoMember.setMemberId(kakaoProfile.getKakao_account().getEmail());
		kakaoMember.setMemberPw(garbagePassword.toString());
		kakaoMember.setMemberNm(kakaoProfile.getProperties().getNickname());
		kakaoMember.setMemberNick(kakaoProfile.getProperties().getNickname());
		kakaoMember.setMemberImg(kakaoProfile.getProperties().getProfile_image());
		kakaoMember.setKakaoId(kakaoProfile.getId());
		// 가입자 혹은 비가입자 체크해서 처리
		
		int kakaoId = kakaoProfile.getId();
		
		Member member = service.selectKakaoMember(kakaoId);
		
		if (member == null) { // 아이디가 없으므로 회원 가입 진행
			
			int result = service.insertKakaoMember(kakaoMember);
			
			if (result > 0) {
				
				Member kMember = service.selectKakaoMember(kakaoId);
				model.addAttribute("loginMember", kMember);
				
			}else {
				MemberController.swalSetMessage(ra, "error", "카카오 서버 오류", null);
			}
			
		}else { // 세션에 kakaoMember 올리기
			model.addAttribute("loginMember", member);
		}
		System.out.println("카카오 로그인 : " + member);
		
		return "redirect:/calendar/calendar";
	}
	

	
}
