package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("memberservice")
	MemberService service;
	
	//회원가입 뷰 컨트롤러
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinform() {
		return "member/join";
	}
	
	//회원가입 - 닉네임 체크 컨트롤러
	@RequestMapping(value="/nicknameCheck", method=RequestMethod.POST)
	public @ResponseBody int nicknameCheck(@RequestParam(value="id") String id) {
		return service.nicknameCheck(id);
	}
	
	//회원가입 기능 구현 컨트롤러
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView joinmember(MemberDTO dto) {
		ModelAndView mv = new ModelAndView();
		int result = service.joinmember(dto);
		mv.addObject("userdto", dto);
		mv.addObject("result", result);
		mv.setViewName("member/joinresult");
		return mv;
	}
	
	//로그인 뷰 컨트롤러
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginform() {
		return "member/login";
	}
	
	//로그인 기능 구현 컨트롤러
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView loginmember(String id, String pw, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		MemberDTO userdto = service.loginmember(id, pw);
		if(userdto == null) { //로그인 실패인 경우
			mv.addObject("msg", "일치하는 정보가 없습니다");
			mv.setViewName("member/login");
		}else { //로그인 성공인 경우
			HttpSession session = request.getSession();
			session.setAttribute("session_id", userdto.getId());
			mv.setViewName("main");
		}
		return mv;
	}
	
	//로그아웃 기능 구현 컨트롤러
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		return "main";
	}
	
	//마이페이지 DB연결
	@GetMapping("modifymypage")
	@ResponseBody
	public MemberDTO mypage(String id) {
		MemberDTO userdto = service.memberView(id);
		return userdto;
	}
	
	//마이페이지 회원정보 수정 - 비밀번호 확인
	@RequestMapping(value="/pwck", method=RequestMethod.POST)
	public @ResponseBody int pwck(@RequestParam(value="pw2") String pw) {
		int result = service.pwck(pw);
		System.out.println(pw);
		System.out.println(result);
		return result;
	}
	
	//마이페이지 회원정보 수정
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ModelAndView updatemember(@RequestParam(value="userId") String id,
			@RequestParam(value="pw") String pw,
			@RequestParam(value="newpw") String newpw,
			@RequestParam(value="newpwck") String newpwck,
			@RequestParam(value="phone") String phone) {

		int result = service.updatemember(id,pw,newpw,newpwck,phone);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("mypage/mypage");
		return mv;
	}
	
}
