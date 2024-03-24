package com.kh.semi.board.model.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semi.board.model.vo.Club;
import com.kh.semi.board.model.vo.PageInfo;

@Repository
public class BoardDAOImpl implements BoardDAO{

	public int getListCount(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.selectOne("boardMapper.getListCount", club);
	}

	public ArrayList<Club> selectBoardList(SqlSessionTemplate sqlSession, Club club, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", club, rowbounds);
	}

	@Override
	public ArrayList<Club> selectHomeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectHomeList");
	}

	@Override
	public int insertClub(SqlSessionTemplate sqlSession, Club club) {
		int categoryCode = sqlSession.selectOne("boardMapper.selectCategoryCode", club);
		club.setCategoryCode(categoryCode);
		return sqlSession.insert("boardMapper.insertClub", club) + sqlSession.insert("boardMapper.insertCreator", club);

	}

	@Override
	public Club viewBoard(SqlSessionTemplate sqlSession, int clubNo) {
		return sqlSession.selectOne("boardMapper.viewBoard", clubNo);
	}

	@Override
	public int deleteClub(SqlSessionTemplate sqlSession, int clubNo) {
		return sqlSession.update("boardMapper.deleteClub", clubNo);
	}

	@Override
	public int joinClub(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("boardMapper.joinClub", map);
	}

	@Override
	public int updateClubSchedule(SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.updateClubSchedule");
	}

	@Override
	public int leaveClub(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.delete("boardMapper.leaveClub", map);
	}
	
	// 선우님
	
	@Override
	public ArrayList<Club> selectLatestClub(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectLatestClub");
	}

	@Override
	public ArrayList<Club> adminBoardList(SqlSessionTemplate sqlSession, Club c, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.adminBoardList", c, rowbounds);
	}

	@Override
	public ArrayList<Club> adminCategory(SqlSessionTemplate sqlSession, String categoryClass) {
		return (ArrayList)sqlSession.selectList("boardMapper.adminCategory", categoryClass);
	}
	
	
}
