package com.company.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.domain.MessageVO;
import com.company.persistence.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService{

	@Inject
	private MessageDAO msgdao;
	
	///////////////////////////////////////////////////////////////////////
	
	/* 메세지 등록 메서드 */
	@Override
	public void registerMSG(MessageVO vo) throws Exception {
		System.out.println("-- ServiceImpl : insertMSG() 실행");
		msgdao.insert(vo);
		System.out.println("-- ServiceImpl : insertMSG() 실행 완료");
	} // insertMSG()

	///////////////////////////////////////////////////////////////////////

	/* 전체 문의 조회 메서드  */
	@Override
	public List<MessageVO> getMSGs() throws Exception {
		System.out.println("-- ServiceImpl : getMSGs() 실행");
		List<MessageVO> msgList = msgdao.getMSGs();
//		System.out.println("@@ msgList : " + msgList);
		System.out.println("-- ServiceImpl : getMSGs() 실행 완료");
		return msgList;
	} // getMSGs()

	///////////////////////////////////////////////////////////////////////

	/* 문의 내용 조회 메서드 */
	@Override
	public MessageVO readMSG(int msg_no) throws Exception {
		System.out.println("-- ServiceImpl : readMSG() 실행 ");
		MessageVO vo = msgdao.readMSG(msg_no);
		System.out.println("-- ServiceImpl : readMSG() 실행 완료");
		return vo;
	} // readMSG()

	///////////////////////////////////////////////////////////////////////

	/* 답변 상태 변경 메서드 */ 
	@Override
	public void modifyMSG(int msg_no, String msg_answerContent) throws Exception {
		System.out.println("-- ServiceImpl : modiMSG() 실행");
		msgdao.update(msg_no, msg_answerContent);
		System.out.println("-- ServiceImpl : modiMSG() 실행 완료");
	} // modiMSG()

	///////////////////////////////////////////////////////////////////////
	
}