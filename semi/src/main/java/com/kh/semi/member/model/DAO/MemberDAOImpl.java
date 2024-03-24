package com.kh.semi.member.model.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.common.Reply;
import com.kh.semi.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Override
	public ArrayList<Member> selectClubMembers(SqlSessionTemplate sqlSession, Club club) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectClubMembers", club);
	}
	
	//
	//
	//	성운님
	//
	//
	
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("memberMapper.insertMember", m);
	}

	public int checkId(SqlSessionTemplate session, String id) {
		return session.selectOne("memberMapper.checkId", id);
	}

	public int checkNick(SqlSessionTemplate session, String nick) {
		return session.selectOne("memberMapper.checkNick", nick);
	}

	public Member login(SqlSessionTemplate session, Member m) {
		return session.selectOne("memberMapper.login", m);
	}

	public ArrayList<Member> searchId(SqlSessionTemplate session, Member m) {
		return (ArrayList)session.selectList("memberMapper.searchId", m);
	}

	public int checkPWD(SqlSessionTemplate session, Member m) {
		return session.selectOne("memberMapper.checkPWD", m);
	}
	
	public int updatePWD(SqlSessionTemplate session, Member m) {
		return session.update("memberMapper.updatePWD", m);
	}
	
	//
	//
	//	아림님
	//
	//
	

	@Override
	public ArrayList<HashMap<String, Object>> selectMylist(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMylist", id);
	}

	@Override
	public ArrayList<HashMap<String, Object>> editMyInformation(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("memberMapper.editMyInformation", id);
	}

	@Override
	public int updateMyInformation(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMyInformation", member);
	}

	@Override
	public int updatePassword(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.updatePassword", loginUser);
	}

	
	@Override
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember", userId);
	}


	@Override
	public int updateUserProfile(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateUserProfile", member);
		
	}

	@Override
	public ArrayList<Club> userClubList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.userClubList", userNo);
	}

	@Override
	public List<Alarm> noticeUser(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectList("memberMapper.noticeUser", userNo);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectLikeList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectLikeList", userNo);
	}

	@Override
	public ArrayList<Reply> userReplyList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.userReplyList", userNo);
	}

	@Override
	public ArrayList<Club> userCreateList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.userCreateList", userNo);
	}
	
	//
	// 선우님
	//
	
	@Override
	public ArrayList<Member> selectLatestMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectLatestMember");
	}


	
	
}
