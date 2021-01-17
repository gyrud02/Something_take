package com.company.domain;

import java.security.Timestamp;

public class PaymentVO {

	private int orderNum; // 주문번호
	private String email; // 이메일
	private String phone; // 전화번호
	private String americano; // 메뉴명1
	private int americano_Num; // 메뉴1 갯수
	private String espresso; // 메뉴명2
	private int espresso_Num; // 메뉴2 갯수
	private String caffelatte; // 메뉴명3
	private int caffelatte_Num; // 메뉴3 갯수
	private String cappuccino; // 메뉴명4
	private int cappuccino_Num; // 메뉴4 갯수
	private String greentealatte; // 메뉴명5
	private int greentealatte_Num; // 메뉴5 갯수
	private String lemonade; // 메뉴명6
	private int lemonade_Num; // 메뉴6 갯수
	private Timestamp order_date; // 주문일시
	private String order_check; // 주문 확인
	
	// setter
	public void setOrderNum(int orderNum) {this.orderNum = orderNum;}
	public void setEmail(String email) {this.email = email;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setAmericano(String americano) {this.americano = americano;}
	public void setAmericano_Num(int americano_Num) {this.americano_Num = americano_Num;}
	public void setEspresso(String espresso) {this.espresso = espresso;}
	public void setEspresso_Num(int espresso_Num) {this.espresso_Num = espresso_Num;}
	public void setCaffelatte(String caffelatte) {this.caffelatte = caffelatte;}
	public void setCaffelatte_Num(int caffelatte_Num) {this.caffelatte_Num = caffelatte_Num;}
	public void setCappuccino(String cappuccino) {this.cappuccino = cappuccino;}
	public void setCappuccino_Num(int cappuccino_Num) {this.cappuccino_Num = cappuccino_Num;}
	public void setGreentealatte(String greentealatte) {this.greentealatte = greentealatte;}
	public void setGreentealatte_Num(int greentealatte_Num) {this.greentealatte_Num = greentealatte_Num;}
	public void setLemonade(String lemonade) {this.lemonade = lemonade;}
	public void setLemonade_Num(int lemonade_Num) {this.lemonade_Num = lemonade_Num;}
	public void setOrder_date(Timestamp order_date) {this.order_date = order_date;}
	public void setOrder_check(String order_check) {this.order_check = order_check;}
	
	// getter
	public int getOrderNum() {return orderNum;}
	public String getEmail() {return email;}
	public String getPhone() {return phone;}
	public String getAmericano() {return americano;}
	public int getAmericano_Num() {return americano_Num;}
	public String getEspresso() {return espresso;}
	public int getEspresso_Num() {return espresso_Num;}
	public String getCaffelatte() {return caffelatte;}
	public int getCaffelatte_Num() {return caffelatte_Num;}
	public String getCappuccino() {return cappuccino;}
	public int getCappuccino_Num() {return cappuccino_Num;}
	public String getGreentealatte() {return greentealatte;}
	public int getGreentealatte_Num() {return greentealatte_Num;}
	public String getLemonade() {return lemonade;}
	public int getLemonade_Num() {return lemonade_Num;}
	public Timestamp getOrder_date() {return order_date;}
	public String getOrder_check() {return order_check;}

	// toString()
	@Override
	public String toString() {
		return "PaymentVO [orderNum=" + orderNum + ", email=" + email + ", phone=" + phone + ", americano=" + americano
				+ ", americano_Num=" + americano_Num + ", espresso=" + espresso + ", espresso_Num=" + espresso_Num
				+ ", caffelatte=" + caffelatte + ", caffelatte_Num=" + caffelatte_Num + ", cappuccino=" + cappuccino
				+ ", cappuccino_Num=" + cappuccino_Num + ", greentealatte=" + greentealatte + ", greentealatte_Num="
				+ greentealatte_Num + ", lemonade=" + lemonade + ", lemonade_Num=" + lemonade_Num + ", order_date="
				+ order_date + ", order_check=" + order_check + "]";
	}
	
}