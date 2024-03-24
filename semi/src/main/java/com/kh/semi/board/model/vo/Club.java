package com.kh.semi.board.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Club {
	private int clubNo;
	private String clubName;
	private Date clubCreateDate;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date clubSchedule;
	private String content;
	private String onlineYN;
	private String backgroundImage;
	private String clubAccess;
	private String clubCapacity;
	private String selectGender;
	private int categoryCode;
	private String paymentYN;
	private String ageRange;
	private int creator;
	private String addr;
	private String categoryClass;
	private String categoryName;
	private String creatorName;
	private String status;
}

