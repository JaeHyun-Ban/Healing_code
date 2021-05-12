package com.team05.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationVO {
	
	private int resno;
	private String checkin;
	private String checkout;
	private int price;
	private String reserve_type;
	private Timestamp regdate;
	private String id;
	private int pro_no;
	private int room_no;
	
	
}
