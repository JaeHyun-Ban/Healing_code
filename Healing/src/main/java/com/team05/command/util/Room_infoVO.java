package com.team05.command.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room_infoVO {
	
	private String pro_title;
	private String title;
	private int pro_no;
	private int room_no;
	private String pro_type;
	private int time1;
	private int time2;
	private String checkin;
	private String checkout;
	private int price;
}
