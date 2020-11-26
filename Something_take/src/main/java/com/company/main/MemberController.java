package com.company.main;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.domain.MemberVO;
import com.company.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	private static final Logger logger =
			LoggerFactory.getLogger(MemberController.class);
	
	@Inject 
	private MemberService service;
	
	/////////////////////////////////////////////////////////
	
	/* 회원가입 처리 메소드 */
	@RequestMapping(value = "/signUp.post", method = RequestMethod.POST)
	public String signUpPOST(MemberVO vo) throws Exception {

		logger.info("-- 회원가입 버튼 작동 / vo : "+vo);
		service.insertMem(vo);
		logger.info("-- 회원가입 완료 ");
		
		return "redirect:../index.do";
	} // signUpPOST()
	
	/////////////////////////////////////////////////////////

	/* 로그인 동작 메소드 */
	@RequestMapping(value = "/signIn.post", method = RequestMethod.POST)
	public String signInPOST(MemberVO vo, HttpSession session) throws Exception{

		logger.info("-- 로그인 버튼 작동 ");
		MemberVO DBvo = service.loginMem(vo);
		logger.info("@@@ DBvo : " + DBvo);
		
		if(DBvo == null) { // 로그인 실패 시
			return "redirect:../Sign-in.me";
		}else if(DBvo != null) { // 로그인 성공 시
			session.setAttribute("email", DBvo.getEmail());
		}
		logger.info("-- 로그인 버튼 완료");
		return "redirect:../index.do";
	} // signInPOST()
	
	/////////////////////////////////////////////////////////

	/* 로그 아웃 메소드 */
	@RequestMapping(value = "/sign-out.post", method = RequestMethod.GET)
	public String logOut(HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("-- 로그아웃 메소드 실행");
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.');");
		out.println("location.href='../index.do'");
		out.println("</script>");
		out.flush();
		return null;
	} // logOut()
	
	/////////////////////////////////////////////////////////
	
	/* 비밀번호 수정 동작 메소드 */
	@RequestMapping(value = "/modify.post", method = RequestMethod.POST)
	public String modifyPOST(MemberVO vo, Model model,
							 HttpSession session,
							 HttpServletResponse response) throws Exception{
		
		logger.info("-- 회원정보 수정 버튼 작동");
		model.addAttribute("email", vo.getEmail());
		model.addAttribute("pwd", vo.getPwd());
		logger.info("@@@ model : " + model);
		service.updateMem(vo);
		session.invalidate();
		logger.info("-- 회원정보 수정 버튼 작동 완료");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('비밀번호가 수정되었습니다. 다시 로그인 해주세요.');");
		out.println("location.href='../Sign-in.me'");
		out.println("</script>");
		out.flush();
		return null;
	} // modifyPOST()
	
	/////////////////////////////////////////////////////////
	
	/* 회원탈퇴 동작 메소드 */
	@RequestMapping(value = "/dropOut.post", method = RequestMethod.POST)
	public String dropOutPOST(MemberVO vo,
							  HttpServletResponse response, 
							  HttpSession session, 
							  Model model) throws Exception{
		int check = 0;
		logger.info("-- 회원탈퇴 버튼 동작 ");
		logger.info("@@@ vo : " + vo);
		model.addAttribute("email", vo.getEmail());
		model.addAttribute("pwd", vo.getPwd());
		check = service.deleteMem(vo);
		
		if(check == 1) {
			logger.info("-- 회원탈퇴 버튼 동작 완료");
			session.invalidate();
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('탈퇴되었습니다. 이용해 주셔서 감사합니다.');");
			out.println("location.href='../index.do'");
			out.println("</script>");
			out.flush();
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 비밀번호를 확인해주세요.');");
			out.println("location.href='../Drop-out.me'");
			out.println("</script>");
			out.flush();
		}
		return null;
	} // dropOutPOST()
	
	/////////////////////////////////////////////////////////

	/* 이메일 가입 중복 확인 메서드 */
	@RequestMapping(value = "emailDupl", method = RequestMethod.GET)
	public String duplicate(@RequestParam("email") String email,
							HttpServletResponse response) throws Exception{
		
		int check = 0;
		logger.info("-- 이메일 중복 메서드 실행");
		check = service.duplicate(email);
		logger.info("@@ check : " + check);
		logger.info("-- 이메일 중복 메서드 실행 완료");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(check);
		return null;
	} // duplicate()
 	
	/////////////////////////////////////////////////////////

}