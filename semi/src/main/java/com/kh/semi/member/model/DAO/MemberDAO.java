package com.kh.semi.member.model.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.common.Reply;
import com.kh.semi.member.model.vo.Member;

public interface MemberDAO {

	Member login(SqlSessionTemplate sqlSession, Member member);

	ArrayList<Member> selectClubMembers(SqlSessionTemplate sqlSession, Club club);
	
	//
	//
	//	성운님
	//
	//

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	int checkId(SqlSessionTemplate sqlSession, String id);

	int checkNick(SqlSessionTemplate sqlSession, String nick);

	ArrayList<Member> searchId(SqlSessionTemplate sqlSession, Member m);

	int checkPWD(SqlSessionTemplate sqlSession, Member m);

	int updatePWD(SqlSessionTemplate sqlSession, Member m);
	
	//
	//
	//	아리님
	//
	//
	
	ArrayList<HashMap<String, Object>> selectMylist(SqlSessionTemplate sqlSession, String id);

	ArrayList<HashMap<String, Object>> editMyInformation(SqlSessionTemplate sqlSession, String id);

	int updateMyInformation(SqlSessionTemplate sqlSession, Member member);

	int updatePassword(SqlSessionTemplate sqlSession, Member loginUser);

	int deleteMember(SqlSessionTemplate sqlSession, String userId);

	int updateUserProfile(SqlSessionTemplate sqlSession, Member member);

	ArrayList<Club> userClubList(SqlSessionTemplate sqlSession, int userNo);

	List<Alarm> noticeUser(SqlSessionTemplate sqlSession, int userNo);

	ArrayList<HashMap<String, Object>> selectLikeList(SqlSessionTemplate sqlSession, int userNo);

	ArrayList<Reply> userReplyList(SqlSessionTemplate sqlSession, int userNo);

	ArrayList<Club> userCreateList(SqlSessionTemplate sqlSession, int userNo);
	
	//선우님
	
	ArrayList<Member> selectLatestMember(SqlSessionTemplate sqlSession);




}
