package com.company.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.company.domain.BoardVO;
import com.company.domain.ReplyVO;
import com.company.service.BoardService;
import com.company.service.ReplyService;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	private static final Logger logger = 
			LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService bservice; // 글 관련 서비스
	
	@Inject
	private ReplyService reservice; // 댓글 관련 서비스
	
	/////////////////////////////////////////////////////////
	
	@ResponseBody
    @RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
    public int VerifyRecaptcha(HttpServletRequest request) {
		logger.info("-- 리캡챠 메소드 실행");
        VerifyRecaptcha.setSecretKey("6LeX4tkeAAAAAJ7DAZ_zjbNzgI5gCk9XhgNu1T5A");
//      logger.info("-- 리캡챠 : " + request.getParameter("recaptcha"));
        String gRecaptchaResponse = request.getParameter("recaptcha");
        System.out.println(gRecaptchaResponse);
        //0 = 성공, 1 = 실패, -1 = 오류
        try {
            if(VerifyRecaptcha.verify(gRecaptchaResponse))
                return 0;
            else return 1;
        } catch (IOException e) {
            e.printStackTrace();
            return -1;
        }
    } // VerifyRecaptcha
	
	/* 글 등록 메서드 */
	@RequestMapping(value = "/write.post", method = RequestMethod.POST)
	public String writePOST(BoardVO bvo, Model model,
							MultipartHttpServletRequest multi,
							HttpServletRequest request,
							HttpServletResponse response) throws Exception {
		logger.info("-- 글 등록 버튼 실행");
//		int a = VerifyRecaptcha(request);
//		System.out.println("******** a : " + a);
//		logger.info("-- request : " + request.getParameterValues(recaptcha));
		model.addAttribute("title", bvo.getTitle());
		model.addAttribute("content", bvo.getContent());
		model.addAttribute("writer", bvo.getWriter());
        bservice.insert(bvo);
		logger.info("-- 글 등록 버튼 실행 완료");
		//return "redirect:../board.bd";
		return "redirect:../write";
	} // writePOST()

	/////////////////////////////////////////////////////////
	
	/* 글 수정 메서드 */
	// http://localhost:8081/page/Content.bd?bno=12
	@RequestMapping(value = "modify.post", method = RequestMethod.POST)
	public String modifyPOST(Model model, BoardVO bvo,
							 MultipartHttpServletRequest multi) throws Exception{
		logger.info("-- 글 수정 버튼 실행");
		model.addAttribute("bno", bvo.getBno());
		model.addAttribute("title", bvo.getTitle());
		model.addAttribute("content", bvo.getContent());
		model.addAttribute("writer", bvo.getWriter());
		logger.info("@@@ model : " + model);
		bservice.modify(bvo);
		logger.info("-- 글 수정 버튼 실행 완료");
		return "redirect:../board.bd";
	} // modifyPOST()
	
	/////////////////////////////////////////////////////////

	/* 글 삭제 메서드 */
	@RequestMapping(value = "delete.post", method = RequestMethod.GET)
	public String deleteGET(@RequestParam("bno") int bno) throws Exception{
		logger.info("-- 글 삭제 버튼 실행");
		bservice.delete(bno);
		logger.info("-- 글 삭제 버튼 실행 완료");
		return "redirect:../board.bd";
	} // deleteGET()	 
		
	/////////////////////////////////////////////////////////

	/* 댓글 등록 메서드 */
	@RequestMapping(value = "reply.get", method = RequestMethod.GET)
	public String replyAJAX(Model model, ReplyVO revo,
							HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		logger.info("-- 댓글 등록 버튼 실행");
		model.addAttribute("bno", revo.getBno());
		model.addAttribute("content", revo.getContent());
		model.addAttribute("writer", revo.getWriter());
		
/*		int check = reservice.reply(revo);
		logger.info("@@@ check : " + check);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(check);
*/		
		return null;
	} // replyAJAX()
	
	/////////////////////////////////////////////////////////

}