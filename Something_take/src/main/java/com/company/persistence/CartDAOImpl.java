package com.company.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.CartVO;
import com.company.domain.MemberVO;

@Repository
public class CartDAOImpl implements CartDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = 
			"com.company.mapper.CartMapper";

	///////////////////////////////////////////////////////////////////////
	
	/* 카트 생성 메서드 */
	@Override
	public void create(MemberVO mvo) throws Exception {
		System.out.println("-- DAOImpl : addCart() 실행");
		sqlSession.insert(namespace+".create", mvo);
		System.out.println("-- DAOImpl : addCart() 실행 완료");
	} // addCart()

	///////////////////////////////////////////////////////////////////////

	/* 카트 조회 메서드 */
	@Override
	public List<CartVO> getCart(String cart_email) throws Exception {
		System.out.println("-- DAOImpl : getCart() 실행");
		List<CartVO> cartList = sqlSession.selectList(namespace+".getCart", cart_email);
		System.out.println("-- DAOImpl : getCart() 실행 완료");
		return cartList;
	} // getCart()

	///////////////////////////////////////////////////////////////////////

	/* 전체 상품 조회 메서드 */
	@Override
	public List<CartVO> productList() throws Exception {
		System.out.println("-- DAOImpl : productList() 실행");
		List<CartVO> productList = sqlSession.selectList(namespace+".getProduct");
		return productList;
	} // productList()

	///////////////////////////////////////////////////////////////////////

	/* 회원 탈퇴 시 카트 삭제 메서드 */
	@Override
	public void delete(MemberVO mvo) throws Exception {
		System.out.println("-- DAOImpl : delete() 실행");
		sqlSession.delete(namespace+".deleteCart", mvo);
	} // delete()

	///////////////////////////////////////////////////////////////////////

	
	
	
}