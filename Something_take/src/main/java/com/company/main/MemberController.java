package com.company.main;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.domain.AuthKeyVO;
import com.company.domain.BoardVO;
import com.company.domain.CartVO;
import com.company.domain.MemberVO;
import com.company.domain.ReplyVO;
import com.company.service.BoardService;
import com.company.service.CartService;
import com.company.service.MemberService;
import com.company.service.ReplyService;


@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Autowired
	private JavaMailSender mailSender; // 메일 전송을 위한 객체 DI

	/////////////////////////////////////////////////////////

	private static final Logger logger =
			LoggerFactory.getLogger(MemberController.class);
	
	/////////////////////////////////////////////////////////

	@Inject 
	private MemberService service;
	
	@Inject
	private CartService cservice; // 카트 관련 서비스
	
	@Inject
	private BoardService bservice; // 게시판 관련 서비스
	
	@Inject
	private ReplyService rservice; // 댓글 관련 서비스
	
	/////////////////////////////////////////////////////////
	
	/* 회원가입 처리 메소드 */
	@RequestMapping(value = "/signUp.post", method = RequestMethod.POST)
	public String signUpPOST(MemberVO vo) throws Exception {
		logger.info("-- 회원가입 버튼 작동 / vo : "+vo);
		service.insertMem(vo);
		cservice.createCart(vo);
		logger.info("-- 회원가입 완료 ");
		return "redirect:../index";
	} // signUpPOST()
	
	/////////////////////////////////////////////////////////

	/* 가입 시 이메일 전송 메소드 */
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String sendEmail(String email, HttpServletResponse response,
							HttpSession session) throws Exception {
		logger.info("-- 회원가입 인증 메일 발송");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// --------------------- 메일 발송 --------------------- //
		MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	    messageHelper.setFrom("gyrud6744@gmail.com"); // 보내는 사람 생략 시 작동 X
	    messageHelper.setTo(email); // 받는 사람
	    messageHelper.setSubject("Something_take(썸띵테이크) 회원 가입 인증메일입니다."); // 메일 제목 (생략 가능)
	    
	    
	    // --------------------- 인증 번호 --------------------- //
	    int data = 0;
	    AuthKeyVO avo = new AuthKeyVO();
	    data = avo.init();
	    session.setAttribute("data", data);
	    // --------------------- 인증 번호 --------------------- //


	    String content = "< 가입 인증 번호는 [" + data + "] 입니다. >";
	    messageHelper.setText(content); // 메일 내용
	    mailSender.send(message);
	    // --------------------- 메일 발송 --------------------- //
	    return null;
	} // sendEmail()
	
	/////////////////////////////////////////////////////////

	/* 인증번호 확인 */
	@RequestMapping(value = "authCheck", method = RequestMethod.GET)
	public String mainCheck(@RequestParam("quote") String quote,
							HttpServletResponse response,
							HttpSession session) throws Exception{
		int result = 0;
		String data = String.valueOf(session.getAttribute("data"));
		logger.info("-- 인증번호 일치 확인");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if((quote.equals(data))) {
			result = 1;
			out.println(result);
			return null;
		}else {
			result = 0;
		}
		out.println(result);
		return null;
	} // mainCheck()

	/////////////////////////////////////////////////////////

	/* 로그인 동작 메소드 */
	@RequestMapping(value = "/signIn.post", method = RequestMethod.POST)
	public String signInPOST(MemberVO vo, HttpSession session) throws Exception{
		logger.info("-- 로그인 버튼 작동 ");
		MemberVO DBvo = service.loginMem(vo);
//		logger.info("@@@ DBvo : " + DBvo);
		
		if(DBvo == null) { // 로그인 실패 시
			return "redirect:../sign-in.me";
		}else if(DBvo != null) { // 로그인 성공 시
			session.setAttribute("email", DBvo.getEmail());
		}
		logger.info("-- 로그인 버튼 완료");
		return "redirect:../index.do";
	} // signInPOST()
	
	/////////////////////////////////////////////////////////

	/* 로그 아웃 메소드 */
	@RequestMapping(value = "/sign-out.post", method = RequestMethod.GET)
	public String logOut(HttpServletResponse response,
						 HttpSession session, CartVO cvo) throws Exception {
		
		logger.info("-- 로그아웃 메소드 실행");
		String email = (String)session.getAttribute("email");
		cvo.setCart_email(email);
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
//		logger.info("@@@ model : " + model);
		service.updateMem(vo);
		session.invalidate();
		logger.info("-- 회원정보 수정 버튼 작동 완료");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('비밀번호가 수정되었습니다. 다시 로그인 해주세요.');");
		out.println("location.href='../sign-in.me'");
		out.println("</script>");
		out.flush();
		return null;
	} // modifyPOST()
	
	/////////////////////////////////////////////////////////
	
	/* 회원 탈퇴 동작 메소드 */
	@RequestMapping(value = "/dropOut.post", method = RequestMethod.POST)
	public String dropOutPOST(MemberVO vo,
							  HttpServletResponse response, 
							  HttpSession session, 
							  Model model, CartVO cvo, BoardVO bvo, ReplyVO rvo) throws Exception{
		int check = 0;
		logger.info("-- 회원탈퇴 버튼 동작 ");
		logger.info("@@@ vo : " + vo);
		model.addAttribute("email", vo.getEmail());
		model.addAttribute("pwd", vo.getPwd());
		cservice.deleteCart(vo);
		check = service.deleteMem(vo);
		
		if(check == 1) {
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
			out.println("location.href='../drop-out.me'");
			out.println("</script>");
			out.flush();
		}
		return null;
	} // dropOutPOST()
	
	/////////////////////////////////////////////////////////

	/* 비밀번호 찾기 이메일 전송 메소드 */
	@RequestMapping(value = "/findEmail", method = RequestMethod.GET)
	public String findpwEmail(String email, HttpServletResponse response) throws Exception {
		logger.info("-- 비밀번호 찾기 메일 발송");
		int result = service.duplicate(email);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			String pw = service.getFindPw(email);
			out.println(result);
			
			// --------------------- 메일 발송 --------------------- //
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("gyrud6744@gmail.com"); // 보내는 사람 생략 시 작동 X
			messageHelper.setTo(email); // 받는 사람
			messageHelper.setSubject("Something_take(썸띵테이크) 메일입니다."); // 메일 제목 (생략 가능)
			String content = "< 고객님의 비밀번호는 [ " + pw + " ] 입니다. >";
			messageHelper.setText(content); // 메일 내용
			mailSender.send(message);
			// --------------------- 메일 발송 --------------------- //
			
		}else{
			out.println(result);
		} // if
	    return null;
	} // findpwEmail()
	
	/////////////////////////////////////////////////////////
	
	/* 이메일 중복 확인 메서드 */
	@RequestMapping(value = "emailDupl", method = RequestMethod.GET)
	public String duplicate(@RequestParam("email") String email,
							HttpServletResponse response) throws Exception{
		int check = 0;
		logger.info("-- 이메일 중복 메서드 실행");
		check = service.duplicate(email);
//		logger.info("@@ check : " + check);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(check);
		return null;
	} // duplicate()
 	
	/////////////////////////////////////////////////////////

	/* 멤버십 결제 메서드 */
	@RequestMapping(value = "membership.post", method = RequestMethod.POST)
	public String membershipPay(@RequestParam("session") String session, 
								MemberVO vo, Model model,
								HttpServletResponse response) throws Exception{
		logger.info("-- 멤버십 결제 실행");
		vo.setEmail(session);
		model.addAttribute("email", vo.getEmail());
		model.addAttribute("membership_type", vo.getMembership_type());
		model.addAttribute("membership_pay", vo.getMembership_pay());
//		logger.info("@@ vo : " + vo);
		service.payment(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('결제가 완료되었습니다.');");
		out.println("</script>");
		return null;
	} // membershipPay()

	/////////////////////////////////////////////////////////

	/* 카트 메뉴 추가 */
	@RequestMapping(value = "updateCart", method = RequestMethod.GET)
	public String cart_AJAX(Model model, CartVO cvo, String cart_email,
							int product_id, String product_name, int product_price, 
							int product_amount) throws Exception{
		logger.info("-- 메뉴 추가 버튼 실행"); 
		cvo.setCart_email(cart_email); cvo.setProduct_amount(product_amount);
		cvo.setProduct_id(product_id); cvo.setProduct_name(product_name); cvo.setPrice(product_price);
		model.addAttribute("cart_email", cvo.getCart_email());
		model.addAttribute("product_id", cvo.getProduct_id());
		model.addAttribute("product_name", cvo.getProduct_name());
		model.addAttribute("product_price", cvo.getPrice());
		model.addAttribute("product_amount", cvo.getProduct_amount());
//		logger.info("-- vo : " + cvo);
		cservice.updateCart(cvo);
		return null;
	} // cart_AJAX()
	
	/////////////////////////////////////////////////////////

}