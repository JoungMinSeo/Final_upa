package edu.fin.upa.card.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.fin.upa.card.model.service.CardService;
import edu.fin.upa.member.model.vo.Member;


@SessionAttributes({"loginMember", "workNo"})
@RequestMapping("/card/*")
@Controller
public class CardController {
	
	@Autowired
	private CardService service;
	
	// 해당 워크스페이스에 등록된 카드 정보 가져오기
	@RequestMapping(value = "cardList", method=RequestMethod.POST)
	public String selectCardList(@ModelAttribute("loginMember") Member loginMember, @ModelAttribute("workNo") int workNo) {

		
		
	
		
		
		return null;
	}

	
	
}
