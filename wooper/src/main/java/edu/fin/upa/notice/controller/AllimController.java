package edu.fin.upa.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.fin.upa.member.model.vo.Member;
import edu.fin.upa.notice.model.service.AllimService;
import edu.fin.upa.notice.model.vo.Allim;

@RequestMapping("/allimi/*")
@Controller
@SessionAttributes({ "loginMember" })
public class AllimController {

	@Autowired
	private AllimService service;

	@RequestMapping(value = "selectAllim", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String asyncSelectAllim(int memberNo) {

		List<Allim> list = service.selectAllim(memberNo);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value = "selectAllim", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String selectAllim(@ModelAttribute("loginMember") Member loginMember, Model model ) {

		List<Allim> list = service.selectAllim(loginMember.getMemberNo());
		model.addAttribute("allimList", list);
		
		return "notification/notification";
	}
	
	@RequestMapping(value = "readAllim", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public int readAllim(@ModelAttribute("allimList") Allim allimList, Model model ) {
		
		int result = service.readAllim(allimList.getAllimNo());
		
		return result;
	}
	
	@RequestMapping(value = "unreadAllim", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public int unreadAllim(@ModelAttribute("allimList") Allim allimList, Model model ) {
		
		int result = service.unreadAllim(allimList.getAllimNo());
		
		return result;
	}
	
	
	
	
}
