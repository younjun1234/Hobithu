package com.kh.semi.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.PageInfo;

public interface AlarmService {
	
	int getListCount(HashMap<String, String> map);

	ArrayList<Alarm> selectAlarmList(PageInfo pi, HashMap<String, String> map);

	Alarm selectDetail(Alarm detail);

	int updateAlarm(Alarm update);

	int deleteAlarm(int NOTICE_NO);

	int insertAlarm(Alarm insert);

	ArrayList<Alarm> selectLatestAlarm();
	
}
