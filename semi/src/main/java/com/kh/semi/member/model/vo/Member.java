package com.kh.semi.member.model.vo;

import java.sql.Date;

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
public class Member {
	private int userNo;
	private String userName;
	private String nickName;
	private String userId;
	private String userPwd;
	private String email;
	private String isAdmin;
	private String status;
	private String gender;
	private String hobby;
	private Date createDate;
	private Date birthDate;
	private String profile;
	
	
}
