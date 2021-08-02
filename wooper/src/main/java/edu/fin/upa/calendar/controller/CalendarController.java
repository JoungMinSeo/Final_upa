package edu.fin.upa.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.fin.upa.calendar.model.service.CalendarService;
import edu.fin.upa.calendar.model.vo.CalendarTest;

@RequestMapping("/calendar/*")
@Controller
public class CalendarController {

	@Autowired
	private CalendarService service;

	// 임시 화면
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String result() {
		return "/calendar/calendar";
	}

	
	 @RequestMapping(value="selectCalendar",method=RequestMethod.POST)
	 @ResponseBody
	 public String selectCalTest(String startDate) {
		 List<CalendarTest> list = service.selectCalTest(startDate);
		 return new Gson().toJson(list); 
	}
	 

}
