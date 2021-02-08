package com.company.persistence;

import com.company.domain.PaymentVO;

public interface PaymentDAO {

	public void insert(PaymentVO pvo) throws Exception; // 결제 메서드
	
}