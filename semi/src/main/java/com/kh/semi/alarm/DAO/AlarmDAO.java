package com.kh.semi.alarm.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.PageInfo;

public interface AlarmDAO {

	int getListCount(SqlSessionTemplate sqlsession, HashMap<String, String> map);

	ArrayList<Alarm> selectAlarmList(SqlSessionTemplate sqlsession, PageInfo pi, HashMap<String, String> map);

	Alarm selectDetail(SqlSessionTemplate sqlsession, Alarm detail);

	int updateAlarm(SqlSessionTemplate sqlsession, Alarm update);

	int deleteAlarm(SqlSessionTemplate sqlsession, int nOTICE_NO);

	int insertAlarm(SqlSessionTemplate sqlsession, Alarm insert);

	ArrayList<Alarm> selectLatestAlarm(SqlSessionTemplate sqlsession);

}
