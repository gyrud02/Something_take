package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.MemberVO;
import com.company.domain.ReplyVO;

public interface BoardService {

	/* ------------------------- [ 게시판  ] ------------------------- */
	
	public void insert(BoardVO bvo) throws Exception; // 글 등록 메서드

	public List<BoardVO> getBoard() throws Exception; // 글 전체 조회 메서드
	
	public BoardVO read(int bno) throws Exception; // 글 한 개 조회 메서드
	
	public void modify(BoardVO bvo) throws Exception; // 글 수정 메서드

	public void delete(int bno) throws Exception; // 글 삭제 메서드
	
	public void readCNT(int bno) throws Exception; // 조회 수 수정 메서드
	
	public List<BoardVO> listCri(Criteria cri) throws Exception; // 페이징 전환 메서드
	
	public int getCount() throws Exception; // 글 전체 갯수 조회
	
}