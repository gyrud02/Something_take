package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;
import com.company.domain.ReplyVO;

public interface ReplyService {

	/* ------------------------- [ 댓글  ] ------------------------- */
	
	public int reply(ReplyVO revo) throws Exception; // 댓글 등록 메서드
	
	public List<ReplyVO> getReply(int bno) throws Exception; // 댓글 조회 메서드
	
}