package com.company.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace =
			"com.company.mapper.BoardMapper";

	///////////////////////////////////////////////////////////////////////

	/* 공지사항 글 등록 메서드 */
	@Override
	public void getInsert(BoardVO bvo) throws Exception {

		System.out.println("-- DAOImpl : getInsert() 실행 ");
		sqlSession.selectOne(namespace+".insert", bvo);
		System.out.println("-- DAOImpl : getInsert() 실행 완료");
		
	} // getInsert()

	///////////////////////////////////////////////////////////////////////

	/* 글 전체 조회 메서드 */
	@Override
	public List<BoardVO> getBoard() throws Exception {
		
		System.out.println("-- DAOImpl : getBoard() 실행");
		List<BoardVO> boardList = sqlSession.selectList(namespace+".listAll");
		System.out.println("@@@ boardList : " + boardList);
		System.out.println("-- DAOImpl : getBoard() 실행 완료");
		return boardList;
	} // getBoard()

	///////////////////////////////////////////////////////////////////////

	/* 글 전체 갯수 조회 */
	@Override
	public int getCount() throws Exception{
		
		int count = 0;
		System.out.println("-- DAOImpl : getCount() 실행");
		count = sqlSession.selectOne(namespace+".getCount");
		System.out.println("@@@ count : " + count);
		System.out.println("-- DAOImpl : getCount() 실행 완료");
		return count;
	} // getCount()
	
	///////////////////////////////////////////////////////////////////////

	/* 글 한 개 조회 메서드 */
	@Override
	public BoardVO getRead(int bno) throws Exception {
		
		System.out.println("-- DAOImpl : getRead() 실행");
		BoardVO bvo = sqlSession.selectOne(namespace+".read", bno);
		System.out.println("@@@ bvo : " + bvo);
		System.out.println("-- DAOImpl : getRead() 실행 완료");
		
		return bvo;
	} // getRead()

	///////////////////////////////////////////////////////////////////////

	/* 글 수정 메서드 */
	@Override
	public void getModi(BoardVO bvo) throws Exception {

		System.out.println("-- DAOImpl : getModi() 실행 ");
		sqlSession.update(namespace+".modify", bvo);
		System.out.println("-- DAOImpl : getModi() 실행 완료");
	} // getModi()
	
	///////////////////////////////////////////////////////////////////////

	/* 글 삭제 메서드 */
	@Override
	public void getDel(int bno) throws Exception {
		
		System.out.println("-- DAOImpl : getDel() 실행 ");
		sqlSession.delete(namespace+".delete", bno);
		System.out.println("-- DAOImpl : getDel() 실행 완료");
		
	} // getDel()

	///////////////////////////////////////////////////////////////////////

	/* 조회수 수정 메서드 */
	@Override
	public void readCNT(int bno) throws Exception {
		
		System.out.println("-- DAOImpl : readCNT() 실행");
		sqlSession.update(namespace+".readCNT", bno);
		System.out.println("-- DAOImpl : readCNT() 실행 완료");
	} // readCNT()

	///////////////////////////////////////////////////////////////////////

	/* 페이징 처리  */
	// 1) 글 목록 10개씩 조회
	@Override
	public List<BoardVO> listPage(int page) throws Exception {

		System.out.println("-- DAOImpl : listPage(int page) 실행");
		
		if(page <= 0) {
			page = 1;
		} // if
		
		page = (page - 1) * 10;
		
		return sqlSession.selectList(namespace+".listPage", page);
	} // listPage(int page)

	// 2) 객체 사용 
	@Override
	public List<BoardVO> listPage(Criteria cri) throws Exception {

		System.out.println("-- DAOImpl : listPage(Criteria cri) 실행");

		return sqlSession.selectList(namespace+".listCri", cri);
	} // listPage(Criteria cri)
	
	///////////////////////////////////////////////////////////////////////


	
	
	
}