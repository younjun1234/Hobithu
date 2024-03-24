package com.kh.semi.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.common.Reply;
import com.kh.semi.member.model.vo.Member;

public interface MemberService {

	ArrayList<Member> selectClubMembers(Club club);
	
	int insertMember(Member m);

	int checkId(String id);

	int checkNick(String nick);

	Member login(Member m);

	ArrayList<Member> searchId(Member m);

	int checkPWD(Member m);
	
	int updatePWD(Member m);

	ArrayList<HashMap<String, Object>> selectMylist(String id);

	ArrayList<HashMap<String, Object>> editMyInformation(String id);

	int updateMyInformation(Member member);

	int updatePassword(Member loginUser);

	int deleteMember(String userId);

	int updateUserProfile(Member member);

	ArrayList<Club> userClubList(int userNo);

	List<Alarm> noticeUser(int userNo);

	ArrayList<HashMap<String, Object>> selectLikeList(int userNo);

	ArrayList<Reply> userReplyList(int userNo);

	ArrayList<Club> userCreateList(int userNo);

	// 선우님
	
	ArrayList<Member> selectLatestMember();


}
