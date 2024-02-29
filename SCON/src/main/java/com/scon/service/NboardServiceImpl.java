package com.scon.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scon.domain.Criteria;
import com.scon.domain.FileVO;
import com.scon.domain.NboardVO;
import com.scon.mapper.NboardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service //500번 에러가난다 이게 없으면! internal server error
@AllArgsConstructor //롬복의 annotation인데 모든 필드를 초기화하는 생성자를 만들어줌
public class NboardServiceImpl implements NboardService{
	
	//자동주입
	private NboardMapper mapper;
	
	@Override
	public List<NboardVO> getList() {
		 log.info("getList..........");
		return mapper.getList();
	}
	
	@Override
	public void register(NboardVO board) {
		mapper.insertSelectkey(board);		
	}
	
	@Override
	public NboardVO get(Long bno) {
		// TODO Auto-generated method stub
		return mapper.read(bno);
	}
	
	@Override
	public boolean remove(Long bno) {
		log.info("삭제실행" + bno);
		return mapper.delete(bno)==1;//영향받은 행의수가 1이면 삭제성동
	}
	
	@Override
	public boolean modify(NboardVO board) {
		log.info("수정실행" + board);
		return mapper.update(board)==1;//영향받은 행의수가 1이면 업뎃성공
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("갯수" + mapper.getTotalCount(cri));
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<NboardVO> getList(Criteria cri) {
		log.info("리스트 호출");
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void saveFile(FileVO vo) {
		mapper.saveFile(vo);
	}
	
}
