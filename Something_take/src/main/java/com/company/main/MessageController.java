package com.company.main;

import java.io.PrintWriter;
import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.domain.MessageVO;
import com.company.service.MessageService;

@Controller
@RequestMapping(value = "/msg/*")
public class MessageController {

	private static final Logger logger =
			LoggerFactory.getLogger(MessageController.class);
	
	@Inject
	private MessageService service;
	
	/////////////////////////////////////////////////////////

	/* 메세지 등록 메서드 */
	@RequestMapping(value = "message.me", method = RequestMethod.POST)
	public String sendPOST(MessageVO vo, Model model,
							  HttpServletResponse response) throws Exception{
		
		logger.info("-- 메세지 전송 버튼 작동 ");
		
		model.addAttribute("msg_name", vo.getMsg_name());
		model.addAttribute("msg_phone", vo.getMsg_phone());
		model.addAttribute("msg_textarea", vo.getMsg_textarea());
		model.addAttribute("msg_answer", vo.getMsg_answer());
		service.registerMSG(vo);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('메세지 전송이 완료되었습니다.');");
		out.println("location.href='../index.do'");
		out.println("</script>");
		
		logger.info("-- 메세지 전송 버튼 작동 완료");
		return null;
	} // sendPOST()
	
	/////////////////////////////////////////////////////////
	
	/* 문의 내용 페이지 */
	@RequestMapping(value = "message", method = RequestMethod.GET)
	public String window_msg(@RequestParam("msg_no") int msg_no,
							 Model model) throws Exception{
		
		logger.info("-- 문의 내역 새 창 ");
		model.addAttribute("msg_no", msg_no);
		MessageVO vo = service.readMSG(msg_no);
		model.addAttribute("vo", vo);
		return "admin/message.tiles";
	} // window_msg()
	
	/////////////////////////////////////////////////////////

	/* 답변 상태 변경 메서드 */
	@RequestMapping(value = "answer", method = RequestMethod.GET)
	public String answerAJAX(@RequestParam("msg_no") int msg_no,
							 @RequestParam("msg_answerContent") String msg_answerContent,
							 Model model, HttpServletResponse response) 
							throws Exception{
		
		logger.info("-- 답변 완료 클릭 실행");
		model.addAttribute("msg_no", msg_no);
		model.addAttribute("msg_answerContent", msg_answerContent);
		service.modifyMSG(msg_no, msg_answerContent);
		return null;
	} // answerPOST()
	
	/////////////////////////////////////////////////////////
	
}