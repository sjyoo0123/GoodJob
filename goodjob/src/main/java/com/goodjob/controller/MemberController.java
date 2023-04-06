package com.goodjob.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.blacklist.model.BlackListDAO;
import com.goodjob.companymember.model.CompanyMemberDAO;
import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.member.model.MemberDAO;
import com.goodjob.member.model.MemberDTO;
import com.goodjob.module.Module;
import com.goodjob.normalmember.model.NormalMemberDAO;
import com.goodjob.normalmember.model.NormalMemberDTO;

@Controller
public class MemberController {
	@Autowired
	private NormalMemberDAO norDao;
	@Autowired
	private CompanyMemberDAO comDao;
	@Autowired
	private MemberDAO memDao;

	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String join() {
		return "/member/join";
	}

	@RequestMapping(value = "normalJoin.do", method = RequestMethod.POST)
	public ModelAndView normalJoin(NormalMemberDTO norDto, String birth_s) {
		System.out.println(norDto.toString());
		Module mo = new Module();
		norDto.setBirth(mo.datePasing(birth_s));
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO(0, norDto.getId(), norDto.getPwd(), norDto.getName(), norDto.getEmail(),
				norDto.getTel(), norDto.getAddr(), null, 0, "개인", "활성");
		int idx = memDao.memberJoin(memDto);
		if (idx <= 0) {
			if (idx == -1) {
				mav.addObject("msg", "alert('중복된 아이디가 있습니다');");
			} else {
				mav.addObject("msg", "alert('중복된 이메일이 있습니다');");
			}
		} else {
			norDto.setMember_idx(idx);
			int count = norDao.normalJoin(norDto);
			if (count >= 1) {
				mav.addObject("msg", "alert('이메일 인증해주세요');location.href=index.do;");
			} else {
				mav.addObject("msg", "alert('서버오류');");
			}
		}
		mav.setViewName("/member/join");
		return mav;
	}

	@RequestMapping(value = "comJoin.do", method = RequestMethod.POST)
	public ModelAndView comJoin(CompanyMemberDTO comDto, String birth_s) {
		Module mo = new Module();
		comDto.setCom_birth(mo.datePasing(birth_s));
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO(0, comDto.getId(), comDto.getPwd(), comDto.getName(), comDto.getEmail(),
				comDto.getTel(), comDto.getAddr(), null, 0, "기업", "활성");
		int idx = memDao.memberJoin(memDto);
		if (idx <= 0) {
			if (idx == -1) {
				mav.addObject("msg", "alert('중복된 아이디가 있습니다');");
			} else {
				mav.addObject("msg", "alert('중복된 이메일이 있습니다');");
			}
		} else {
			comDto.setMember_idx(idx);
			int count = comDao.comJoin(comDto);
			if (count >= 1) {
				mav.addObject("msg", "alert('이메일 인증해주세요');location.href=index.do;");
			} else {
				mav.addObject("msg", "alert('서버오류');");
			}
		}
		mav.setViewName("/member/join");
		return mav;
	}

	@RequestMapping(value = "updateMember.do", method = RequestMethod.GET)
	public ModelAndView updateMember(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt((String) session.getAttribute("sidx"));
		String category = (String) session.getAttribute("scategory");
		if (category.equals("개인")) {
			mav.addObject("dto", norDao.getNorMember(idx));
		} else if (category.equals("기업")) {
			mav.addObject("dto", comDao.getComMember(idx));
		}
		mav.setViewName("member/updateMember");
		return mav;
	}

	@RequestMapping(value = "normalUpdate.do", method = RequestMethod.POST)
	public ModelAndView normalUpdate(NormalMemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		memDao.memberUpdate(dto);
		return mav;
	}

	@RequestMapping(value = "comUpdate.do", method = RequestMethod.POST)
	public ModelAndView comUpdate(CompanyMemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		memDao.memberUpdate(dto);
		return mav;
	}

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public ModelAndView login(@CookieValue(value = "sid", defaultValue = "") String id,
			@CookieValue(value = "sca", defaultValue = "개인") String user_category) {
		ModelAndView mav = new ModelAndView();
		if (!id.equals("")) {
			mav.addObject("check", "checked");
		}
		mav.setViewName("/member/login");
		if (user_category.equals("기업")) {
			mav.addObject("url", "comLogin.do");
		} else {
			mav.addObject("url", "normalLogin.do");
		}
		return mav;
	}

	@RequestMapping(value = "normalLogin.do", method = RequestMethod.GET)
	public ModelAndView norMalLogin(String id, String pwd, HttpServletRequest req, boolean save,
			HttpServletResponse res) {
		MemberDTO dto = memDao.login(id, pwd, "개인");
		return loginSession(dto, req, save, res);
	}

	@RequestMapping(value = "comLogin.do", method = RequestMethod.GET)
	public ModelAndView comLogin(String id, String pwd, HttpServletRequest req, boolean save, HttpServletResponse res) {
		MemberDTO dto = memDao.login(id, pwd, "기업");
		return loginSession(dto, req, save, res);
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index.jsp";
	}

	public ModelAndView loginSession(MemberDTO dto, HttpServletRequest req, boolean save, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		if (dto == null) {
			mav.addObject("msg", "alert('등록된아이디혹은비밀번호가 없습니다')");
			mav.setViewName("/member/login");
		} else {
			Cookie ck = new Cookie("sid", dto.getId());
			Cookie ck2 = new Cookie("sca", dto.getUser_category());
			if (save) {
				ck.setMaxAge(3000);
				ck2.setMaxAge(3000);
			} else {
				ck.setMaxAge(0);
				ck2.setMaxAge(0);
			}
			res.addCookie(ck);
			res.addCookie(ck2);
			HttpSession session = req.getSession();
			session.setAttribute("sidx", dto.getIdx());
			session.setAttribute("sname", dto.getName());
			session.setAttribute("scategory", dto.getUser_category());
			session.setAttribute("status", dto.getStatus());
			mav.setViewName("index");
		}
		return mav;
	}

	public ModelAndView memberFindId(String email) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("");
		return mav;
	}

	@ResponseBody
	@RequestMapping("check.do")
	public int check(@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "email", defaultValue = "") String email) {
		if ((!id.equals("")) && (!id.equals(null))) {
			return memDao.idCheck(id);
		} else if ((!email.equals("")) && (!email.equals(null))) {
			return memDao.emailCheck(email);
		} else {
			return 0;
		}
	}

}
