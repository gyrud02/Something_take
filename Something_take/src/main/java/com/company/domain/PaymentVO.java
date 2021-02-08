package com.company.domain;

import java.sql.Date;

public class PaymentVO {

	private int order_id; // 주문번호
	private String email; // 이메일
	private String phone; // 전화번호
	private Date order_date; // 주문일시
	private String menu; // 메뉴명
	private String menutype; // ICE/HOT
	private int amount; // 갯수
	private int price; // 가격
	private String message; // 메세지
	
	// setter
	public void setOrder_id(int order_id) {this.order_id = order_id;}
	public void setEmail(String email) {this.email = email;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setOrder_date(Date order_date) {this.order_date = order_date;}
	public void setMenu(String menu) {this.menu = menu;}
	public void setMenutype(String menutype) {this.menutype = menutype;}
	public void setAmount(int amount) {this.amount = amount;}
	public void setPrice(int price) {this.price = price;}
	public void setMessage(String message) {this.message = message;}
	
	// getter
	public int getOrder_id() {return order_id;}
	public String getEmail() {return email;}
	public String getPhone() {return phone;}
	public Date getOrder_date() {return order_date;}
	public String getMenu() {return menu;}
	public String getMenutype() {return menutype;}
	public int getAmount() {return amount;}
	public int getPrice() {return price;}
	public String getMessage() {return message;}

	// toString()
	@Override
	public String toString() {
		return "PaymentVO [order_id=" + order_id + ", email=" + email + ", phone=" + phone + ", order_date="
				+ order_date + ", menu=" + menu + ", menutype=" + menutype + ", amount=" + amount + ", price=" + price
				+ ", message=" + message + ", getOrder_id()=" + getOrder_id() + ", getEmail()=" + getEmail()
				+ ", getPhone()=" + getPhone() + ", getOrder_date()=" + getOrder_date() + ", getMenu()=" + getMenu()
				+ ", getMenutype()=" + getMenutype() + ", getAmount()=" + getAmount() + ", getPrice()=" + getPrice()
				+ ", getMessage()=" + getMessage() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}