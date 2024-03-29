package com.company.service;

import java.util.List;

import com.company.domain.MessageVO;

public interface MessageService {

	public void registerMSG(MessageVO vo) throws Exception; // 메세지 등록 메서드
	
	public List<MessageVO> getMSGs() throws Exception; // 전체 문의 조회 메서드
	
	public MessageVO readMSG(int msg_no) throws Exception; // 문의 내용 조회 메서드
	
	public void modifyMSG(int msg_no, String msg_answerContent) throws Exception; // 답변 상태 변경 메서드
	
}