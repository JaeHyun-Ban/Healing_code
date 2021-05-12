package com.team05.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVO {
	private int room_no;
	private String title;
	private String checkin;
	private String checkout;
	private int half_time;
	private int rental_price;
	private int half_price;
	private int pro_no;
	
	private String fileloca;
	private String filename;
}
