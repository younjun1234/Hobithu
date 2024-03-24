package com.kh.semi;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.board.model.exception.BoardException;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.board.service.BoardService;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

@Controller
public class HomeController {
	
	@Autowired
	BoardService bService;
	
	@Autowired
	MemberService mService;
	
	
	@RequestMapping("/")
	public String homeController(Model model) {
		System.out.println("Welcome HOME");
		
		int result = bService.updateClubSchedule();
		System.out.println(result + "개의 행이 수정 되었습니다");
		
		ArrayList<Club> list = bService.selectHomeList();
		ArrayList<ArrayList<Member>> mListList = new ArrayList<ArrayList<Member>>();
		for (Club club : list) {
			ArrayList<Member> mList = mService.selectClubMembers(club);
			mListList.add(mList);
		}
		if (list != null) {
			model.addAttribute("mList", mListList);
			model.addAttribute("list", list);
			return "home";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다");
		}
	}
	
}
