package edu.fin.upa.management.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.management.model.service.ManagementService;
import edu.fin.upa.management.model.vo.Management;
import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.workspace.model.service.WorkspaceService;

@RequestMapping("/management/*")
@Controller
@SessionAttributes({ "loginMember" })
public class ManagementController {

	@Autowired
	private ManagementService mService;

	@Autowired
	private WorkspaceService workService;

	// 멤버 조회
	@RequestMapping(value = "{workNo}/member/list")
	public String selectMember(@PathVariable("workNo") int workNo, Model model, Pagination pg,
											 @RequestParam(value="cp", required=false, defaultValue="1")int cp) {

		Workspace work = workService.selectWorkspace(workNo);
		
		Pagination pagination = null;
		List<Management> memberList = null;
		
		
		pg.setWorkNo(workNo);
		pg.setCurrentPage(cp);
		
		
		System.out.println("workNo : " + workNo);

		pagination = mService.getPagination(pg);
		memberList = mService.selectMemberList(pagination);
		
		model.addAttribute("work", work);
		model.addAttribute("pagination", pagination);
		model.addAttribute("memberList", memberList);
		System.out.println("memberList : " + memberList);

		return "/member/management";
	}
	
	// 팀멤버 추가
	@RequestMapping(value="{workNo}/add")
	public String addJoinMember(@ModelAttribute Management inputAddEmail, RedirectAttributes ra) {
		
		int result = mService.addJoinMember(inputAddEmail);
		
		return null;
	}
	
	
	
	// 회원등급수정
	@RequestMapping(value="{workNo}/update")
	public String updateMemberRank(@PathVariable("workNo") int workNo,
													  @PathVariable("memberNo") int memberNo,
													  Management management, RedirectAttributes ra,
													  HttpServletRequest request, Model model) {
		
		int result = mService.updateMemberRank(management);
		
		String path = null;
		if(result > 0) { // 수정 성공
			swalSetMessage(ra, "success", "도롱뇽 등급 수정 성공", null);
			path ="redirect:";
		}else { // 수정 실패
			swalSetMessage(ra, "error", "도롱뇽 등급 수정 실패", null);
			path= "redirect:" + request.getHeader("referer");
		}
		return path;
	}
	
	// 팀 회원 삭제
	@RequestMapping(value="{workNo}/delete")
	public String deleteJoinMember(@PathVariable("workNo")int workNo, Management management,
													RedirectAttributes ra) {
		
		int result = mService.deleteJoinMember(workNo, management);
		
		String path = "redirect:";
		
		if(result > 0) { // 회원삭제성공
			swalSetMessage(ra, "success", "도롱뇽을 추방하였습니다.", null);
			path += "member/management";
		}else { // 회원삭제실패
			swalSetMessage(ra, "error", "도롱뇽 추방에 실패하였습니다.", null);
			path +="secession";
		}
		
		return path;
	}
	

	
	
	// SweetAlert를 이용한 메시지 전달용 메서드
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		// RedirectAttibutes : 리다이렉트 시 값을 전달하는 용도의 객체 
		
		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
   
}
