package com.kh.semi;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.alarm.service.AlarmServiceImpl;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.board.service.BoardService;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	MemberService mService;
	
	@Autowired
	BoardService bService;
	
	@Autowired
	AlarmServiceImpl aService;
	
	@RequestMapping("/admin.ad")
	public String adminView(Model model) {
		
		ArrayList<Member> mlist = mService.selectLatestMember();
		ArrayList<Club> blist =  bService.selectLatestClub();
		ArrayList<Alarm> alist =  aService.selectLatestAlarm();
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("blist", blist);
		model.addAttribute("alist", alist);
		
		return "adminHome"; 
	}
}
