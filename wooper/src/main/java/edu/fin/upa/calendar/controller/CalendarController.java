package edu.fin.upa.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/calendar/*")
@Controller
public class CalendarController {
	
	   // 임시 화면
	   @RequestMapping(value = "calendar", method = RequestMethod.GET)
	   public String result() {
	      return "calendar";
	   }
}
