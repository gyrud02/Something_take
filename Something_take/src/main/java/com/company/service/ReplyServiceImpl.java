package com.company.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.domain.BoardVO;
import com.company.domain.MemberVO;
import com.company.domain.ReplyVO;
import com.company.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO redao;
	
	///////////////////////////////////////////////////////////////////////
	
	/* 댓글 등록 메서드  */
	@Override
	public int reply(ReplyVO revo) throws Exception {

		int check = 0;
		System.out.println("-- ServiceImpl : reply() 실행");
		check = redao.insertReply(revo);
		System.out.println("-- ServiceImpl : reply() 실행 완료");
		
		return check;
	} // reply()

	///////////////////////////////////////////////////////////////////////

	/* 댓글 조회 메서드 */
	@Override
	public List<ReplyVO> getReply(int bno) throws Exception {
		
		System.out.println("-- ServiceImpl : getReply() 실행");
		List<ReplyVO> replyList = redao.getReply(bno);
		System.out.println("@@@ replyList : " + replyList);
		System.out.println("-- ServiceImpl : getReply() 실행 완료");
		return replyList;
	} // getReply()
	
	///////////////////////////////////////////////////////////////////////

}