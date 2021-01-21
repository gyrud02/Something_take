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
import com.company.domain.CartVO;
import com.company.domain.Criteria;
import com.company.domain.MemberVO;
import com.company.domain.MessageVO;
import com.company.domain.ReplyVO;
import com.company.service.BoardService;
import com.company.service.CartService;
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
	
	@Inject
	private CartService cservice; // 카트 관련 서비스
	
	/////////////////////////////////////////////////////////
	
	/* 메인 화면 페이지 */
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("-- 썸띵테이크에 오신걸 환영합니다.");
		return "main.tiles"; // tiles.xml의  <definition name="main" extends="base">을 리턴시킨다
	}

	/////////////////////////////////////////////////////////

	/* About 화면 페이지 */
	@RequestMapping(value = "about.do", method = RequestMethod.GET)
	public String about() {
		logger.info("-- About 페이지로 이동");
		return "/business/about.tiles";
	} // aboutUs()
	
	/////////////////////////////////////////////////////////

	/* 회원가입 페이지로 이동하는 메소드 */
	@RequestMapping(value = "sign-up.me", method = RequestMethod.GET)
	public String sign_Up() {
		logger.info("-- 회원가입 페이지로 이동");
		return "member/sign_up.tiles";
	} // Sign_Up()
	
	/////////////////////////////////////////////////////////
	
	/* 가입 시 회원 약관 페이지 새 창 띄우는 메소드 */
	@RequestMapping(value = "agree.me", method = RequestMethod.GET)
	public String agreement() {
		logger.info("-- 회원 약관 동의 페이지로 이동");
		return "member/terms_of_mem.tiles";
	} // yackwan()
		
	/////////////////////////////////////////////////////////

	/* 로그인 페이지로 이동하는 메소드 */
	@RequestMapping(value = "sign-in.me", method = RequestMethod.GET)
	public String sign_In() {
		logger.info("-- 로그인 페이지로 이동");
		return "member/sign_in.tiles";
	} // signIn()
	
	/////////////////////////////////////////////////////////
	
	/* 비밀번호 찾기 페이지로 이동하는 메소드 */
	@RequestMapping(value = "findPw.me", method = RequestMethod.GET)
	public String find_Pw() {
		logger.info("-- 비밀번호 찾기 페이지로 이동");
		return "member/mem_findpw.tiles";
	} // findPw()
	
	/////////////////////////////////////////////////////////

	/* 게시판 페이지로 이동 */
	@RequestMapping(value = "board.bd", method = RequestMethod.GET)
	public String board(Model model, Criteria cri) throws Exception {
		int count = 0;
		logger.info("-- 게시판 페이지로 이동");
		List<BoardVO> boardList = bservice.listCri(cri);
		count = bservice.getCount();
		model.addAttribute("boardList", boardList);
		model.addAttribute("count", count);
		return "board/board.tiles";
	} // board()
	
	/////////////////////////////////////////////////////////
	
	/* 페이징 처리 페이지로 이동 */
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String listCri(Model model, Criteria cri) throws Exception{
		int count = 0;
		logger.info("-- 페이징 처리 페이지로 이동");
		List<BoardVO> boardList = bservice.listCri(cri);
		count = bservice.getCount();
		model.addAttribute("boardList", boardList);
		model.addAttribute("criteria", cri);
		model.addAttribute("count", count);
//		logger.info("@@@ boardList : " + boardList);
//		logger.info("@@@ count : " + count);
		return "board/paging.tiles";
	} // listCri()
	
	/////////////////////////////////////////////////////////

	/* 글쓰기 페이지로 이동 */
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write(HttpSession session) {
		logger.info("-- 게시판 글쓰기 페이지로 이동");
		return "board/write.tiles";
	} // write()

	/////////////////////////////////////////////////////////
	
	/* 글 내용 보기 페이지로 이동  */
	@RequestMapping(value = "content.bd", method = RequestMethod.GET)
	public String content(@RequestParam("bno") int bno, 
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
	
	/////////////////////////////////////////////////////////

	/* 글 수정 페이지로 이동 */
	@RequestMapping(value = "modify.bd", method = RequestMethod.GET)
	public String modify(@RequestParam("bno") int bno, Model model) throws Exception{
		logger.info("-- 게시판 글 수정 페이지로 이동");
		BoardVO bvo = bservice.read(bno);
		logger.info("@@@ bvo : " + bvo);
		model.addAttribute("readList", bvo);
		return "board/modify.tiles";
	} // modify()
	
	/////////////////////////////////////////////////////////

	/* 갤러리 게시판 페이지로 이동 */
	@RequestMapping(value = "interior.bd", method = RequestMethod.GET)
	public String interior() {
		logger.info("-- 인테리어 게시판 페이지로 이동");
		return "gallary/interior.tiles";
	} // gallaryBoard()

	/////////////////////////////////////////////////////////

	/* 회원정보 페이지로 이동하는 메소드 */
	@RequestMapping(value = "/profile.me", method = RequestMethod.GET)
	public String mem_Profile(HttpServletRequest request, HttpSession session) throws Exception {
		logger.info("-- 회원정보 페이지로 이동");
		session = request.getSession();
		String email = (String)session.getAttribute("email");
		MemberVO name = service.getMem(email);
		session.setAttribute("MemberVO", name);
		return "member/mem_modify.tiles";
	} // profile()

	/////////////////////////////////////////////////////////
	
	/* 회원 탈퇴 페이지로 이동하는 메소드 */
	@RequestMapping(value = "/drop-out.me", method = RequestMethod.GET)
	public String drop_Out() {
		logger.info("-- 회원탈퇴 페이지로 이동");
		return "member/mem_delete.tiles";
	} // dropOut()

	/////////////////////////////////////////////////////////

	/* 결제 페이지로 이동하는 메소드 */
	@RequestMapping(value = "memberShip.pm", method = RequestMethod.GET)
	public String memberShip() throws Exception{
		logger.info("-- 멤버십 페이지로 이동");
		return "payment/membership.tiles";
	} // payment()
	
	/////////////////////////////////////////////////////////

	/* 결제 내역 페이지로 이동하는 메소드 */
	@RequestMapping(value = "membership.me", method = RequestMethod.GET)
	public String membership(HttpServletRequest request, HttpSession session) throws Exception{
		logger.info("-- 결제 내역 페이지로 이동");
		session = request.getSession();
		String email = (String)session.getAttribute("email");
		logger.info("-- @@@ email : " + email);
		MemberVO membership = service.getMembership(email);
		session.setAttribute("membership", membership);
		return "member/mem_membership.tiles";
	} // membership()

	/////////////////////////////////////////////////////////

	/* 관리자 메뉴 - 회원 관리 페이지 */
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String admin_Main(Model model) throws Exception{
		logger.info("-- [관리자] 페이지로 이동");
		return "admin/adm_main.tiles";
	} // admin_Main()
	
	/////////////////////////////////////////////////////////
	
	/* 관리자 메뉴 - 회원 관리 페이지 */
	@RequestMapping(value = "ad_mem", method = RequestMethod.GET)
	public String admin_Members(Model model) throws Exception{
		logger.info("-- [관리자] 회원 관리 페이지로 이동");
		List<MemberVO> memberList = service.getMembers();
		model.addAttribute("memberList", memberList);
		return "admin/adm_members.tiles";
	} // admin_Members()
	
	/////////////////////////////////////////////////////////
	
	/* 관리자 메뉴 - 매출 관리 페이지 */
	@RequestMapping(value = "ad_pay", method = RequestMethod.GET)
	public String admin_Payments(Model model) throws Exception{
		logger.info("-- [관리자] 매출 관리 페이지로 이동");
//		List<MessageVO> msgList = mservice.getMSGs();
//		model.addAttribute("msgList", msgList);
		return "admin/adm_payments.tiles";
	} // admin_Payments()
	
	/////////////////////////////////////////////////////////
	
	/* 관리자 메뉴 - 주문 관리 페이지 */
	@RequestMapping(value = "ad_order", method = RequestMethod.GET)
	public String admin_Ordered(Model model) throws Exception{
		logger.info("-- [관리자] 주문 관리 페이지로 이동");
//		List<MessageVO> msgList = mservice.getMSGs();
//		model.addAttribute("msgList", msgList);
		return "admin/adm_ordered.tiles";
	} // admin_Ordered()
	
	/////////////////////////////////////////////////////////

	/* 관리자 메뉴 - 문의 관리 페이지 */
	@RequestMapping(value = "ad_msg", method = RequestMethod.GET)
	public String admin_Messages(Model model) throws Exception{
		logger.info("-- [관리자] 문의 관리 페이지로 이동");
		List<MessageVO> msgList = mservice.getMSGs();
		model.addAttribute("msgList", msgList);
		return "admin/adm_messages.tiles";
	} // admin_Messages()
	
	/////////////////////////////////////////////////////////
	
	/* 관리자 메뉴 - 게시판 관리 페이지 */
	@RequestMapping(value = "ad_board", method = RequestMethod.GET)
	public String admin_Board(Model model) throws Exception{
		logger.info("-- [관리자] 게시판 관리 페이지로 이동");
		List<BoardVO> boardList = bservice.getBoard();
		model.addAttribute("boardList", boardList);
		return "admin/adm_board.tiles";
	} // admin_Messages()
	
	/////////////////////////////////////////////////////////

	/* 관리자 메뉴 -  관리 페이지 */
	@RequestMapping(value = "ad_icons", method = RequestMethod.GET)
	public String admin_Icons(Model model) throws Exception{
		logger.info("-- [관리자] 관리 페이지로 이동");
		return "admin/adm_icons.tiles";
	} // admin_Messages()
	
	/////////////////////////////////////////////////////////
	
	/* 카트 조회하기 */
	@RequestMapping(value = "newCart", method = RequestMethod.GET)
	public String getCart(Model model, HttpSession session) throws Exception{
		logger.info("-- 장바구니 조회 실행");
		String cart_email = (String)session.getAttribute("email");
		List<CartVO> cartList = cservice.getCart(cart_email);
		int total = cservice.totalNum(cart_email);
		model.addAttribute("cartList", cartList);
		model.addAttribute("total", total);
		logger.info("@@ cartList : " + cartList + "/ total : " + total);
		return "payment/cart.tiles";
	} // getCart()
	
	/////////////////////////////////////////////////////////

	/* 카트 페이지  */
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cartPage(Model model, HttpSession session) throws Exception{
		logger.info("-- 장바구니 페이지로 이동");
		String cart_email = (String)session.getAttribute("email");
		List<CartVO> cartList = cservice.getCart(cart_email);
		int total = cservice.totalNum(cart_email);
		model.addAttribute("cartList", cartList);
		model.addAttribute("total", total);
		return "payment/cart.tiles";
	} // myCart()
	
	/////////////////////////////////////////////////////////
	
	/* 결제하기 페이지 */
	@RequestMapping(value = "cartList", method = RequestMethod.GET)
	public String cartList(Model model, HttpSession session) throws Exception{
		logger.info("-- 장바구니 리스트 페이지로 이동");
		String cart_email = (String)session.getAttribute("email");
		List<CartVO> cartList = cservice.getCart(cart_email);
		int total = cservice.totalNum(cart_email);
		model.addAttribute("cartList", cartList);
		model.addAttribute("total", total);
		return "payment/cartList.tiles";
	} // cartList()
	
	/////////////////////////////////////////////////////////
	
}