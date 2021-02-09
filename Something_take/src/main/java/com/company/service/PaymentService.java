package com.company.service;

import java.util.List;

import com.company.domain.PaymentVO;

public interface PaymentService {

	public void registerPM(PaymentVO pvo) throws Exception; // 결제 메서드
	
	public List<PaymentVO> getPayment() throws Exception; // 전체 내역 가져오기 메서드
}