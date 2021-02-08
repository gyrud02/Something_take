package com.company.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.PaymentVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = 
			"com.company.mapper.PaymentMapper";

	/////////////////////////////////////////////////////////////////////

	/* 결제 메서드 */
	@Override
	public void insert(PaymentVO pvo) throws Exception {
		System.out.println("-- DAOImpl : insert() 실행");
		sqlSession.insert(namespace+".insert", pvo);
	} // insert()
	
	/////////////////////////////////////////////////////////////////////
	
}