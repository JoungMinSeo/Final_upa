package edu.fin.upa.management.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.emory.mathcs.backport.java.util.Arrays;
import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.management.model.service.ManagementService;
import edu.fin.upa.management.model.vo.Management;
import edu.fin.upa.management.model.vo.Pagination;
import edu.fin.upa.member.model.vo.Member;
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
	
	
	// 팀 멤버 초대 메일 보내기
	@RequestMapping("{workNo}/sendEmail")
	@ResponseBody
	public int invitation(@ModelAttribute Management inputAddEmail) {
																			// workNo,, memberId, memberRank
			return mService.invitation(inputAddEmail);
	}
	
	// 초대링크 수락
	@RequestMapping(value="{workNo}/add")
	public String addJoinMember(@PathVariable("workNo") int workNo,
														@ModelAttribute("loginMember") Member loginMember,
														Management management, 	RedirectAttributes ra, Model model) {
		
		String path = "redirect:/";
		
		if(loginMember != null) {
			//  로그인된 회원의 회원 번호를 얻어와 세팅
			management.setMemberNo(loginMember.getMemberNo());
			
			int result = mService.addJoinMember(management);
			
			if(result > 0) {
				swalSetMessage(ra, "success", "도롱뇽이 된 것을 환영합니다.", null);
				path = "redirect:/workspace/"+workNo+"/boardMain";
			}else if(result == -1) {
				swalSetMessage(ra, "info", "이미 가입된 도롱뇽입니다.", null);
				path = "redirect:/workspace/"+workNo+"/boardMain";
			}else {
				swalSetMessage(ra, "error", "초대받지않은 도롱뇽입니다.", null);
			}
			
			
		}else {
			model.addAttribute("loginMember", loginMember);
			swalSetMessage(ra, "info", "로그인 후 초대 링크를 눌러주세요.", null);
		}
		
		return path;
	}
	
	// 회원등급수정
	@RequestMapping(value="{workNo}/rankUpdate")
	@ResponseBody
	public int updateMemberRank(@PathVariable("workNo") int workNo,
											     @ModelAttribute("loginMember") Member loginMember,
											     Management management, RedirectAttributes ra,
											     HttpServletRequest request, Model model,
											     int[] ckMemberNo, String[] changeRank) {
		
//		 System.out.println(Arrays.toString(ckMemberNo));
//		 System.out.println(Arrays.toString(changeRank));
		
//		String path = "redirect:/";
		
		List<Management> list = new ArrayList<Management>();
		for(int i = 0 ; i < ckMemberNo.length ; i++) {
			Management m = new Management();
			m.setMemberNo(ckMemberNo[i]);
			m.setMemberRank(changeRank[i]);
			m.setWorkNo(workNo);
			
			list.add(m);
		}
		
		int result = mService.updateMemberRank(list);
		System.out.println(result);
		return result;
	}
	
	// 팀 회원 삭제
	@RequestMapping(value="{workNo}/TMDelete")
	@ResponseBody
	public int deleteJoinMember(@PathVariable("workNo") int workNo,
												    @ModelAttribute("loginMember") Member loginMember,
												    Management management, RedirectAttributes ra,
												    HttpServletRequest request, Model model,
												    int[] ckMemberNo) {
		
		List<Management> list = new ArrayList<Management>();
		for(int i=0 ; i<ckMemberNo.length ; i++) {
			Management m = new Management();
			
			m.setMemberNo(ckMemberNo[i]);
			m.setWorkNo(workNo);
			
			list.add(m);
		}
			int result = mService.deleteJoinMember(list);
			
		return result;
	}

	// 현재 참여하고있는 워크스페이스 탈퇴
	@RequestMapping(value="{workNo}/selfDelete")
	@ResponseBody
	public int selfDeleteMember(@PathVariable("workNo") int workNo,
			@ModelAttribute("loginMember") Member loginMember,
			Management management, RedirectAttributes ra,
			HttpServletRequest request, Model model,
			int[] ckMemberNo) {
		
		int result = 0;
		String path = "redirect:/";
		
		List<Management> list = new ArrayList<Management>();
		
		for(int i=0 ; i<ckMemberNo.length ; i++) {
			Management m = new Management();
			
			m.setMemberNo(ckMemberNo[i]);
			m.setWorkNo(workNo);
			
			
			list.add(m);
			
			if(m.getMemberNo() == loginMember.getMemberNo()) {
				result = mService.deleteJoinMember(list);
			} 
			
		}
		
		return result;
	}
	
	// SweetAlert를 이용한 메시지 전달용 메서드
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		// RedirectAttibutes : 리다이렉트 시 값을 전달하는 용도의 객체 
		
		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
	
	
	
   
}
