package edu.fin.upa.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.fin.upa.sign.model.service.SignService;

@Controller
@RequestMapping("/sign/*")
@SessionAttributes({"loginMember"})
public class SignController {

	@Autowired
	private SignService service;
}
