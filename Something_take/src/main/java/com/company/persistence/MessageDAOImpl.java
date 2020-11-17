package com.company.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import javax.xml.stream.events.Namespace;

import com.company.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace =
			"com.company.mapper.MessageMapper";

	/////////////////////////////////////////////////////////////////////

	/* 메세지 등록 메서드 */
	@Override
	public void insert(MessageVO msgvo) throws Exception {
		System.out.println("-- DAOImpl : insert() 실행");
		sqlSession.insert(namespace+".Insert", msgvo);
		System.out.println("-- DAOImpl : insert() 실행 완료");
	} // insert()

	/////////////////////////////////////////////////////////////////////

	/* 전체 문의 조회 메서드 */
	@Override
	public List<MessageVO> getMSGs() throws Exception {
		
		System.out.println("-- DAOImpl : getMSGs() 실행");
		List<MessageVO> msgList = sqlSession.selectList(namespace+".MSGList");
		System.out.println("@@ : msgList : " + msgList);

		System.out.println("-- DAOImpl : getMSGs() 실행 완료");
		return msgList;
	}

	/////////////////////////////////////////////////////////////////////

	/* 문의 내용 조회 메서드 */
	@Override
	public MessageVO readMSG(int msg_no) throws Exception {
		
		System.out.println("-- DAOImpl : readMSG() 실행");
		MessageVO vo = sqlSession.selectOne(namespace+".readMSG", msg_no);
		System.out.println("@@ vo : " + vo);
		
		System.out.println("-- DAOImpl : readMSG() 실행 완료");
		return vo;
	} // readMSG()

	/////////////////////////////////////////////////////////////////////
	
	/* 답변 상태 변경 메서드 */
	@Override
	public void modiMSG(int msg_no) throws Exception {
		
		System.out.println("-- DAOImpl : modiMSG() 실행");
		sqlSession.update(namespace+".modiMSG", msg_no);
		System.out.println("-- DAOImpl : modiMSG() 실행 완료");
	} // modiMSG()
	
	/////////////////////////////////////////////////////////////////////

	
	
	

	
	
	
	
	
	
}