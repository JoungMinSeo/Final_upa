package edu.fin.upa.management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.fin.upa.calendar.model.vo.Workspace;
import edu.fin.upa.management.model.service.ManagementService;
import edu.fin.upa.workspace.model.service.WorkspaceService;

@RequestMapping("/management/*")
@Controller
@SessionAttributes({"loginMember"})
public class ManagementController {

	@Autowired
	private ManagementService service;
	
	@Autowired
	private WorkspaceService workService;
	
	// 멤버화면연결
   @RequestMapping(value="{workNo}/member", method=RequestMethod.GET)
   public String management(@PathVariable("workNo") int workNo, Model model) {
      
      Workspace work = workService.selectWorkspace(workNo);
      
      model.addAttribute("work", work);
      
      
      return "/member/management";
   }
	   
}
