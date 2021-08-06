package edu.fin.upa.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.fin.upa.calendar.model.service.CalendarService;
import edu.fin.upa.calendar.model.vo.Calendar;
import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.member.model.vo.Member;

@RequestMapping("/calendar/*")
@Controller
@SessionAttributes({"loginMember"})
public class CalendarController {

	@Autowired
	private CalendarService service;

	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String result() {
		return "/calendar/calendar";
	}
	
	@RequestMapping(value = "selectCalendar" ,method=RequestMethod.POST)
	 @ResponseBody
	 public String selectCalendar(String startDate, @ModelAttribute("loginMember")Member loginMember) {
		
		System.out.println(startDate);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("memberNo", loginMember.getMemberNo());

		List<Calendar> list = service.selectCalendar(map);
		 
		 return new Gson().toJson(list); 
	}
	
}
