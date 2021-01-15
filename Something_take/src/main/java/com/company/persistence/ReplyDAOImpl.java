package com.company.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.BoardVO;
import com.company.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	private SqlSession sqlSession;
	
	private final static String namespace =
						"com.company.mapper.ReplyMapper";
	
	///////////////////////////////////////////////////////////////////////
	
	/* 댓글 등록 메서드 */
	@Override
	public int insertReply(ReplyVO revo) throws Exception {
		int check = 0;
		System.out.println("-- DAOImpl : insertReply() 실행");
		check = sqlSession.insert(namespace+".insertReply", revo);
		System.out.println("-- DAOImpl : insertReply() 실행 완료");
		return check;
	} // reply()

	///////////////////////////////////////////////////////////////////////

	/* 댓글 조회 메서드 */
	@Override
	public List<ReplyVO> getReply(int bno) throws Exception {
		
		System.out.println("-- DAOImpl : getReply() 실행");
		List<ReplyVO> replyList = sqlSession.selectList(namespace+".replyList", bno);
		System.out.println("-- DAOImpl : getReply() 실행 완료");
		return replyList;
	} // getReply()
	
	///////////////////////////////////////////////////////////////////////

}