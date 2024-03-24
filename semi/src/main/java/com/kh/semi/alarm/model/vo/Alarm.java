package com.kh.semi.alarm.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Alarm {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int userNo;
	private Date readDate;
	
}
