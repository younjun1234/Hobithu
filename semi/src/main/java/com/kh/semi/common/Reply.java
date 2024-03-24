package com.kh.semi.common;

import java.sql.Date;

public class Reply {
	private String replyNo;
	private String replyContent;
	private Date replyDate;
	private String userNo;
	private String clubNo;
	private String clubName;
	private String likeNo;
	private String sendLikeUser;
	private String writerUserId;
	private String likeUserId;
	
	
	public Reply() {}


	public Reply(String replyNo, String replyContent, Date replyDate, String userNo, String clubNo, String clubName,
			String likeNo, String sendLikeUser, String writerUserId, String likeUserId) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.userNo = userNo;
		this.clubNo = clubNo;
		this.clubName = clubName;
		this.likeNo = likeNo;
		this.sendLikeUser = sendLikeUser;
		this.writerUserId = writerUserId;
		this.likeUserId = likeUserId;
	}


	public String getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public Date getReplyDate() {
		return replyDate;
	}


	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public String getClubNo() {
		return clubNo;
	}


	public void setClubNo(String clubNo) {
		this.clubNo = clubNo;
	}


	public String getClubName() {
		return clubName;
	}


	public void setClubName(String clubName) {
		this.clubName = clubName;
	}


	public String getLikeNo() {
		return likeNo;
	}


	public void setLikeNo(String likeNo) {
		this.likeNo = likeNo;
	}


	public String getSendLikeUser() {
		return sendLikeUser;
	}


	public void setSendLikeUser(String sendLikeUser) {
		this.sendLikeUser = sendLikeUser;
	}


	public String getWriterUserId() {
		return writerUserId;
	}


	public void setWriterUserId(String writerUserId) {
		this.writerUserId = writerUserId;
	}


	public String getLikeUserId() {
		return likeUserId;
	}


	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
	}


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyDate=" + replyDate + ", userNo="
				+ userNo + ", clubNo=" + clubNo + ", clubName=" + clubName + ", likeNo=" + likeNo + ", sendLikeUser="
				+ sendLikeUser + ", writerUserId=" + writerUserId + ", likeUserId=" + likeUserId + "]";
	}

	
	
	
}
