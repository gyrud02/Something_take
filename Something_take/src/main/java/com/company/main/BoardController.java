package com.company.main;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	/* 글 등록 메서드 */
	@RequestMapping(value = "/write.post", method = RequestMethod.POST)
	public String writePOST(BoardVO bvo, Model model,
							MultipartHttpServletRequest multi,
							HttpServletRequest request,
							HttpServletResponse response) throws Exception {
		logger.info("-- 글 등록 버튼 실행");
		model.addAttribute("title", bvo.getTitle());
		model.addAttribute("content", bvo.getContent());
		model.addAttribute("writer", bvo.getWriter());
		model.addAttribute("storedFileName", multi.getAttribute(bvo.getStoredFileName()));
		model.addAttribute("originalFileName", multi.getAttribute(bvo.getOriginalFileName()));
		
		response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
 
        bservice.insert(bvo);
		logger.info("-- 글 등록 버튼 실행 완료");
		return "redirect:../Board.bd";
	} // writePOST()

	/////////////////////////////////////////////////////////

	/* 이미지 업로드 메서드 */
	@RequestMapping(value = "imgUpload", method = RequestMethod.POST)
	@ResponseBody
	public String imageFileUpload(HttpServletRequest req,
								  HttpServletResponse resp,
								  MultipartHttpServletRequest multiFile) throws Exception{
		logger.info("-- 이미지 업로드 실행");
		
		JSONObject json = new JSONObject();
		OutputStream out = null;
		PrintWriter printWriter = null;
		ServletContext context = req.getSession().getServletContext();
		MultipartFile file = multiFile.getFile("upload");
		logger.info("@@ file : " + file);
		
		if(file != null) { 
			if(file.getSize() > 0){
				if(file.getContentType().toLowerCase().startsWith("image/")) {
					try {					
						String fileName = file.getName(); // 업로드한 파일 이름
				        byte[] bytes = file.getBytes(); // 파일을 바이트 배열로 변환
				        String uploadPath = context.getRealPath("/img");
//				        String uploadPath = context.getRealPath("WEB-INF/views/board/boardFiles");
				        File uploadFile = new File(uploadPath);
				        logger.info("@@ file : " + file + "/ filename : " + fileName + "/ uploadPath : " + uploadPath);
	
				        if(!uploadFile.exists()) {
				        	uploadFile.mkdirs();
				        } // if
				        
				        fileName = UUID.randomUUID().toString();
				        uploadPath = uploadPath + "/" + fileName;
				        
				        out = new FileOutputStream(new File(uploadPath));
				        out.write(bytes);
				        logger.info("@@ file : " + file + "/ filename : " + fileName + "/ uploadPath : " + uploadPath);
				        
				        printWriter = resp.getWriter();
				        resp.setContentType("text/html"); 
				        
//				        String fileUrl = req.getContextPath() + "/webapp/WEB-INF/views/board/boardFiles/" + fileName;
				        String fileUrl = req.getContextPath() + "/img/" + fileName; 
//				        String fileUrl = context.getRealPath("WEB-INF/views/board/boardFiles/") + fileName; 
				        logger.info("@@ file : " + file + "/ filename : " + fileName + "/ uploadPath : " + uploadPath + "/ fileUrl : " + fileUrl);
				  
						json.append("uploaded", 1); 
						json.append("filename", fileName);
						json.append("url", fileUrl);
						printWriter.println(json); 
				  
					  } catch (Exception e) {
						  e.printStackTrace(); 
					  } finally { 
						  if( out != null ) { out.close(); }
						  if( printWriter != null ) { printWriter.close(); } 
					  } // try
			  
				} // if
			} // if 
		} // if
		return null;
	} // imageFileUpload()
	
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
		model.addAttribute("storedFileName", multi.getAttribute(bvo.getStoredFileName()));
		model.addAttribute("originalFileName", multi.getAttribute(bvo.getOriginalFileName()));
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

	/* 댓글 등록 메서드 */
	@RequestMapping(value = "reply.get", method = RequestMethod.GET)
	public String replyAJAX(Model model, ReplyVO revo,
							HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		logger.info("-- 댓글 등록 버튼 실행");
		model.addAttribute("bno", revo.getBno());
		model.addAttribute("content", revo.getContent());
		model.addAttribute("writer", revo.getWriter());
		
		int check = reservice.reply(revo);
		logger.info("@@@ check : " + check);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(check);
//		return "redirect:../Content.bd?bno="+revo.getBno();
		return null;
	} // insertAJAX()
	
	/////////////////////////////////////////////////////////

}