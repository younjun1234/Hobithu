package com.kh.semi.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semi.board.model.exception.BoardException;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.board.model.vo.PageInfo;
import com.kh.semi.board.service.BoardService;
import com.kh.semi.common.Pagination;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	MemberService mService;
	
	@Autowired
	BoardService bService;

	@RequestMapping("/selectCategory.bo")
	public String goToSelectCategory() {
		return "selectCategory";
	}

	@RequestMapping("/selectTitleContent.bo")
	public String goToSelectTitleContent(@RequestParam("category") String category, Model model) {
		model.addAttribute("category", category);
		return "selectTitleContent";
	}

	@RequestMapping("/selectLocation.bo")
	public String goToSelectLocation(@RequestParam("category") String category,
			@RequestParam("file") MultipartFile file, @ModelAttribute Club club, HttpServletRequest request,
			Model model) {
		if (!file.getOriginalFilename().equals("")) {
			club.setBackgroundImage(saveFile(file, request));
		}
		model.addAttribute("category", category);
		model.addAttribute("club", club);
		return "selectLocation";
	}

	@RequestMapping("/selectDateTime.bo")
	public String goToSelectDateTime(@RequestParam("category") String category, @ModelAttribute Club club,
			Model model) {
		model.addAttribute("category", category);
		model.addAttribute("club", club);
		return "selectDateTime";
	}

	@RequestMapping("/selectMeeting.bo")
	public String goToSelectMeeting(@RequestParam("category") String category, @ModelAttribute Club club, Model model, @RequestParam("clubScheduleOG") String changeDate) {
		System.out.println(changeDate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.ENGLISH);
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));

		Date date = null;
		try {
			date = sdf.parse(changeDate);
			club.setClubSchedule(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(club);
		model.addAttribute("category", category);
		model.addAttribute("club", club);
		return "selectMeeting";
	}

	@RequestMapping("/selectPeopleType.bo")
	public String goToSelectPeopleType(@RequestParam("category") String category,
			@RequestParam("clubScheduleOG") String changeDate, @ModelAttribute Club club, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));

		Date date = null;
		try {
			date = sdf.parse(changeDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		club.setClubSchedule(date);
		model.addAttribute("category", category);
		model.addAttribute("club", club);
		return "selectPeopleType";
	}

	@RequestMapping("/preview.bo")
	public String goToPreview(@RequestParam("category") String category, @RequestParam("low_range") String lowRange,
			@RequestParam("upp_range") String upperRange, @RequestParam("clubScheduleOG") String changeDate,
			@ModelAttribute Club club, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));

		Date date = null;
		try {
			date = sdf.parse(changeDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		club.setClubSchedule(date);

		String range = lowRange + "~" + upperRange;
		club.setAgeRange(range);

		model.addAttribute("category", category);
		model.addAttribute("club", club);
		return "preview";
	}

	public void deleteFile(String fileName, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "/uploadFiles";
		File f = new File(savePath + "/" + fileName);
		if (f.exists()) {
			f.delete();
		}

	}

	// 파일 저장소 파일 저장(copy)
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 1. 파일 저장소 위치 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		// 2. 저장된 file rename
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);

		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(time) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));

		// 3. rename된 파일을 저장소에 저장
		String renamePath = folder + "/" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return renameFileName;
	}

	@RequestMapping("/search.bo")
	public String searchView() {
		return "search";
	}

	@RequestMapping("/result.bo")
	public String resultView(@RequestParam(value="page", defaultValue="1") int page, @ModelAttribute Club club, Model model, 
							 @RequestParam("clubScheduleOG") String changeDate, @RequestParam("addressRegion") String addr1, 
							 @RequestParam("addressDo") String addr2, @RequestParam("addressSiGunGu") String addr3) {
		
		String addr = "";
		if (addr1 != null) {
			addr += addr1;
		}
		if (addr2 != null) {
			addr += addr2;
		}
		if (addr3 != null) {
			addr += addr3;
		}
		if (addr != "") {
			club.setAddr(addr);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));

		Date date = null;
		try {
			date = sdf.parse(changeDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		club.setClubSchedule(date);
		
		System.out.println(club);
		int listCount = bService.getListCount(club);

		int currentPage = page;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		ArrayList<Club> list = bService.selectBoardList(club, pi);
		ArrayList<ArrayList<Member>> mListList = new ArrayList<ArrayList<Member>>();
		for (Club c : list) {
			ArrayList<Member> mList = mService.selectClubMembers(c);
			mListList.add(mList);
		}
		if (list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("mList", mListList);
			return "result";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다");
		}
	}
	
	@RequestMapping("/insertClub.bo")
	public String insertClub(@ModelAttribute Club club, @RequestParam("clubScheduleOG") String changeDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));

		Date date = null;
		try {
			date = sdf.parse(changeDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		club.setClubSchedule(date);

		int result = bService.insertClub(club);
		if (result > 1) {
			return "redirect:/";
		} else {
			throw new BoardException("모임 등록에 실패하였습니다");
		}
	}
	
	@RequestMapping("/viewBoard.bo")
	public String viewBoard(@RequestParam("club_no") int clubNo, Model model) {
		Club club = bService.viewBoard(clubNo);
		ArrayList<Member> list = mService.selectClubMembers(club);
		Member clubOwner = null;
		for (Member m : list) {
			if (m.getUserNo() == club.getCreator()) {
				clubOwner = m;
				break;
			}
		}
		if (club != null) {
			model.addAttribute("clubOwner", clubOwner);
			model.addAttribute("club", club);
			model.addAttribute("list", list);
			return "boardView";
		} else {
			throw new BoardException("모임 상세 조회에 실패하였습니다");
		}
	}
	
	@RequestMapping("/editClub.bo")
	public String editBoard(@RequestParam("clubNo") int clubNo, Model model) {
		Club club = bService.viewBoard(clubNo);
		ArrayList<Member> list = mService.selectClubMembers(club);
		Member clubOwner = null;
		for (Member m : list) {
			if (m.getUserNo() == club.getCreator()) {
				clubOwner = m;
				break;
			}
		}
		if (club != null) {
			model.addAttribute("clubOwner", clubOwner);
			model.addAttribute("club", club);
			model.addAttribute("list", list);
			return "editBoard";
		} else {
			throw new BoardException("모임 수정에 실패하였습니다");

		}
	}
	
	@RequestMapping("/deleteClub.bo")
	public String deleteClub(@RequestParam("clubNo") int clubNo) {
		int result = bService.deleteClub(clubNo);
		if(result > 0) {
			return "redirect:/";
		} else {
			throw new BoardException("모임 삭제에 실패하였습니다");
		}
	}
	
	@RequestMapping("/joinClub.bo")
	public String joinClub(@RequestParam("clubNo") int clubNo, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("clubNo", clubNo);
		map.put("loginUser", loginUser);
		int result = bService.joinClub(map);
		if (result > 0) {
			return "redirect:viewBoard.bo?club_no=" + clubNo;
		} else {
			throw new BoardException("모임 참가에 실패하였습니다");
		}
	}
	
	@RequestMapping("/leaveClub.bo")
	public String leaveClub(@RequestParam("clubNo") int clubNo, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("clubNo", clubNo);
		map.put("loginUser", loginUser);
		int result = bService.leaveClub(map);
		if (result > 0) {
			return "redirect:viewBoard.bo?club_no=" + clubNo;
		} else {
			throw new BoardException("모임 탈퇴에 실패하였습니다");
		}
	}
	
	//
	//
	//	선우님
	//
	//
	
	@RequestMapping("adminBoard.ad")
	public String viewBoard(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "categoryNames", required = false, defaultValue = "1") String[] categoryNames, Model model){
		Club c = new Club();
		int listCount = 0;
		int currentPage = page;
		ArrayList<Club> blist = new ArrayList<>();
		for (String categoryName : categoryNames) {
			c.setCategoryName(categoryName);
			listCount += bService.getListCount(c);
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		for (String categoryName : categoryNames) {
			c.setCategoryName(categoryName);
			for(Club c2 : bService.adminBoardList(c, pi)) {
				blist.add(c2);
			}
		}
		
		model.addAttribute("categoryNames", categoryNames);
		model.addAttribute("pi", pi);
		model.addAttribute("list", blist);
		System.out.println(Arrays.toString(categoryNames));
		System.out.println(blist);
		return "adminBoard";
	}
	
	@RequestMapping("adminCategory.ad")
	public String selectCategory(@RequestParam("CLUB_CATEGORY_KIND") String categoryClass, Model model) {
		
		ArrayList<Club> categorylist =  bService.adminCategory(categoryClass);
		
		
//		ArrayList<String> categorynamelist = new ArrayList<String>();
		
//		for(int i =0; i< categorylist.size(); i++) {
//			categorynamelist.add(i, categorylist.get(i).getCATEGORY_NAME());
//		}
		
		model.addAttribute("CLUB_CATEGORY_KIND", categoryClass);
		model.addAttribute("categorylist", categorylist);
		
			
//		model.addAttribute("categorynamelist", categorynamelist);
		return "adminBoard";
		
	}
	
	@RequestMapping("adminDetail.ad")
	public String boardDeatil(@RequestParam("CLUB_NO") int CLUB_NO, @RequestParam("page") int page, Model model) {
		
		Club b = bService.viewBoard(CLUB_NO);
		
		model.addAttribute("b", b);
		model.addAttribute("page", page);
		return "adminDetail";
	}
	
	@RequestMapping("adminUpdateBoard.ad")
	public String adminUpdateBoard(@RequestParam("page") int page, Club b, @RequestParam("file") MultipartFile file, HttpServletRequest request, Model model) {
		
		
			
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		map.put("clubNo", (Integer)b.getClubNo());
		map.put("clubName", b.getClubName());
		map.put("content", b.getContent());
		
		  if(!file.getOriginalFilename().equals("")) {
			  map.put("filename", file.getOriginalFilename());
			  
			  deleteFile(b.getBackgroundImage(), request);
			  String renameNameFile = saveFile(file, request); 
		  }else {
			  map.put("filename", b.getBackgroundImage());
		  }
			  
		  
		  model.addAttribute("page", page);
		  model.addAttribute("clubNo", b.getClubNo());
		  return"redirect:boardDeatil.bo";
		  
	}
	
}






























