package edu.fin.upa.sign.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.fin.upa.chat.model.vo.Search;
import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.sign.model.service.SignService;
import edu.fin.upa.sign.model.vo.Document;
import edu.fin.upa.sign.model.vo.MeetingJoin;
import edu.fin.upa.sign.model.vo.PurchaseList;
import edu.fin.upa.sign.model.vo.SignLine;
import edu.fin.upa.sign.model.vo.Viewer;
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
		Pagination signDocuPagination = service.getSignDocuPagination(pg, loginMember); 
		List<Document> signDocumentList = service.selectSignDocumentList(signDocuPagination, loginMember);
		/*
		 * Pagination teamDocuPagination = service.getTeamDocuPagination(pg,
		 * loginMember); List<Document> teamDocumentList =
		 * service.selectTeamDocumentList(teamDocuPagination, loginMember);
		 */
		Pagination myTempDocuPagination = service.getMyTempDocuPagination(pg, loginMember);
		List<Document> myTempDocumentList = service.selectMyTempDocumentList(myTempDocuPagination, loginMember);
		
		model.addAttribute("myDocuPagination", myDocuPagination);
		model.addAttribute("myDocumentList", myDocumentList);
		model.addAttribute("signDocuPagination", signDocuPagination);
		model.addAttribute("signDocumentList", signDocumentList);
		/*
		 * model.addAttribute("teamDocuPagination", teamDocuPagination);
		 * model.addAttribute("teamDocumentList", teamDocumentList);
		 */
		model.addAttribute("myTempDocuPagination", myTempDocuPagination);
		model.addAttribute("myTempDocumentList", myTempDocumentList);
		
		return "sign/signMain";
	}
	
	
	// 결재 문서 상세 조회
	@RequestMapping("{workNo}/{documentNo}")
	public String viewDocument(@PathVariable("workNo") int workNo,
							   @PathVariable("documentNo") int documentNo,
							   @ModelAttribute("loginMember") Member loginMember,
							   @RequestParam(value="cp", required=false, defaultValue="1") int cp,
							   Model model, HttpServletRequest request) {
		
		Document document = service.selectDocument(documentNo, loginMember.getMemberNo() );
		
		if(document != null) {
			model.addAttribute("document", document);
			String documentType = document.getDocumentType();
			
			System.out.println("documentType : " + documentType);
			
			String path = "sign/view";
			
			switch(documentType) {
			case "1" : path += "ExpenseReport"; break;
			case "2" : path += "Meeting"; break;
			case "3" : path += "Vacation"; break;
			}
			
			return path;
			
		}else { 
			return "redirect:" + request.getHeader("referer"); 
		}
	}
	
	
	// 결재 문서 작성 화면 전환
	@RequestMapping(value="{workNo}/insert", method = RequestMethod.GET)
	public String insertDocument(@PathVariable("workNo") int workNo, 
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
	
	
	// 품의서 작성
	@RequestMapping(value="{workNo}/insertExpenseReport", method=RequestMethod.POST)
	public String insertExpenseReport(@PathVariable("workNo") int workNo,
									  @ModelAttribute Document document,
									  @ModelAttribute("loginMember") Member loginMember,
									  HttpServletRequest request) {
		
		// 품의서에 작성된 제품 관련 내용을 꺼내서 List로 변환
		List<PurchaseList> list = new ArrayList<PurchaseList>();
		
		for(int i=0 ; i<document.getItemNm().length ; i++) {
			PurchaseList pl = new PurchaseList();
			pl.setItemNm(document.getItemNm()[i]);
			pl.setItemUnit(document.getItemUnit()[i]);
			pl.setItemAmount(document.getItemAmount()[i]);
			pl.setUnitPrice(document.getUnitPrice()[i]);
			pl.setTotalPrice(document.getTotalPrice()[i]);
			
			list.add(pl);
		}
		
		document.setpList(list);
		
		document.setMemberNo( loginMember.getMemberNo() );
		document.setWorkNo(workNo);
		document.setDocumentType("1");
		document.setMemberNm( loginMember.getMemberNm() );
		
		String[] phone = request.getParameterValues("accountPhone");
		document.setAccountPhone( String.join("-", phone) );
		
		System.out.println(document);
		
		int documentNo = service.insertExpenseReport(document);
		
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
			  					@ModelAttribute Document document,
			  					@ModelAttribute("loginMember") Member loginMember,
			  					HttpServletRequest request) {
		
		document.setMemberNo( loginMember.getMemberNo() );
		document.setWorkNo(workNo);
		document.setDocumentType("2");
		document.setMemberNm( loginMember.getMemberNm() );
		
		System.out.println(document);
		
		int documentNo = service.insertMeeting(document);
		
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
								 @ModelAttribute Document document,
								 @ModelAttribute("loginMember") Member loginMember,
								 HttpServletRequest request) {
		
		document.setMemberNo( loginMember.getMemberNo() );
		document.setWorkNo(workNo);
		document.setDocumentType("3");
		document.setMemberNm( loginMember.getMemberNm() );
		
		System.out.println(document);
		
		int documentNo = service.insertVacation(document);
		
		String path = null;
		
		if(documentNo > 0) {
			path = "redirect:" + documentNo;
			
		}else {
			path = "redirect:" + request.getHeader("referer");
		}
		
		return path;
	}
	
	
	// 결재 문서 수정 화면 전환
	@RequestMapping(value="{workNo}/{documentNo}/update", method=RequestMethod.POST)
	public String updateDocument(int documentNo, Model model) {

		Document document = service.selectUpdateDocument(documentNo);
		
		String documentType = document.getDocumentType();
		model.addAttribute("document", document);

		String path = "sign/update";
		
		switch(documentType) {
		case "1" : 
			String[] accountPhone = document.getAccountPhone().split("-");
			model.addAttribute("accountPhone", accountPhone);
			
			path += "ExpenseReport"; break;
		case "2" : path += "Meeting"; break;
		case "3" : path += "Vacation"; break;
		}
	
		System.out.println("됐냐?? " + path);
		return path;
	}
	
	
	// 품의서 수정
	@RequestMapping(value="{workNo}/updateExpenseReport", method=RequestMethod.POST)
	public String updateExpenseReport(Document document,
									  @RequestParam("pList") List<PurchaseList> pList,
									  @RequestParam("deletedpList") List<PurchaseList> deletedpList,
									  HttpServletRequest request, Model model) {
		
		int result = service.updateExpenseReport(document, pList, deletedpList);
		
		String path = null;
		
		if(result > 0) {
			path = "redirect:" + document.getDocumentNo();
			
		}else {
			path = "redirect:" + request.getHeader("referer");
		}
		
		return path;
	}
	
	
	// 회의록 수정
	@RequestMapping(value="{workNo}/updateMeeting", method=RequestMethod.POST)
	public String updateMeeting(Document document,
								@RequestParam("meetingJoin") List<MeetingJoin> meetingJoin,
								@RequestParam("deletedMeetingJoin") List<MeetingJoin> deletedMeetingJoin,
				  				HttpServletRequest request, Model model) {
		
		int result = service.updateMeeting(document, meetingJoin, deletedMeetingJoin);
		
		String path = null;
		
		if(result > 0) {
			path = "redirect:" + document.getDocumentNo();
			
		}else {
			path = "redirect:" + request.getHeader("referer");
		}
		
		return path;
	}
	
	
	// 휴가신청서 수정
	@RequestMapping(value="{workNo}/updateVacation", method=RequestMethod.POST)
	public String updateVacation(Document document,
								 HttpServletRequest request, Model model) {
		
		int result = service.updateVacation(document);
		
		String path = null;
		
		if(result > 0) {
			path = "redirect:" + document.getDocumentNo();
			
		}else {
			path = "redirect:" + request.getHeader("referer");
		}
		
		return path;
	}
	
	
	// 결재 문서 삭제
	@RequestMapping(value="{workNo}/delete")
	public String deleteDocument(int documentNo, 
								@ModelAttribute("loginMember") Member loginMember,
								HttpServletRequest request) {
		
		Document document = service.selectDocument(documentNo, loginMember.getMemberNo());
		
		if(document != null) {
			service.deleteDocument(documentNo);

		}
		return "redirect:" + request.getHeader("referer");
	}

	
	// 결재 회원 검색
	@RequestMapping(value="{workNo}/{documentNo}/signMemList",method=RequestMethod.POST)
	@ResponseBody
	public String memberSearch(Model model,Search search, @PathVariable("workNo") int workNo) {
		
		List<WorkspaceJoin> signMemList = service.selectSignMemList(search, workNo);
		
		Gson gson = new Gson();
		
		return gson.toJson(signMemList);
		
	}
	
	
	// 결재선 지정
	@RequestMapping(value="{workNo}/signLine", method=RequestMethod.POST)
	public String insertSignLine(int documentNo, int[] signLine, int[] viewer,
								 @PathVariable("workNo") int workNo,
								 @ModelAttribute("loginMember") Member loginMember,
								 HttpServletRequest request) {
		
		System.out.println(Arrays.toString(signLine));
		System.out.println(Arrays.toString(viewer));
		
		Document document = service.selectDocument(documentNo, loginMember.getMemberNo() );
		document.setWorkNo(workNo);
		int result = service.insertSignLine(document, signLine, viewer);
		
		return "redirect:/sign/{workNo}/signMain";
	}
	
	
	// 결재 진행
	@RequestMapping(value="{workNo}/{documentNo}/sign", method=RequestMethod.POST)
	public String signDocument(@PathVariable("workNo") int workNo,
							   @ModelAttribute SignLine signLine,
							   @ModelAttribute("loginMember") Member loginMember,
							   HttpServletRequest request) {
		
		signLine.setMemberNo(loginMember.getMemberNo());
		signLine.setWorkNo(workNo);
		
		System.out.println(signLine);
		
		service.signDocument(signLine);
		
		return "redirect:/sign/{workNo}/signMain";
	}
}
