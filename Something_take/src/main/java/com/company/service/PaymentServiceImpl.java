package com.company.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.domain.PaymentVO;
import com.company.persistence.PaymentDAO;

@Service
public class PaymentServiceImpl implements PaymentService{


	@Inject
	private PaymentDAO pdao;
	
	///////////////////////////////////////////////////////////////////////
	
	/* 결제 메서드 */
	@Override
	public void registerPM(PaymentVO pvo) throws Exception {
		System.out.println("-- ServiceImpl : registerPM() 실행");
		pdao.insert(pvo);
	} // registerPM()
	
	///////////////////////////////////////////////////////////////////////
	
}