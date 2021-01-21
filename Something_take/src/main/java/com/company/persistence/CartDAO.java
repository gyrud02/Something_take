package com.company.persistence;

import java.util.List;

import com.company.domain.CartVO;
import com.company.domain.MemberVO;

public interface CartDAO {

	public void addCart(MemberVO mvo) throws Exception; // 카트 생성 메서드
	
	public int getCartNum(CartVO cvo) throws Exception; // 카트 번호 조회 메서드
	
	public void delCart(CartVO cvo) throws Exception; // 카트 삭제 메서드
	
	public List<CartVO> getCart(String cart_email) throws Exception; // 카트 조회 메서드
	
	public int totalNum(String cart_email) throws Exception; // 총 갯수 조회 메서드
	
	public void initialize(String cart_email) throws Exception; // 카트 초기화 메서드
}