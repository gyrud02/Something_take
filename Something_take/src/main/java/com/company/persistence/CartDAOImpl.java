package com.company.persistence;

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

	
	
	
}