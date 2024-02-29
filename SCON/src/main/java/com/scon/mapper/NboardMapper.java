package com.scon.mapper;

import java.util.List;

import com.scon.domain.Criteria;
import com.scon.domain.FileVO;
import com.scon.domain.NboardVO;

public interface NboardMapper {
	//목록
	public List<NboardVO> getList();
	
	//등록
	public void insert(NboardVO board);
	
	//등록 . key값 구하기
	public Integer insertSelectkey(NboardVO board);
	
	//상세보기
	public NboardVO read(Long bno);
	
	//글삭제 성공시 1로 나옴
	public int delete(Long bno);
	
	//글수정 성공시 1로 나옴
	public int update(NboardVO board);
	
	//글갯수 카운트 (갯수로 나옴)
	public int getTotalCount(Criteria cri);
	
	//페이징처리 LIST타입으로
	public List<NboardVO> getListWithPaging(Criteria cri);
	
	//파일업로드//어케쓸지 모르겟음
	public void saveFile(FileVO vo);


}
