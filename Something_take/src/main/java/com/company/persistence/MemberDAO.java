package com.company.persistence;

import java.util.List;

import com.company.domain.MemberVO;

public interface MemberDAO {

	public void signUp(MemberVO vo) throws Exception; // 회원가입 메서드
	
	public MemberVO signIn(String email, String pwd) throws Exception; // 로그인 메서드
	
	public MemberVO getMem(String email) throws Exception; // ID에 해당하는 회원 정보를 가져오는 메서드
	
	public int modify(MemberVO vo) throws Exception; // 회원 정보 수정 메서드
	
	public int dropOut(MemberVO vo) throws Exception; // 회원 탈퇴 메서드
	
	public MemberVO getMembership(String email) throws Exception; // 멤버십 정보를 가져오는 메서드
	
	public List<MemberVO> getMembers() throws Exception; // 전체 회원 조회 메서드
	
	public int duplicate(String email) throws Exception; // 이메일 중복 확인 메서드
	
}