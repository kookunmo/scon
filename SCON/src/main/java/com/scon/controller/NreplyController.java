package com.scon.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.scon.domain.Criteria;
import com.scon.domain.NreplyVO;
import com.scon.domain.ReplyPageDTO;
import com.scon.service.NreplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class NreplyController {
	private NreplyService service;
	
	//////댓글등록///////
	@PostMapping(value="/new", consumes ="application/json", produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody NreplyVO vo){
		int insertCount = service.register(vo);
		log.info("ReplyVO: " + vo);
		return insertCount ==1 ?
				 new ResponseEntity<String>("success~!",HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
	
	//////댓글상세보기///////
	@GetMapping(value="/{rno}")
	public ResponseEntity<NreplyVO> get(@PathVariable("rno") Long rno){
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	//////댓글수정///////
	@RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH} , value="/{rno}", consumes ="application/json")
	public ResponseEntity<String> modify(@RequestBody NreplyVO vo,@PathVariable("rno") Long rno){
		vo.setBno(rno);
		
		return service.modify(vo)==1
				? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			
	}
	//////댓글삭제///////
	@DeleteMapping(value="/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		
	return service.remove(rno)==1
			? new ResponseEntity<String>("success",HttpStatus.OK)
			: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//////댓글 페이징처리///////
	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {

		Criteria cri = new Criteria(page, 10);
		log.info("get Reply List bno: " + bno);
		log.info("cri:" + cri);
		return new ResponseEntity<ReplyPageDTO>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	
	
	
}
