package com.company.service;

import java.util.List;

import com.company.domain.MemberVO;

public interface MemberService {

	public void insertMem(MemberVO vo) throws Exception; // 회원가입 메서드
	
	public MemberVO loginMem(MemberVO vo) throws Exception; // 로그인 메서드
	
	public MemberVO getMem(String email) throws Exception; // 본인 정보를 가져오는 메서드
	
	public MemberVO updateMem(MemberVO vo) throws Exception; // 회원 정보 수정 메서드
	
	public int deleteMem(MemberVO vo) throws Exception; // 회원 탈퇴 메서드
	
	public MemberVO getMembership(String email) throws Exception; // 멤버십 정보를 가져오는 메서드

	public List<MemberVO> getMembers() throws Exception; // 회원 정보 전체 조회
	
	public int duplicate(String email) throws Exception; // 이메일 중복 확인 메서드
	
	public void payment(MemberVO vo) throws Exception; // 멤버십 결제 메서드
	
	public String getFindPw(String email) throws Exception; // 비밀번호 찾기 메서드
	
	public String authKeyCheck() throws Exception; // 가입 인증번호 일치 확인 메서드 
	
}