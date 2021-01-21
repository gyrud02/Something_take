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
	public void addCart(MemberVO mvo) throws Exception {
		System.out.println("-- ServiceImpl : addCart() 실행");
		cdao.addCart(mvo);
		System.out.println("-- ServiceImpl : addCart() 실행 완료");
	} // addCart()

	///////////////////////////////////////////////////////////////////////

	/* 카트 번호 조회 메서드 */
	@Override
	public int getCartNum(CartVO cvo) throws Exception {
		System.out.println("-- ServiceImpl : getCartNum() 실행");
		int num = cdao.getCartNum(cvo);
		System.out.println("-- ServiceImpl : getCartNum() 실행 완료");
		return num;
	} // getCartNum()
	
	///////////////////////////////////////////////////////////////////////
	
	/* 카트 삭제 메서드 */
	@Override
	public void delCart(CartVO cvo) throws Exception {
		System.out.println("-- ServiceImpl : delCart() 실행");
		cdao.delCart(cvo);
		System.out.println("-- ServiceImpl : delCart() 실행 완료");
	} // delCart()

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

	/* 총 갯수 조회 메서드 */
	@Override
	public int totalNum(String cart_email) throws Exception {
		System.out.println("-- ServiceImpl : totalNum() 실행");
		int total = 0;
		total = cdao.totalNum(cart_email);
		System.out.println("-- ServiceImpl : totalNum() 실행 완료");
		return total;
	} // totalNum()

	///////////////////////////////////////////////////////////////////////

	/* 카트 초기화 메서드 */
	@Override
	public void cartInit(String cart_email) throws Exception {
		System.out.println("-- ServiceImpl : cartInit() 실행");
		cdao.initialize(cart_email);
	} // cartInit()

	///////////////////////////////////////////////////////////////////////
	
	
	
	
}