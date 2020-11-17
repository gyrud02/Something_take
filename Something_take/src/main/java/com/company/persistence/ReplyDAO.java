package com.company.persistence;

import java.util.List;

import com.company.domain.ReplyVO;

public interface ReplyDAO {

	public int insertReply(ReplyVO revo) throws Exception; // 댓글 등록 메서드
	
	public List<ReplyVO> getReply(int bno) throws Exception; // 댓글 조회 메서드
	
}