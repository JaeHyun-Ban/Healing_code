package com.team05.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	
	private int pro_no;
	private String name;
	private String tel;
	private String basic_address;
	private String detail_address;
	private String pro_type;
	private int rental_price;
	private int half_price;
	private String uploadpath;
	private String filename;
	private String filerealname;
	private String fileloca;
	private String regdate;
	
	private double latitude;
	private double hardness;
	
	

}
