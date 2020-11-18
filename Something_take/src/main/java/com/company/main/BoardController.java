package com.company.main;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.ReplyVO;
import com.company.service.BoardService;
import com.company.service.ReplyService;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	private static final Logger logger = 
			LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService bservice;
	
	@Inject
	private ReplyService reservice;
	
	/////////////////////////////////////////////////////////
	
	/* 글 등록 메서드 */
	@RequestMapping(value = "/write.post", method = RequestMethod.POST)
	public String writePOST(BoardVO bvo, HttpSession session, 
							MultipartHttpServletRequest multi,
							Model model) throws Exception {
		
		logger.info("-- 글 등록 버튼 실행");
		model.addAttribute("title", bvo.getTitle());
		model.addAttribute("content", multi.getAttribute(bvo.getContent()));
		model.addAttribute("writer", bvo.getWriter());
		bservice.insert(bvo);
		logger.info("-- 글 등록 버튼 실행 완료");
		
		return "redirect:../Board.bd";
	} // writePOST()

	/////////////////////////////////////////////////////////
	
	/* 글 수정 메서드 */
	// http://localhost:8081/page/Content.bd?bno=12
	@RequestMapping(value = "modify.post", method = RequestMethod.POST)
	public String modifyPOST(Model model, BoardVO bvo) throws Exception{
		
		logger.info("-- 글 수정 버튼 실행");
		model.addAttribute("bno", bvo.getBno());
		model.addAttribute("title", bvo.getTitle());
		model.addAttribute("content", bvo.getContent());
		model.addAttribute("writer", bvo.getWriter());
		logger.info("@@@ model : " + model);
		bservice.modify(bvo);
		logger.info("-- 글 수정 버튼 실행 완료");
		return "redirect:../Board.bd";
	} // modifyPOST()
	
	/////////////////////////////////////////////////////////

	/* 글 삭제 메서드 */
	@RequestMapping(value = "delete.post", method = RequestMethod.GET)
	public String deleteGET(@RequestParam("bno") int bno) throws Exception{
		
		logger.info("-- 글 삭제 버튼 실행");
		bservice.delete(bno);
		logger.info("-- 글 삭제 버튼 실행 완료");
		return "redirect:../Board.bd";
	} // deleteGET()	 
		
	/////////////////////////////////////////////////////////

	/* 글 작성 시 이미지 업로드 메서드 */
	@RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request, // 이미지를 저장하고, 불러오고, 업로드하기위해 매개변수를 선언
    						HttpServletResponse response, 
    						@RequestParam MultipartFile upload) throws Exception{
    	// MultipartFile 타입은 ckeditor에서 upload란 이름으로 저장하게 된다
 
		logger.info("-- Control : imageUpload() 호출 ");
		
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
 
        String fileName = upload.getOriginalFilename(); // 업로드한 파일 이름
        byte[] bytes = upload.getBytes(); // 파일을 바이트 배열로 변환
 
        // 이미지를 업로드 할 디렉토리(배포 디렉토리로 설정)
        String uploadPath = "D:\\workspace\\spring-tool_suite\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\HK_Project\\WEB-INF\\views\\uploadFiles\\";

		// 프로젝트는 개발 디렉토리에 저장이 되는데 이미지를 업로드할 디렉토리를 개발 디렉토리로 설정하면 일일이 새로고침을 해주어야되서
		// 불편하기 때문에 이미지를 업로드할 디렉토리를 배포 디렉토리로 설정한다.    
        
        OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
 
        // 서버로 업로드
        // write메소드의 매개값으로 파일의 총 바이트를 매개값으로 준다.
        // 지정된 바이트를 출력 스트립에 쓴다 (출력하기 위해서)
        out.write(bytes);
 
        // 클라이언트에 결과 표시
        String callback = request.getParameter("CKEditorFuncNum");
 
        // 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
        PrintWriter pw = response.getWriter();
        String fileUrl = request.getContextPath() + "/images/" + fileName;
        pw.println("<script>window.parent.CKEDITOR.tools.callFunction(" 
        		+ callback + ",'" + fileUrl
                + "','이미지가 업로드되었습니다.')" + "</script>");
        pw.flush();

	} // imageUpload()

	/////////////////////////////////////////////////////////
	
	/* 댓글 등록 메서드 */
	@RequestMapping(value = "reply.post", 
					method = RequestMethod.POST)
	public String replyAJAX(Model model, ReplyVO revo,
							HttpServletResponse response,
							HttpServletRequest request) throws Exception{
		
		logger.info("-- 댓글 등록 버튼 실행");
//		request.getParameter("bno");
//		logger.info("@@ request : " + request);
		model.addAttribute("bno", revo.getBno());
		model.addAttribute("content", revo.getContent());
		model.addAttribute("writer", revo.getWriter());
//		logger.info("@@@ model : " + model);
		
		int check = reservice.reply(revo);
		logger.info("@@@ check : " + check);
		logger.info("-- 댓글 등록 버튼 실행 완료");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(check);
		return "redirect:../Content.bd?bno="+revo.getBno();
	} // insertAJAX()
	
	/////////////////////////////////////////////////////////

	/* 페이징 처리 메서드 */
	@RequestMapping(value = "listCri.bd", method = RequestMethod.GET)
	public void listCri(Model model, Criteria cri) throws Exception{
		logger.info("-- 페이징 처리 메서드 listCri() 실행");
		List<BoardVO> boardList = bservice.listCri(cri);
		model.addAttribute("bdList", boardList);
		logger.info("-- 페이징 처리 메서드 listCri() 실행 완료");
	} // listCri()
	
	/////////////////////////////////////////////////////////
	
}