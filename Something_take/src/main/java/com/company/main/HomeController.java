package com.company.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.domain.BoardVO;
import com.company.domain.MemberVO;
import com.company.domain.MessageVO;
import com.company.domain.ReplyVO;
import com.company.service.BoardService;
import com.company.service.MemberService;
import com.company.service.MessageService;
import com.company.service.ReplyService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject 
	private MemberService service; // 회원 관련 서비스 
	
	@Inject
	private BoardService bservice; // 게시판 관련 서비스
	
	@Inject
	private MessageService mservice; // 상담 관련 서비스
	
	@Inject
	private ReplyService reservice; // 댓글 관련 서비스
	
	/////////////////////////////////////////////////////////
	
	/* 메인 화면 페이지 */
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		
		logger.info("-- 썸띵테이크에 오신걸 환영합니다.");
		
		// tiles.xml의  <definition name="main" extends="base">을 리턴시킨다
		return "main.tiles";
	}

	/////////////////////////////////////////////////////////

	/* About 화면 페이지 */
	@RequestMapping(value = "About.do", method = RequestMethod.GET)
	public String about() {
		
		logger.info("-- About 페이지로 이동");
		
		return "/contact/About.tiles";
	} // aboutUs()
	
	/////////////////////////////////////////////////////////

	/* 회원가입 페이지로 이동하는 메소드 */
	@RequestMapping(value = "Sign-up.me", method = RequestMethod.GET)
	public String signUp() {
		
		logger.info("-- 회원가입 페이지로 이동");
		
		return "member/sign_up.tiles";
	} // Sign_Up()
	
	/////////////////////////////////////////////////////////
	
	/* 가입 시 회원 약관 페이지 새 창 띄우는 메소드 */
	@RequestMapping(value = "Agree.me", method = RequestMethod.GET)
	public String yackwan() {
		
		logger.info("-- 회원 약관 동의 페이지로 이동");
		
		return "member/terms_of_mem";
	} // yackwan()
		
	/////////////////////////////////////////////////////////

	/* 로그인 페이지로 이동하는 메소드 */
	@RequestMapping(value = "Sign-in.me", method = RequestMethod.GET)
	public String signIn() {
		
		logger.info("-- 로그인 페이지로 이동");
		
		return "member/sign_in.tiles";
	} // signIn()

	/////////////////////////////////////////////////////////
	
	/* 비밀번호 찾기 페이지로 이동하는 메소드 */
	@RequestMapping(value = "findPw.me", method = RequestMethod.GET)
	public String findPw() {
		
		logger.info("-- 비밀번호 찾기 페이지로 이동");
		
		return "member/mem_findpw.tiles";
	} // findPw()
	
	/////////////////////////////////////////////////////////

	/* 게시판 페이지로 이동 */
	@RequestMapping(value = "Board.bd", method = RequestMethod.GET)
	public String getBoard(HttpServletRequest request,
						   HttpSession session) throws Exception {
		
		logger.info("-- 게시판 페이지로 이동");

		List<BoardVO> boardList = bservice.getBoard();
		session.setAttribute("boardList", boardList);
		
		return "board/board.tiles";
	} // getBoard()
	
	/* 글쓰기 페이지로 이동 */
	@RequestMapping(value = "Write.bd", method = RequestMethod.GET)
	public String write(HttpSession session) {

		logger.info("-- 게시판 글쓰기 페이지로 이동");
		
		return "board/write.tiles";
	} // write()
	
	/* 글 내용 보기 페이지로 이동  */
	@RequestMapping(value = "Content.bd", method = RequestMethod.GET)
	public String getContent(@RequestParam("bno") int bno, 
							Model model) throws Exception{
		
		logger.info("-- 게시판 글 내용 보기 페이지로 이동");
		BoardVO bvo = bservice.read(bno);
		bservice.readCNT(bno);
		List<ReplyVO> repleList = reservice.getReply(bno);
		logger.info("@@@ bvo : " + bvo);
		model.addAttribute("readList", bvo);
		model.addAttribute("replyList", repleList);
		return "board/content.tiles";
	} // getContent()
	
	/* 글 수정 페이지로 이동 */
	@RequestMapping(value = "Modify.bd", method = RequestMethod.GET)
	public String modify(@RequestParam("bno") int bno, Model model) throws Exception{
		
		logger.info("-- 게시판 글 수정 페이지로 이동");
		BoardVO bvo = bservice.read(bno);
		logger.info("@@@ bvo : " + bvo);
		model.addAttribute("readList", bvo);
		
		return "board/modify.tiles";
	} // modify()
	
	/////////////////////////////////////////////////////////

	/* 갤러리 게시판 페이지로 이동 */
	@RequestMapping(value = "Interior.bd", method = RequestMethod.GET)
	public String gallaryBoard() {
		
		logger.info("-- 인테리어 게시판 페이지로 이동");
		
		return "board/gallary/interior.tiles";
	} // gallaryBoard()

	/////////////////////////////////////////////////////////

	/* 회원정보 페이지로 이동하는 메소드 */
	@RequestMapping(value = "/Profile.me", method = RequestMethod.GET)
	public String profile(HttpServletRequest request, HttpSession session) throws Exception {
		
		logger.info("-- 회원정보 페이지로 이동");

		session = request.getSession();
		String email = (String)session.getAttribute("email");
		MemberVO name = service.getMem(email);
//		logger.info("-- @@@ email : " + email);
		session.setAttribute("MemberVO", name);
		
		return "member/mem_modify.tiles";
	} // profile()

	/////////////////////////////////////////////////////////
	
	/* 회원 탈퇴 페이지로 이동하는 메소드 */
	@RequestMapping(value = "/Drop-out.me", method = RequestMethod.GET)
	public String dropOut() {
		
		logger.info("-- 회원탈퇴 페이지로 이동");

		return "member/mem_delete.tiles";
	} // dropOut()

	/////////////////////////////////////////////////////////

	/* 메뉴 페이지로 이동하는 메소드 */
	@RequestMapping(value = "Menu.pm", method = RequestMethod.GET)
	public String menu(HttpSession session) throws Exception{
		
		logger.info("-- 메뉴 페이지로 이동");
		
		return "payment/Menu.tiles";
	} // menu()
	
	/////////////////////////////////////////////////////////

	/* 결제 페이지로 이동하는 메소드 */
	@RequestMapping(value = "MemberShip.pm", method = RequestMethod.GET)
	public String payment() throws Exception{
		
		logger.info("-- 결제 페이지로 이동");
		
		return "payment/payment.tiles";
	} // payment()
	
	/////////////////////////////////////////////////////////

	/* 결제 내역 페이지로 이동하는 메소드 */
	@RequestMapping(value = "membership.me", method = RequestMethod.GET)
	public String pay_list(HttpServletRequest request, HttpSession session) throws Exception{
		
		logger.info("-- 결제 내역 페이지로 이동");
		
		session = request.getSession();
		String email = (String)session.getAttribute("email");
		logger.info("-- @@@ email : " + email);
		MemberVO membership = service.getMembership(email);
		session.setAttribute("membership", membership);
		
		return "member/mem_membership.tiles";
	} // pay_list()

	/////////////////////////////////////////////////////////

	/* 관리자 메뉴 - 회원 관리 페이지 */
	@RequestMapping(value = "mem_manage.mng", method = RequestMethod.GET)
	public String mng_Members(Model model) throws Exception{
		
		logger.info("-- 회원 관리 페이지로 이동");
		List<MemberVO> memberList = service.getMembers();
		model.addAttribute("memberList", memberList);
		
		return "admin/mem_management.tiles";
	} // manage_Membership()
	
	/////////////////////////////////////////////////////////
	
	/* 관리자 메뉴 - 매출 관리 페이지 */
	@RequestMapping(value = "pay_manage.mng", method = RequestMethod.GET)
	public String mng_Payments(Model model) throws Exception{

		logger.info("-- 매출 관리 페이지로 이동");
//		List<MessageVO> msgList = mservice.getMSGs();
//		model.addAttribute("msgList", msgList);
		return "admin/pay_management.tiles";
	} // mng_Messages()
	
	/////////////////////////////////////////////////////////
	
	/* 관리자 메뉴 - 매출 관리 페이지 */
	@RequestMapping(value = "ord_manage.mng", method = RequestMethod.GET)
	public String mng_Ordered(Model model) throws Exception{
		
		logger.info("-- 주문 관리 페이지로 이동");
//		List<MessageVO> msgList = mservice.getMSGs();
//		model.addAttribute("msgList", msgList);
		return "admin/order_management.tiles";
	} // mng_Messages()
	
	/////////////////////////////////////////////////////////

	/* 관리자 메뉴 - 문의 관리 페이지 */
	@RequestMapping(value = "msg_manage.mng", method = RequestMethod.GET)
	public String mng_Messages(Model model) throws Exception{
		
		logger.info("-- 문의 관리 페이지로 이동");
		List<MessageVO> msgList = mservice.getMSGs();
		model.addAttribute("msgList", msgList);
		return "admin/msg_management.tiles";
	} // mng_Messages()
	
	/////////////////////////////////////////////////////////
}