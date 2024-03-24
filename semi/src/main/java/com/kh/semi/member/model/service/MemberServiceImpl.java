package com.kh.semi.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.common.Reply;
import com.kh.semi.member.model.DAO.MemberDAO;
import com.kh.semi.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Member> selectClubMembers(Club club) {
		return mDAO.selectClubMembers(sqlSession, club);
	}
	
	//
	//
	//	성운님
	//
	//
	
	
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession, id);
	}

	@Override
	public int checkNick(String nick) {
		return mDAO.checkNick(sqlSession, nick);
	}

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	@Override
	public ArrayList<Member> searchId(Member m) {
		return mDAO.searchId(sqlSession, m);
	}

	@Override
	public int checkPWD(Member m) {
		return mDAO.checkPWD(sqlSession, m);
	}
	
	@Override
	public int updatePWD(Member m) {
		return mDAO.updatePWD(sqlSession, m);
	}
	
	//
	//
	// 아림님
	//
	//

	@Override
	public ArrayList<HashMap<String, Object>> selectMylist(String id) {
		return mDAO.selectMylist(sqlSession, id);
	}

	@Override
	public ArrayList<HashMap<String, Object>> editMyInformation(String id) {
		return mDAO.editMyInformation(sqlSession, id);
	}

	@Override
	public int updateMyInformation(Member member) {
		return mDAO.updateMyInformation(sqlSession, member);
	}

	@Override
	public int updatePassword(Member loginUser) {
		return mDAO.updatePassword(sqlSession, loginUser);
	}

	@Override
	public int deleteMember(String userId) {
		return mDAO.deleteMember(sqlSession, userId);
	}

	@Override
	public int updateUserProfile(Member member) {
		return mDAO.updateUserProfile(sqlSession, member);
	}

	@Override
	public ArrayList<Club> userClubList(int userNo) {
		return mDAO.userClubList(sqlSession, userNo);
	}

	@Override
	public List<Alarm> noticeUser(int userNo) {
		return mDAO.noticeUser(sqlSession, userNo);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectLikeList(int userNo) {
		return mDAO.selectLikeList(sqlSession, userNo);
	}

	@Override
	public ArrayList<Reply> userReplyList(int userNo) {
		return mDAO.userReplyList(sqlSession, userNo);
	}

	@Override
	public ArrayList<Club> userCreateList(int userNo) {
		return mDAO.userCreateList(sqlSession, userNo);
	}

	//
	//선우님
	//
	
	@Override
	public ArrayList<Member> selectLatestMember() {
		return mDAO.selectLatestMember(sqlSession);
	}



	
}
