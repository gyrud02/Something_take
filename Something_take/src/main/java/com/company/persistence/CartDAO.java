package com.company.persistence;

import java.util.List;

import com.company.domain.CartVO;
import com.company.domain.MemberVO;

public interface CartDAO {

	public void create(MemberVO mvo) throws Exception; // 카트 생성 메서드
	
	public List<CartVO> getCart(String cart_email) throws Exception; // 카트 조회 메서드
	
	public List<CartVO> productList() throws Exception; // 전체 상품 조회 메서드
	
	public void delete(MemberVO mvo) throws Exception; // 회원 탈퇴 시 카트 삭제 메서드
	
	public void update(CartVO cvo) throws Exception; // 카트 메뉴 추가 메서드
}