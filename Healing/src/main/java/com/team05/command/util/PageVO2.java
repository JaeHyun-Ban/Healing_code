package com.team05.command.util;

import lombok.Data;

@Data
public class PageVO2 {
	private int endPage;
	private int startPage;
	
	private boolean prev;
	private boolean next;
	
	private int pageNum;
	private int amount;
	
	private Criteria2 cri;
	private int total;
	
	public PageVO2(Criteria2 cri, int total) {
		pageNum = cri.getPageNum();
		amount = cri.getAmount();
		
		
				this.pageNum = cri.getPageNum();
				this.amount = cri.getAmount();
				
				this.total = total;
				this.cri = cri;
				
				
				this.endPage = (int)(Math.ceil(this.pageNum / (double)amount) ) * amount;
				this.startPage = endPage-9;		
				
				int realend = (int) Math.ceil(this.total/(double)this.amount);
				
				if(endPage> realend) {
					endPage = realend;
				}
				
				this.prev = this.startPage >1;
				this.next = this.endPage < realend;
				
	}
}
