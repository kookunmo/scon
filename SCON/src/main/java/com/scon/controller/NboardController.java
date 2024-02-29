package com.scon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scon.domain.Criteria;
import com.scon.domain.NboardVO;
import com.scon.service.NboardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class NboardController {

	//자동주입
	private NboardService service;

	//목록 GET -- main page
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {}
	
	////////////////////////////////////////////////////////////////////////////
	//등록 GET
	@GetMapping("/register")
	public void register() {}

	//등록 POST
	@PostMapping("/register")
	public String register(NboardVO board, RedirectAttributes rttr) {
		return "redirect:";
	}
	////////////////////////////////////////////////////////////////////////////
	
	
	//상세보기 GET  
	@GetMapping({"/get"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri , Model model ) {
		
	}
	
	// 수정 GET
	@GetMapping({"/modify"})
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri , Model model ) {}
	
	// 수정 POST
	@PostMapping("/modify")
	public String modify(NboardVO board, RedirectAttributes rttr) {
		return "redirect:";
	}
	
	// 삭제 POST
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,  RedirectAttributes rttr) {
		
		return "redirect:";
	}
	
	
	

}
