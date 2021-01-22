package com.company.service;

import java.util.List;

import com.company.domain.CartVO;
import com.company.domain.MemberVO;

public interface CartService {

	public void addCart(MemberVO mvo) throws Exception; // 카트 생성 메서드
	
	public List<CartVO> getCart(String cart_email) throws Exception; // 카트 조회 메서드 
	
	public List<CartVO> getProducts() throws Exception; // 카트 초기화 메서드
	
	public void deleteCart(MemberVO mvo) throws Exception; // 회원 탈퇴 시 카트 삭제 메서드
}