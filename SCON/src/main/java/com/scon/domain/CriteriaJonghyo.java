package com.scon.domain;

import lombok.Data;

@Data
public class CriteriaJonghyo {
	private int pageNum; //페이지넘버
	  private int amount; //몇개 글 보여줄건지
	  
	  private String type; 
	  private String keyword;
	  
	  public CriteriaJonghyo() {
		 this(1,Integer.MAX_VALUE);
	  }
	  public CriteriaJonghyo(int pageNum, int amount) {
		this.pageNum= pageNum;
		this.amount=amount;
	  }
	  public String[] getTypeArr() {
		    
		    return type == null? new String[] {}: type.split("");
		  }
}
