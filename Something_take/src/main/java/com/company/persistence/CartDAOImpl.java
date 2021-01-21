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
	public void addCart(MemberVO mvo) throws Exception {
		System.out.println("-- DAOImpl : addCart() 실행");
		sqlSession.insert(namespace+".addCart", mvo);
		System.out.println("-- DAOImpl : addCart() 실행 완료");
	} // addCart()

	///////////////////////////////////////////////////////////////////////

	/* 카트 번호 조회 메서드 */
	@Override
	public int getCartNum(CartVO cvo) throws Exception {
		System.out.println("-- DAOImpl : getCartNum() 실행");
		int num = sqlSession.selectOne(namespace+".getCartNum", cvo);
		System.out.println("-- DAOImpl : getCartNum() 실행 완료");
		return num;
	} // getCartNum()
	
	///////////////////////////////////////////////////////////////////////

	/* 카트 삭제 메서드 */
	@Override
	public void delCart(CartVO cvo) throws Exception {
		System.out.println("-- DAOImpl : delCart() 실행");
		sqlSession.delete(namespace+".delCart", cvo);
		System.out.println("-- DAOImpl : delCart() 실행 완료");
	} // delCart()

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

	/* 총 갯수 조회 메서드 */
	@Override
	public int totalNum(String cart_email) throws Exception {
		int total = 0;
		System.out.println("-- DAOImpl : totalNum() 실행");
		total = sqlSession.selectOne(namespace+".totalNum", cart_email);
		System.out.println("-- DAOImpl : totalNum() 실행 완료");
		return total;
	} // totalNum()

	///////////////////////////////////////////////////////////////////////

	/* 카트 초기화 메서드 */
	@Override
	public void initialize(String cart_email) throws Exception {
		System.out.println("-- DAOImpl : initialize() 실행");
		sqlSession.delete(namespace+".initialize", cart_email);
	} // initialize()

	///////////////////////////////////////////////////////////////////////

	
	
	
}