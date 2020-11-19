package com.company.persistence;

import java.util.List;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;

public interface BoardDAO {

	/* ------------------------- [ 게시판 ] ------------------------- */
	
	public void getInsert(BoardVO bvo) throws Exception; // 글 등록 메서드
	
	public List<BoardVO> getBoard() throws Exception; // 글 전체 조회 메서드
	
	public BoardVO getRead(int bno) throws Exception; // 글 한개 조회 메서드

	public void getModi(BoardVO bvo) throws Exception; // 글 수정 메서드
	
	public void getDel(int bno) throws Exception; // 글 삭제 메서드
	
	public void readCNT(int bno) throws Exception; // 조회수 수정 메서드
	
	public List<BoardVO> listPage(int page) throws Exception; // 페이징처리 (글 목록 10개씩 조회)
	
	public List<BoardVO> listPage(Criteria cri) throws Exception; // 페이징처리 (객체 사용)
	
	public int getCount() throws Exception; // 글 전체 갯수 조회
}