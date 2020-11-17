package com.company.domain;

import java.sql.Timestamp;

public class MemberVO {

	private int idx; // 회원번호
	private String name; // 이름
	private String email; // 이메일
	private String pwd;	// 비밀번호
	private Timestamp reg_date; // 가입일자
	private Timestamp rev_date; // 수정일자
	private String membership_type; // 멤버십 타입
	private Timestamp membership_reg_date; // 멤버십 등록일자
	private Timestamp membership_end_date; // 멤버십 종료일자
	private String membership_pay; // 멤버십 금액 
	private String storedFileName; // 프로필 사진 저장 경로
	private String originalFileName; // 프로필 사진 기본 저장 경로

	// getter
	public int getIdx() {return idx;}
	public String getName() {return name;}
	public String getEmail() {return email;}
	public String getPwd() {return pwd;}
	public Timestamp getReg_date() {return reg_date;}
	public Timestamp getRev_date() {return rev_date;}
	public String getMembership_type() {return membership_type;}
	public Timestamp getMembership_reg_date() {return membership_reg_date;}
	public Timestamp getMembership_end_date() {return membership_end_date;}
	public String getMembership_pay() {return membership_pay;}
	public String getStoredFileName() {return storedFileName;}
	public String getOriginalFileName() {return originalFileName;}

	// setter
	public void setIdx(int idx) {this.idx = idx;}
	public void setName(String name) {this.name = name;}
	public void setEmail(String email) {this.email = email;}
	public void setPwd(String pwd) {this.pwd = pwd;}
	public void setReg_date(Timestamp reg_date) {this.reg_date = reg_date;}
	public void setRev_date(Timestamp rev_date) {this.reg_date = rev_date;}
	public void setMembership_type(String membership_type) {this.membership_type = membership_type;}
	public void setMembership_reg_date(Timestamp membership_reg_date) {this.membership_reg_date = membership_reg_date;}
	public void setMembership_end_date(Timestamp membership_end_date) {this.membership_end_date = membership_end_date;}
	public void setMembership_pay(String membership_pay) {this.membership_pay = membership_pay;}
	public void setStoredFileName(String storedFileName) {this.storedFileName = storedFileName;}
	public void setOriginalFileName(String originalFileName) {this.originalFileName = originalFileName;}

	// toString
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", name=" + name + ", email=" + email + ", pwd=" + pwd + ", reg_date="
				+ reg_date + ", rev_date=" + rev_date + ", membership_type=" + membership_type
				+ ", membership_reg_date=" + membership_reg_date + ", membership_end_date=" + membership_end_date
				+ ", membership_pay=" + membership_pay + ", storedFileName=" + storedFileName + ", originalFileName="
				+ originalFileName + "]";
	}
	
}