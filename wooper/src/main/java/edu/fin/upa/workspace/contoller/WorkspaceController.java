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

import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.card.model.service.CardService;
import edu.fin.upa.list.model.service.ListService;
import edu.fin.upa.list.model.vo.ListList;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.workspace.model.service.WorkspaceService;
import edu.fin.upa.workspace.model.vo.WorkspaceJoin;

@SessionAttributes({ "loginMember", "work" })
@RequestMapping("/workspace/*")
@Controller
public class WorkspaceController {
	
	@Autowired
	private WorkspaceService service;
	
	@Autowired
	private CardService cardService;
	
	@Autowired
	private ListService listService;
	
	
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
	
		// 워크스페이스 정보 조회
		Workspace work = service.selectWorkspace(workNo);
		model.addAttribute("work", work);
		
		// 워크스페이스별 카드 조회
		List<Card> cardList = cardService.selectCardList(workNo);
		model.addAttribute(cardList);
		
		System.out.println(cardList);
		
		// 리스트 조회
		if(!cardList.isEmpty()) {
			List<ListList> listList = listService.selectList(cardList);
			
			model.addAttribute("listList", listList);
		}
		
		return "/workSpace/boardMain";
	}
	
	@RequestMapping(value="addWork", method=RequestMethod.POST)
	public String addWork(@ModelAttribute("loginMember") Member loginMember, Model model, Workspace inputWork, WorkspaceJoin workspaceJoin ) {
		
		inputWork.setMemberNo(loginMember.getMemberNo());
		
		service.addWorkspace(inputWork);
	
		workspaceJoin.setMemberNo(inputWork.getMemberNo());
		workspaceJoin.setWorkNo(inputWork.getWorkNo());
		
		service.addWorkspaceJoin(inputWork);
		
		return "redirect:/calendar/calendar";
	}
	
	

}
