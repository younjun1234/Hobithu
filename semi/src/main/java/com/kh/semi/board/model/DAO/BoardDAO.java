package com.kh.semi.board.model.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.semi.board.model.vo.Club;
import com.kh.semi.board.model.vo.PageInfo;

public interface BoardDAO {

	int getListCount(SqlSessionTemplate sqlSession, Club club);

	ArrayList<Club> selectBoardList(SqlSessionTemplate sqlSession, Club club, PageInfo pi);

	ArrayList<Club> selectHomeList(SqlSessionTemplate sqlSession);

	int insertClub(SqlSessionTemplate sqlSession, Club club);

	Club viewBoard(SqlSessionTemplate sqlSession, int clubNo);

	int deleteClub(SqlSessionTemplate sqlSession, int clubNo);

	int joinClub(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	int updateClubSchedule(SqlSessionTemplate sqlSession);

	int leaveClub(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	ArrayList<Club> selectLatestClub(SqlSessionTemplate sqlSession);

	ArrayList<Club> adminBoardList(SqlSessionTemplate sqlSession, Club c, PageInfo pi);

	ArrayList<Club> adminCategory(SqlSessionTemplate sqlSession, String categoryClass);

}
