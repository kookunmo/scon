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
   public void main(Criteria cri, Model model , @RequestParam(value = "ccode", defaultValue = "0") String ccode) {
	  log.info("ccode는 : "+ ccode);
	  log.info("cri는 : "+ cri);
      if(ccode.equals("0")){
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
      int total = service.getTotal(cri); //전체글수
      log.info(cri);
      model.addAttribute("pageMaker", new PageDTO(cri, total));
   }

   ////////////////////////////////////////////////////////////////////////////
   //등록 GET
 //등록 GET
   @GetMapping("/insert")
	public void register() {}

	//등록 POST
	@PostMapping("/insert")
	public String register(NboardVO board, RedirectAttributes rttr) {		
		service.register(board);
		return "redirect:/main";
	}
   
   ////////////////////////////////////////////////////////////////////////////
   

   //상세보기 GET  
   @GetMapping({"/get"})
   public void get(@RequestParam("bno") Long bno, @RequestParam(value = "ccode", defaultValue = "0") String ccode,@ModelAttribute("cri") Criteria cri , Model model ) {
      service.updateReadCount(bno);
      model.addAttribute("board", service.get(bno)); // 특정 게시글을 모델에 추가
      
      model.addAttribute("IT", service.getIT());
      model.addAttribute("AI", service.getAI());
      model.addAttribute("SPACE", service.getSPACE());
      model.addAttribute("NATURE", service.getNATURE());
      model.addAttribute("ccode",ccode);

	   
   }
   
   // 수정 GET
   @GetMapping({"/modify"})
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri , Model model ) { 
		model.addAttribute("board", service.get(bno));
	}
	
	// 수정 POST
	@PostMapping("/modify")
	public String modify(NboardVO board, RedirectAttributes rttr) {
			if(service.modify(board)) { //수정처리가 되었으면
				rttr.addFlashAttribute("result", "수정완료");
			}
			return "redirect:/get?bno=" + board.getBno();
	}
	
	// 삭제 POST
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,  RedirectAttributes rttr) {
		if(service.remove(bno)) { //삭제처리가 되었으면
			rttr.addFlashAttribute("result", "삭제완료");
		}
		return "redirect:/main";
	}
	// 관리자 페이지로 이동하는 메서드
		@PostMapping("/admin")
		public String adminPage(@RequestParam("password") String password, RedirectAttributes rttr) {
		    // 비밀번호 확인
		    if (service.checkPassword(password)) {
		        // 비밀번호가 일치하면 관리자 페이지로 이동
		        return "redirect:/insert";
		    } else{
		        // 비밀번호가 일치하지 않으면 오류 메시지 전달 후 페이지 반환
		    	rttr.addFlashAttribute("adminx", "x");
		        log.info(rttr);
		    	return "redirect:/main"; // 여기에 해당하는 메인 페이지로 이동
		    }
		    
		}
		
		
		@PostMapping("/admin1")
		public String adminPage1(@RequestParam("password") String password,@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		    // 비밀번호 확인
		    if (service.checkPassword(password)) {
		        // 비밀번호가 일치하면 관리자 페이지로 이동
		    	return "redirect:/insert";
		    } else{
		        // 비밀번호가 일치하지 않으면 오류 메시지 전달 후 페이지 반환
		    	rttr.addFlashAttribute("adminx", "x");
		        log.info(rttr);
		    	return "redirect:/get?bno=" + bno; 
		    }
		    
		}
		
		@PostMapping("/admin2")
		public String adminPage2(@RequestParam("password") String password,@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		    // 비밀번호 확인
		    if (service.checkPassword(password)) {
		        // 비밀번호가 일치하면 관리자 페이지로 이동
		    	return "redirect:/modify?bno=" + bno;
		    } else{
		        // 비밀번호가 일치하지 않으면 오류 메시지 전달 후 페이지 반환
		    	rttr.addFlashAttribute("adminx", "x");
		        log.info(rttr);
		    	return "redirect:/get?bno=" + bno; 
		    }
		    
		}
		
		@PostMapping("/admin3")
		public String adminPage3(@RequestParam("password") String password,@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		    // 비밀번호 확인
		    if (service.checkPassword(password)) {
		        // 비밀번호가 일치하면 관리자 페이지로 이동
		        return "redirect:/remove?bno=" + bno;
		    } else{
		        // 비밀번호가 일치하지 않으면 오류 메시지 전달 후 페이지 반환
		    	rttr.addFlashAttribute("adminx", "x");
		        log.info(rttr);
		    	return "redirect:/get?bno=" + bno; 
		    }
		    
		}
   
   

}