package com.company.domain;

import java.sql.Date;

public class CartVO {

	private int cartNum; // 카트 번호
	private String email; // 아이디(이메일)
	private Date addDate; // 추가 시간
	
	// 메뉴
	private String americano; // 아메리카노
	private int cartStock1; // 아메리카노 수량
	
	private String espresso; // 에스프레소
	private int cartStock2; // 에스프레소 수량
	
	private String caffelatte; // 카페라떼
	private int cartStock3; // 카페라떼 수량
	
	private String cappuccino; // 카푸치노
	private int cartStock4; // 카푸치노 수량
	
	private String greentea_latte; // 녹차라떼
	private int cartStock5; // 녹차라떼 수량
	
	private String lemonade; // 레모네이드
	private int cartStock6; // 레모네이드 수량
	
	private int total; // 총합
	
	// getter
	public int getCartNum() {return cartNum;}
	public String getEmail() {return email;}
	public Date getAddDate() {return addDate;}
	public String getAmericano() {return americano;}
	public int getCartStock1() {return cartStock1;}
	public String getEspresso() {return espresso;}
	public int getCartStock2() {return cartStock2;}
	public String getCaffelatte() {return caffelatte;}
	public int getCartStock3() {return cartStock3;}
	public String getCappuccino() {return cappuccino;}
	public int getCartStock4() {return cartStock4;}
	public String getGreentea_latte() {return greentea_latte;}
	public int getCartStock5() {return cartStock5;}
	public String getLemonade() {return lemonade;}
	public int getCartStock6() {return cartStock6;}

	// setter
	public void setCartNum(int cartNum) {this.cartNum = cartNum;}
	public void setEmail(String email) {this.email = email;}
	public void setAddDate(Date addDate) {this.addDate = addDate;}
	public void setAmericano(String americano) {this.americano = americano;}
	public void setCartStock1(int cartStock1) {this.cartStock1 = cartStock1;}
	public void setEspresso(String espresso) {this.espresso = espresso;}
	public void setCartStock2(int cartStock2) {this.cartStock2 = cartStock2;}
	public void setCaffelatte(String caffelatte) {this.caffelatte = caffelatte;}
	public void setCartStock3(int cartStock3) {this.cartStock3 = cartStock3;}
	public void setCappuccino(String cappuccino) {this.cappuccino = cappuccino;}
	public void setCartStock4(int cartStock4) {this.cartStock4 = cartStock4;}
	public void setGreentea_latte(String greentea_latte) {this.greentea_latte = greentea_latte;}
	public void setCartStock5(int cartStock5) {this.cartStock5 = cartStock5;}
	public void setLemonade(String lemonade) {this.lemonade = lemonade;}
	public void setCartStock6(int cartStock6) {this.cartStock6 = cartStock6;}

	// toString
	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", email=" + email + ", addDate=" + addDate + ", americano=" + americano
				+ ", cartStock1=" + cartStock1 + ", espresso=" + espresso + ", cartStock2=" + cartStock2
				+ ", caffelatte=" + caffelatte + ", cartStock3=" + cartStock3 + ", cappuccino=" + cappuccino
				+ ", cartStock4=" + cartStock4 + ", greentea_latte=" + greentea_latte + ", cartStock5=" + cartStock5
				+ ", lemonade=" + lemonade + ", cartStock6=" + cartStock6 + "]";
	}
	
}