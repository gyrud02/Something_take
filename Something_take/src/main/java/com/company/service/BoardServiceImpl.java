package com.company.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO bdao;
	
	///////////////////////////////////////////////////////////////////////

	/* 글 등록 메서드  */
	@Override
	public void insert(BoardVO bvo) throws Exception {

		System.out.println("-- ServiceImpl : insert() 실행 ");
		bdao.getInsert(bvo);
		
		System.out.println("-- bvo : " + bvo);
		System.out.println("-- ServiceImpl : insert() 실행 완료");

	}
	
	///////////////////////////////////////////////////////////////////////

	/* 글 전체 조회 메서드 */
	@Override
	public List<BoardVO> getBoard() throws Exception {

		System.out.println("-- ServiceImpl : getBoard() 실행");
		List<BoardVO> boardList = bdao.getBoard();
		System.out.println("-- ServiceImpl : getBoard() 실행 완료");
		
		return boardList;
	} // getBoard()

	///////////////////////////////////////////////////////////////////////

	/* 글 하나 조회 메서드 */
	@Override
	public BoardVO read(int bno) throws Exception {

		System.out.println("-- ServiceImpl : read() 실행 ");
		BoardVO bvo = bdao.getRead(bno);
		System.out.println("-- ServiceImpl : read() 실행 완료");
		
		return bvo;
	} // read()

	///////////////////////////////////////////////////////////////////////

	/* 글 수정 메서드 */
	@Override
	public void modify(BoardVO bvo) throws Exception {
		
		System.out.println("-- ServiceImpl : modify() 실행");
		bdao.getModi(bvo);
		System.out.println("-- ServiceImpl : modify() 실행 완료");
	} // modify()

	///////////////////////////////////////////////////////////////////////

	/* 글 삭제 메서드 */
	@Override
	public void delete(int bno) throws Exception {

		System.out.println("-- ServiceImpl : delete() 실행");
		bdao.getDel(bno);
		System.out.println("-- ServiceImpl : delete() 실행 완료");
		
	} // delete()

	///////////////////////////////////////////////////////////////////////

	/* 조회 수 수정 메서드 */
	@Override
	public void readCNT(int bno) throws Exception {

		System.out.println("-- ServiceImpl : readCNT() 실행");
		bdao.readCNT(bno);
		System.out.println("-- ServiceImpl : readCNT() 실행 완료");
	} // readCNT()

	///////////////////////////////////////////////////////////////////////

	/* 페이징 전환 메서드 */
	@Override
	public List<BoardVO> listCri(Criteria cri) throws Exception {

		System.out.println("-- ServiceImpl : listCri() 실행");
		return bdao.listPage(cri);
	} // listCri()

	///////////////////////////////////////////////////////////////////////
	
}