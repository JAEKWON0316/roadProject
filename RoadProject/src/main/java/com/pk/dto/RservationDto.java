package com.pk.dto;

import lombok.Data;

@Data
public class RservationDto {
	private String userid;
	private String usertel;
	private int rtCode;
	private String rtAddr1;
	private String rtAddr2;
	private String rtTel;
	private String rtName;
	private int resNum;
	private String resTime;
	private String resDay;
	private String resKeyword;
	
	public RservationDto() {}
}
