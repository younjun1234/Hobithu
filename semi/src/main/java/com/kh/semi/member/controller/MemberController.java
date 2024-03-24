package com.kh.semi.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semi.alarm.model.vo.Alarm;
import com.kh.semi.board.model.vo.Club;
import com.kh.semi.common.Reply;
import com.kh.semi.member.model.exception.MemberException;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@RequestMapping("/signUp.me")
	public String signUp() {
		return "agreement";
	}

	@RequestMapping("/userInfo.me")
	public String userInfo() {

		return "userInfo";
	}

	@RequestMapping(value = "mailCheck.me", method = RequestMethod.GET, produces = "aplication/json; charset=UTF-8")
	@ResponseBody
	public String sendMail(@RequestParam("email") String to) throws Exception {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111; // 난수 생성
		String subject = "인증코드";
		String content = "인증코드" + checkNum + "입니다";
		String from = "park718513@naver.com";
		System.out.println(to);
		try {

			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);

			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);

			mailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return checkNum + "";
	}

	@RequestMapping("findId.me")
	public String findId() {
		return "findId";
	}

	@RequestMapping("findPwd.me")
	public String findPwd() {
		return "findPwd";
	}

	@RequestMapping("/goToSignIn.me")
	public String goToSignIn() {
		return "signIn";
	}

	@RequestMapping("/signIn.me")
	public String signIn(@ModelAttribute Member member, HttpSession session) {
		Member loginUser = mService.login(member);
		System.out.println(loginUser);

		if (loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		} else {
			throw new MemberException("로그인 실패하였습니다.");
		}

	}

	@RequestMapping("/logout.me")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 비밀 번호 페이지 넘어가기
	@RequestMapping("newPwd.me")
	public String newPwd(@ModelAttribute Member m, Model model) {
		// 유효한 회원 찾기
		int check = mService.checkPWD(m);

		if (check > 0) {
			// 회원이 있는경우
			model.addAttribute("m", m);
			return "newPwd";
		} else {
			// 없는경우
			throw new MemberException("등록된 아이디가 없습니다.");
		}
	}

	// 업데이트
	@RequestMapping("updatePWD.me")
	public void updatePwd(@ModelAttribute Member m, PrintWriter out) {
		// 비밀번호 암호화
		System.out.println(m);
		String encPwd = bcrypt.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		int cnt = mService.updatePWD(m);

		String result = cnt >= 0 ? "yes" : "no";
		out.print(result);
	}
	
	@RequestMapping("selectHobby.me")
	public String selectHobby(@ModelAttribute Member m, Model model) {
		model.addAttribute("m", m);
		return "hobbySelect";
	}
	
	
	@RequestMapping("checkId.me")
	public void checkId(@RequestParam("checkId") String id, PrintWriter out){
		int cnt = mService.checkId(id);
		String result = cnt == 0 ? "yes" : "no";
		out.print(result);
	}
	
	@RequestMapping("checkNick.me")
	public void checkNickName(@RequestParam("nickName") String nick, PrintWriter out) {
		int cnt = mService.checkNick(nick);
		String result = cnt == 0 ? "yes" : "no";
		out.print(result);
	}

	@RequestMapping("insert.me")
	public String fin(@ModelAttribute Member m, @RequestParam("select") String[] hobby) {
		m.setHobby(hobby[0]);
		String encPwd = bcrypt.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		int result = mService.insertMember(m);
		if(result > 0) {
			   return "redirect:/";
		}else {
			   throw new MemberException("회원가입을 실패하였습니다.");
		}
	}
	
	@RequestMapping("login.me")
	public String login(Member m, Model model) {
		Member loginUser = mService.login(m);
		System.out.println(loginUser);
		   
		if(bcrypt.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:/";
		} else {
			throw new MemberException("로그인을 실패하였습니다.");
		}
	}
	
	@RequestMapping(value="searchId.me", produces = "aplication/json; charset=UTF-8")
	@ResponseBody
	public String searchId(@ModelAttribute Member m) {
		ArrayList<Member> list = mService.searchId(m);
		
		JSONArray jArr = new JSONArray();
		for(Member member : list) {
			JSONObject json = new JSONObject();
			json.put("userId", member.getUserId());
			
			jArr.put(json);
		}
		return jArr.toString();
	}
	
	//
	//
	//
	// 아림 님 페이지
	//
	//
	
	@RequestMapping("/myPage.me")
	public String myInfo(HttpSession session, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getUserId();
		ArrayList<HashMap<String, Object>> list = mService.selectMylist(id);
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		// 공지사항 불러오기
		List<Alarm> alarmList = mService.noticeUser(userNo);
		// 내가 참여한 모임 불러오기
		ArrayList<Club> clubList = mService.userClubList(userNo);
		// 내가 만든 모임 불러오기
		// ArrayList<Club> createList = mService.userCreateList(userNo);
		// 좋아요한 멤버 불러오기
		ArrayList<HashMap<String, Object>> likeList = mService.selectLikeList(userNo);
		// 좋아요한 댓글 불러오기
		ArrayList<Reply> replyList = mService.userReplyList(userNo);
		
//		System.out.println(list);
		
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("clubList", clubList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("replyList", replyList);
		model.addAttribute("list", list);
		
				
		return "myPage";
	}
	
	// 회원 탈퇴
    @RequestMapping("/deleteMember.me")
    public String deleteMember(HttpSession session) {
        Member member = (Member)session.getAttribute("loginUser");
        String userId = member.getUserId();

        int result = mService.deleteMember(userId);
        if(result > 0) {
        	session.invalidate();
            return "redirect:/";
        } else {
            throw new MemberException("회원 탈퇴를 실패했습니다.");
        }
    } 
    
	// 개인정보 불러오기
	@RequestMapping("/editMyInformation.me")
	public String editMyInformation(HttpSession session, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<HashMap<String, Object>> list = mService.editMyInformation(id);
//		System.out.println(list);
		model.addAttribute("list", list);
		
		
		return "editMyInformation";
	}
	
	// 개인정보 업데이트
	@RequestMapping("/updateMyInformation.me")
	public String updateMyInformation(@ModelAttribute Member member, @RequestParam("file") ArrayList<MultipartFile> files, HttpSession session, Model model) {
		int result = mService.updateMyInformation(member);
		
		if(result > 0) {
			model.addAttribute("member", member);
			session.invalidate();
			return "redirect:/";
		}else {
			throw new MemberException("정보 수정에 실패했습니다.");
		}
	}
	
	// 비밀번호 변경
	@RequestMapping("/editPwd.me")
	public String editPwd(@ModelAttribute Member member, HttpSession session) {
		Member loginUser = ((Member) session.getAttribute("loginUser"));
		session.setAttribute("loginUser", loginUser);
		return "editPwd";
	}
	
	// 비밀번호 업데이트
	@RequestMapping("/updatePassword.me")
	public String updatePassword(@RequestParam("currnetPwd") String currnetPwd, @RequestParam("newPwd") String newPwd, 
								 HttpSession session, Model model) {
		Member loginUser = ((Member) session.getAttribute("loginUser"));
		System.out.println(loginUser);
			System.out.println("비밀 번호 변경 전");
			String encPwd = bcrypt.encode(loginUser.getUserPwd());
			loginUser.setUserPwd(encPwd);
			
			int result = mService.updatePassword(loginUser);
			System.out.println("비밀 번호 변경 후");
			System.out.println(loginUser);
			System.out.println(result);
			if(result > 0) {
				model.addAttribute("loginUser", loginUser);
				session.invalidate();
				return "redirect:/";
			}else {
				throw new MemberException("비밀번호 수정에 실패했습니다.");
			}
			
	}

	
	// 첨부파일..안됨
		@RequestMapping("insertProfile.me")
		public String insertProfile(@RequestParam("editprofile") MultipartFile file,Member update,
									HttpServletRequest request, HttpSession session, Model model) {
			
			int resultList = 0;
			Member member = (Member)session.getAttribute("loginUser");
			
			member.setUserName(update.getUserName());
			member.setNickName(update.getNickName());
			member.setEmail(update.getEmail());
			System.out.println(member.getProfile());
			System.out.println(file);
			
			if(!file.getOriginalFilename().equals("")) {
				saveFile(file, request);
			    member.setProfile(file.getOriginalFilename());
			    resultList = mService.updateUserProfile(member);
			    
			}else {
				resultList = mService.updateUserProfile(member);
			}
		
		    model.addAttribute("list", resultList);
		    session.setAttribute("loginUser", member);
		    
		    return "editMyInformation";
		}
		
		
		public void saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles";
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			String originFileName = file.getOriginalFilename();

			String renamePath = folder + "\\" + originFileName;
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

		}

}
