package com.company.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.domain.CartVO;
import com.company.domain.MemberVO;
import com.company.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService{

	@Inject
	private CartDAO cdao;

	///////////////////////////////////////////////////////////////////////

	/* 카트 생성 메서드 */
	@Override
	public void createCart(MemberVO mvo) throws Exception {
		System.out.println("-- ServiceImpl : addCart() 실행");
		cdao.create(mvo);
		System.out.println("-- ServiceImpl : addCart() 실행 완료");
	} // addCart()

	///////////////////////////////////////////////////////////////////////
	
	/* 카트 조회 메서드 */
	@Override
	public List<CartVO> getCart(String cart_email) throws Exception {
		System.out.println("-- ServiceImpl : getCart() 실행");
		List<CartVO> cartList = cdao.getCart(cart_email);
		System.out.println("-- ServiceImpl : getCart() 실행 완료");
		return cartList;
	} // getCart()

	///////////////////////////////////////////////////////////////////////

	/* 전체 상품 조회 메서드 */
	@Override
	public List<CartVO> getProducts() throws Exception {
		System.out.println("-- ServiceImpl : getProducts() 실행");
		List<CartVO> productList = cdao.productList();
		return productList;
	} // getProducts()

	///////////////////////////////////////////////////////////////////////

	/* 회원 탈퇴 시 카트 삭제 메서드 */
	@Override
	public void deleteCart(MemberVO mvo) throws Exception {
		System.out.println("-- ServiceImpl : deleteCart() 실행");
		cdao.delete(mvo);
	} // deleteCart();

	///////////////////////////////////////////////////////////////////////

	/* 카트 메뉴 추가 메서드 */
	@Override
	public void updateCart(CartVO cvo) throws Exception {
		System.out.println("-- ServiceImpl : insertCart() 실행");
		System.out.println("@@ vo : " + cvo);
		cdao.update(cvo);
	} // insertCart()

	///////////////////////////////////////////////////////////////////////
	
	
	
}