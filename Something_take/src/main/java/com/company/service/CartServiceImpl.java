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
	
	/* 메뉴 추가 메서드 */
	@Override
	public int addMenu(String email, String menu) throws Exception {
		System.out.println("-- ServiceImpl : addMenu() 실행");
		int check = cdao.addMenu(email, menu);
		System.out.println("-- ServiceImpl : addMenu() 실행 완료");
		return check;
	} // addMenu()

	///////////////////////////////////////////////////////////////////////

	/* 카트 조회 메서드 */
	@Override
	public List<CartVO> getCart(String email) throws Exception {
		System.out.println("-- ServiceImpl : getCart() 실행");
		List<CartVO> cartList = cdao.getCart(email);
		System.out.println("-- ServiceImpl : getCart() 실행 완료");
		return cartList;
	} // getCart()

	///////////////////////////////////////////////////////////////////////

	/* 총 갯수 조회 메서드 */
	@Override
	public int totalNum(String email) throws Exception {
		System.out.println("-- ServiceImpl : totalNum() 실행");
		int total = 0;
		total = cdao.totalNum(email);
		System.out.println("-- ServiceImpl : totalNum() 실행 완료");
		return total;
	} // totalNum()

	///////////////////////////////////////////////////////////////////////
	
	
	
}