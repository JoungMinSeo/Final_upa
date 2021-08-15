package edu.fin.upa.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.fin.upa.calendar.model.service.CalendarService;
import edu.fin.upa.calendar.model.vo.Calendar;
import edu.fin.upa.calendar.model.vo.Card;
import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.list.model.vo.ListList;
import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.workspace.model.service.WorkspaceService;

@RequestMapping("/calendar/*")
@Controller
@SessionAttributes({"loginMember"})
public class CalendarController {

	@Autowired
	private CalendarService service;
	
	@Autowired
	private WorkspaceService workService;

	// 개인캘린더 조회
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String result(@ModelAttribute("loginMember") Member loginMember, Model model) {
		
		List<Workspace> workList = workService.selectWorkList(loginMember.getMemberNo());

		model.addAttribute("workList", workList);
		
		System.out.println(loginMember.getMemberNo());
		System.out.println(workList);
		
		
		return "/calendar/calendar";
	}
	
	// 개인캘린더 조회
	@RequestMapping(value = "selectCalendar" ,method=RequestMethod.POST)
	 @ResponseBody
	 public String selectCalendar(String startDate, @ModelAttribute("loginMember")Member loginMember) {
		
		System.out.println(startDate);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("memberNo", loginMember.getMemberNo());

		List<Calendar> list = service.selectCalendar(map);
		
		System.out.println("야 너 왜 안넘어와 : " + list);
		 
		 return new Gson().toJson(list); 
	}
	
	// 팀캘린더
   @RequestMapping(value="{workNo}/teamcal", method=RequestMethod.GET)
   public String teamcal(@PathVariable("workNo") int workNo, Model model) {
      
      Workspace work = workService.selectWorkspace(workNo);
      
      model.addAttribute("work", work);
      
      
      return "/calendar/teamSchedule";
   }
   
	// 팀캘린더
   @RequestMapping(value = "{workNo}/teamSchedule" ,method=RequestMethod.POST)
	 @ResponseBody
	 public String selectTeamCal(String startDate, @ModelAttribute("loginMember")Member loginMember,
			 										@PathVariable("workNo") int workNo) {
		
		System.out.println(startDate);
		
		Map<String, Object> map = new HashMap<>();
		map.put("workNo", workNo);
		map.put("startDate", startDate);
//		map.put("memberNo", loginMember.getMemberNo());

		List<Calendar> list = service.selectTeamCal(map);
		
		System.out.println("야 너 왜 안넘어와2 : " + list);
		 
		 return new Gson().toJson(list); 
	}
   
	// 개인캘린더 수정
//	@RequestMapping(value="calListUpdate", method=RequestMethod.POST)
//	public int updateCalendar(int listNo, Model model) {
//		/*
//		 * Map<String, Object> map = new HashMap<>();
//		 * 
//		 * map.put("listNo", listNo); map.put("title", title); map.put("start", start);
//		 * map.put("end", end);
//		 */
//		System.out.println(listNo);
//		int result = service.updateCalendar(listNo);
//		
//		return result;
//	}
	   
	// 새로운 일정 등록 시 조회할 카드번호,이름, 팀원 목록
	 @RequestMapping(value = "{workNo}/selectCM" ,method=RequestMethod.POST)
	 @ResponseBody
	 public String selectCM(@PathVariable("workNo") int workNo) {
		
		 List<Card> cardList = service.selectCardList(workNo);
		 List<Member> memberList = service.selectMemberList(workNo);
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("cardList", cardList);
		 map.put("memberList",	memberList);
		 
		 return new Gson().toJson(map);
	 }
	 
	 // 새로운 일정 등록
	 @RequestMapping(value = "{workNo}/insertCal" ,method=RequestMethod.POST)
	 @ResponseBody
	 public String insertCalendar(@PathVariable("workNo") int workNo) {
		 
		 
		 return null;
	 }

	
	
	
}
