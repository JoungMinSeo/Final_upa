package edu.fin.upa.workspace.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping("/workSpace/*")
@Controller
public class WorkSpaceController {
	

	// 임시 화면
	@RequestMapping(value = "workSpace", method = RequestMethod.GET)
	public String result() {
		return "/workSpace/boardMain";
	}

}
