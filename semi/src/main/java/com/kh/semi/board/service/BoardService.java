package com.kh.semi.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.board.model.vo.Club;
import com.kh.semi.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(Club club);

	ArrayList<Club> selectBoardList(Club club, PageInfo pi);

	ArrayList<Club> selectHomeList();

	int insertClub(Club club);

	Club viewBoard(int clubNo);

	int deleteClub(int clubNo);

	int joinClub(HashMap<String, Object> map);

	int updateClubSchedule();

	int leaveClub(HashMap<String, Object> map);

	ArrayList<Club> selectLatestClub();

	ArrayList<Club> adminBoardList(Club c, PageInfo pi);

	ArrayList<Club> adminCategory(String categoryClass);

	
}
