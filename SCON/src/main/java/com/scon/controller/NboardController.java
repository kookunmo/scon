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
import com.scon.domain.PageDTO;
import com.scon.service.NboardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class NboardController {

   //자동주입
   private NboardService service;
   
   //목록 GET -- main page
   @GetMapping("/main")
   public void main(Criteria cri, Model model ,@RequestParam(value = "ccode", defaultValue = "0") String ccode) {
	  log.info("ccode는 : "+ ccode);
      if(ccode.equals("0")) {
	   model.addAttribute("list", service.getList(cri));
      };
      if(ccode.equals("1")) {
   	   model.addAttribute("list", service.getList1(cri));
      };
      if(ccode.equals("2")) {
      	   model.addAttribute("list", service.getList2(cri));
      };
      if(ccode.equals("3")) {
      	   model.addAttribute("list", service.getList3(cri));
      };
      if(ccode.equals("4")) {
     	   model.addAttribute("list", service.getList4(cri));
      };
      
      model.addAttribute("IT", service.getIT());
      model.addAttribute("AI", service.getAI());
      model.addAttribute("SPACE", service.getSPACE());
      model.addAttribute("NATURE", service.getNATURE());
      model.addAttribute("ccode",ccode);
      int total = service.getTotal(cri); // 전체글수
      model.addAttribute("pageMaker", new PageDTO(cri, total));
   }

   ////////////////////////////////////////////////////////////////////////////
   //등록 GET
   @GetMapping("/register")
   public void register() {}
   
   
   //등록 POST
   @PostMapping("/register")
   public String register(NboardVO board, RedirectAttributes rttr) {
      return "redirect:/main";
   }
   ////////////////////////////////////////////////////////////////////////////
   

   //상세보기 GET  
   @GetMapping({"/get"})
   public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri , Model model ) {
	   service.updateReadCount(bno);
	   model.addAttribute("board", service.get(bno)); // 특정 게시글을 모델에 추가
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