package edu.fin.upa.workspace.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.workspace.model.service.WorkspaceService;

@SessionAttributes({ "loginMember", "work" })
@RequestMapping("/workspace/*")
@Controller
public class WorkspaceController {
	
	@Autowired
	private WorkspaceService service;
	// 임시 화면
		@RequestMapping(value = "workSpace", method = RequestMethod.GET)
		public String result() {
			return "/workSpace/boardMain";
	}
	
	
	// 내가 참여한 워크스페이스 목록 얻어오기 (로그인하자마자 보이는 페이지)
	@RequestMapping(value = "workList", method=RequestMethod.POST)
	public String workspaceMain(@ModelAttribute("loginMember") Member loginMember, Model model) {

		List<Workspace> workList = service.selectWorkList(loginMember.getMemberNo());

		model.addAttribute("workList", workList);

		System.out.println(workList.toString());

		return "redirect:/workSpace/workSpace";
	}
	
	
	// 현재 들어간 워크스페이스 정보 조회
	@RequestMapping(value="{workNo}/boardMain", method=RequestMethod.GET)
	public String boardMain(@PathVariable("workNo") int workNo, Model model) {
		
		/*
		 * List<Workspace> workList = service.selectWorkList(loginMember.getMemberNo());
		 * 
		 * model.addAttribute("workList", workList);
		 */
		
		Workspace work = service.selectWorkspace(workNo);
		
		model.addAttribute("work", work);
		
		return "/workSpace/boardMain";
	}
	
	

}
