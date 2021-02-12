package com.company.persistence;

import java.util.List;

import com.company.domain.PaymentVO;

public interface PaymentDAO {

	public void insert(PaymentVO pvo) throws Exception; // 결제 메서드
	
	public List<PaymentVO> getList() throws Exception; // 전체 내역 가져오기 메서드
	
	public List<PaymentVO> selectList(String email) throws Exception;// 해당 결제 내역 가져오기 메서드
	
}