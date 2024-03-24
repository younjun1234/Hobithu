package com.kh.semi.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.alarm.DAO.AlarmDAO;
import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.PageInfo;

@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	SqlSessionTemplate sqlsession;
	
	@Autowired
	AlarmDAO aDAO;
	
	@Override
	public int getListCount(HashMap<String, String> map) {
		return aDAO.getListCount(sqlsession, map);
	}
	
	@Override
	public ArrayList<Alarm> selectAlarmList(PageInfo pi, HashMap<String, String> map){
		return aDAO.selectAlarmList(sqlsession,pi,map);
	}
	
	@Override
	public Alarm selectDetail(Alarm detail) {
		return aDAO.selectDetail(sqlsession,detail);
	}
	
	@Override
	public int updateAlarm(Alarm update) {
		return aDAO.updateAlarm(sqlsession, update);
	}
	
	@Override
	public int deleteAlarm(int NOTICE_NO) {
		return aDAO.deleteAlarm(sqlsession, NOTICE_NO);
	}
	
	@Override
	public int insertAlarm(Alarm insert) {
		return aDAO.insertAlarm(sqlsession, insert);
	}
	
	@Override
	public ArrayList<Alarm> selectLatestAlarm(){
		return aDAO.selectLatestAlarm(sqlsession);
	}
}
