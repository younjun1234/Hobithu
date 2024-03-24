package com.kh.semi.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.board.model.DAO.BoardDAO;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.board.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO bDAO;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Club> selectBoardList(Club club, PageInfo pi) {
		return bDAO.selectBoardList(sqlSession, club, pi);
	}

	@Override
	public ArrayList<Club> selectHomeList() {
		return bDAO.selectHomeList(sqlSession);
	}

	@Override
	public int getListCount(Club club) {
		return bDAO.getListCount(sqlSession, club);
	}

	@Override
	public int insertClub(Club club) {
		return bDAO.insertClub(sqlSession, club);
	}

	@Override
	public Club viewBoard(int clubNo) {
		return bDAO.viewBoard(sqlSession, clubNo);
	}

	@Override
	public int deleteClub(int clubNo) {
		return bDAO.deleteClub(sqlSession, clubNo);
	}

	@Override
	public int joinClub(HashMap<String, Object> map) {
		return bDAO.joinClub(sqlSession, map);
	}

	@Override
	public int updateClubSchedule() {
		return bDAO.updateClubSchedule(sqlSession);
	}

	@Override
	public int leaveClub(HashMap<String, Object> map) {
		return bDAO.leaveClub(sqlSession, map);
	}

	@Override
	public ArrayList<Club> selectLatestClub() {
		return bDAO.selectLatestClub(sqlSession);

	}

	@Override
	public ArrayList<Club> adminBoardList(Club c, PageInfo pi) {
		return bDAO.adminBoardList(sqlSession, c, pi);
	}

	@Override
	public ArrayList<Club> adminCategory(String categoryClass) {
		return bDAO.adminCategory(sqlSession, categoryClass);
	}
	
	
}
