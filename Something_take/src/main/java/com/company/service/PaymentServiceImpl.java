package com.company.service;

import java.util.List;

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

	/* 전체 내역 가져오기 메서드 */
	@Override
	public List<PaymentVO> getPayment() throws Exception {
		System.out.println("-- ServiceImpl : getPayment()");
		List<PaymentVO> pmList = pdao.getList();
		return pmList;
	} // getPayment()

	///////////////////////////////////////////////////////////////////////

	/* 해당 결제 내역 가져오기 메서드 */
	@Override
	public List<PaymentVO> getPay(String email) throws Exception {
		System.out.println("-- ServiceImpl : getPay()");
		List<PaymentVO> pmList = pdao.selectList(email);
		return pmList;
	} // getPay()
	
	///////////////////////////////////////////////////////////////////////
	
}