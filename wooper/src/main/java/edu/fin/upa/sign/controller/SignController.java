package edu.fin.upa.sign.controller;

import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.service.SignService;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.sign.model.vo.ExpenseReport;
import edu.fin.upa.sign.model.vo.Meeting;
import edu.fin.upa.sign.model.vo.Vacation;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;


@Controller
@RequestMapping("/sign/*")
@SessionAttributes({"loginMember"})
public class SignController {

	@Autowired
	private SignService service;
	
	
	// 작성한 문서 목록 조회
	@RequestMapping(value="{workNo}/signMain", method=RequestMethod.GET)
	public String signMain(@PathVariable("workNo") int workNo,
						   @ModelAttribute("loginMember") Member loginMember,
						   @RequestParam(value="cp", required=false, defaultValue="1") int cp,
						   Model model, Pagination pg) {
		
		pg.setWorkNo(workNo);
		pg.setCurrentPage(cp);
		
		Pagination myDocuPagination = service.getMyDocuPagination(pg, loginMember);
		List<Document> myDocumentList = service.selectMyDocumentList(myDocuPagination, loginMember);
		
		model.addAttribute("myDocuPagination", myDocuPagination);
		model.addAttribute("myDocumentList", myDocumentList);
		
		return "sign/signMain";
	}
	
	
	// 결재할 문서 목록 조회
	@RequestMapping(value="{workNo}/signDocu", method=RequestMethod.GET)
	public String signDocu() {
		
		return "sign/signDocu";
	}
	
	// 팀 문서 목록 조회
	// 임시 보관함 문서 목록 조회
	@RequestMapping(value="{workNo}/tempDocu", method=RequestMethod.GET)
	public String tempDocu(@PathVariable("workNo") int workNo,
						   @ModelAttribute("loginMember") Member loginMember,
						   @RequestParam(value="cp", required=false, defaultValue="1") int cp,
						   Model model, Pagination pg) {
		
		pg.setWorkNo(workNo);
		pg.setCurrentPage(cp);
		
		Pagination myTempDocuPagination = service.getMyTempDocuPagination(pg, loginMember);
		List<Document> myTempDocumentList = service.selectMyTempDocumentList(myTempDocuPagination, loginMember);
		
		model.addAttribute("myTempDocuPagination", myTempDocuPagination);
		model.addAttribute("myTempDocumentList", myTempDocumentList);
		
		return "sign/tempDocu";
	}
	
	
	// 결재 문서 작성 화면 전환
	@RequestMapping(value="{workNo}/insert", method = RequestMethod.GET)
	public String insertMeetingForm(@PathVariable("workNo") int workNo, 
									@RequestParam("documentType") int documentType, 
									@ModelAttribute("loginMember") Member loginMember,
									Model model) {
		
		// 워크스페이스 참가자 목록 조회
		List<WorkspaceJoin> workspaceJoin = service.selectWorkspaceJoin(workNo);
		
		// 로그인한 회원 직급 조회
		String memberRank = service.selectRank(workNo, loginMember.getMemberNo());
		
		// 요청 위임 페이지에서 사용할 수 있도록 데이터 전달
		model.addAttribute("workspaceJoin", workspaceJoin);
		model.addAttribute("memberRank", memberRank);
		
		String path = "sign/insert";
		
		switch(documentType) {
		case 1 : path += "ExpenseReport"; break;
		case 2 : path += "Meeting"; break;
		case 3 : path += "Vacation"; break;
		}
		
		return path;
	}
	
	
	// 품의서 작성 + 임시 저장
	@RequestMapping(value="{workNo}/insertExpenseReport", method=RequestMethod.POST)
	public String insertExpenseReport(@PathVariable("workNo") int workNo,
									  @ModelAttribute ExpenseReport expenseReport,
									  @ModelAttribute Document document,
									  @ModelAttribute("loginMember") Member loginMember,
									  HttpServletRequest request) {
		
		document.setMemberNo( loginMember.getMemberNo() );
		document.setWorkNo(workNo);
		document.setDocumentType("1");
		document.setMemberNm( loginMember.getMemberNm() );
		
		String[] phone = request.getParameterValues("accountPhone");
		expenseReport.setAccountPhone( String.join("-", phone) );
		
		System.out.println(document);
		System.out.println(expenseReport);
		
		
		int documentNo = service.insertExpenseReport(expenseReport, document);
		
		String path = null;
		
		if(documentNo > 0) {
			path = "redirect:" + documentNo;
			
		}else {
			path = "redirect:" + request.getHeader("referer");
		}
		
		return path;
	}

	
	// 회의록 작성
	@RequestMapping(value="{workNo}/insertMeeting", method=RequestMethod.POST)
	public String insertMeeting(@PathVariable("workNo") int workNo,
								@ModelAttribute Meeting meeting,
			  					@ModelAttribute Document document,
			  					@ModelAttribute("loginMember") Member loginMember,
			  					HttpServletRequest request) {
		
		document.setMemberNo( loginMember.getMemberNo() );
		document.setWorkNo(workNo);
		document.setDocumentType("2");
		document.setMemberNm( loginMember.getMemberNm() );
		
		System.out.println(document);
		System.out.println(meeting);
		
		
		int documentNo = service.insertMeeting(meeting, document);
		
		String path = null;
		
		if(documentNo > 0) {
			path = "redirect:" + documentNo;
			
		}else {
			path = "redirect:" + request.getHeader("referer");
		}
		
		return path;
		
	}
	
	
	// 휴가신청서 작성
	@RequestMapping(value="{workNo}/insertVacation", method=RequestMethod.POST)
	public String insertVacation(@PathVariable("workNo") int workNo,
								 @ModelAttribute Vacation vacation,
								 @ModelAttribute Document document,
								 @ModelAttribute("loginMember") Member loginMember,
								 HttpServletRequest request) {
		
		document.setMemberNo( loginMember.getMemberNo() );
		document.setWorkNo(workNo);
		document.setDocumentType("3");
		document.setMemberNm( loginMember.getMemberNm() );
		
		System.out.println(document);
		System.out.println(vacation);
		
		
		int documentNo = service.insertVacation(vacation, document);
		
		String path = null;
		
		if(documentNo > 0) {
			path = "redirect:" + documentNo;
			
		}else {
			path = "redirect:" + request.getHeader("referer");
		}
		
		return path;
	}

}
