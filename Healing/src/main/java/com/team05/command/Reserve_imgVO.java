package com.team05.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reserve_imgVO {
	
	
	//마이페이지에서 예약된정보와 이미지를 가지고 오기위한 VO
	
	private int resno;
	private String checkin;
	private String checkout;
	private int price;
	private String reserve_type;
	private Timestamp regdate;
	private String id;
	private int pro_no;
	private int room_no;
	
	private String name;
	private String uploadpath;
	private String filename;
	private String filerealname;
	private String fileloca;
	private String tel;
	
	
}
