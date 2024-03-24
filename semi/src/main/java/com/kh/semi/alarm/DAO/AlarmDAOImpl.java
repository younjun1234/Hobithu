package com.kh.semi.alarm.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.PageInfo;

@Repository
public class AlarmDAOImpl implements AlarmDAO{

	public int getListCount(SqlSessionTemplate sqlsession, HashMap<String, String> map) {
		return sqlsession.selectOne("customerMapper.getListCount", map);
	}

	public ArrayList<Alarm> selectAlarmList(SqlSessionTemplate sqlsession, PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlsession.selectList("alarmMapper.selectAlarmList",map,rowBounds);
	}

	public Alarm selectDetail(SqlSessionTemplate sqlsession, Alarm detail) {
		return sqlsession.selectOne("alarmMapper.selectDetail", detail);
	}

	public int updateAlarm(SqlSessionTemplate sqlsession, Alarm update) {
		return sqlsession.update("alarmMapper.updateAlarm", update);
	}

	public int deleteAlarm(SqlSessionTemplate sqlsession, int NOTICE_NO) {
		return sqlsession.delete("alarmMapper.deleteAlarm", NOTICE_NO);
	}

	public int insertAlarm(SqlSessionTemplate sqlsession, Alarm insert) {
		return sqlsession.insert("alarmMapper.insertAlarm", insert);
	}

	public ArrayList<Alarm> selectLatestAlarm(SqlSessionTemplate sqlsession) {
		return (ArrayList)sqlsession.selectList("alarmMapper.selecthomeAlarm");
	}
}
