package com.company.domain;

import java.security.Timestamp;

public class PaymentVO {

	private int order_id; // 주문번호
	private String email; // 이메일
	private String phone; // 전화번호
	private Timestamp order_date; // 주문일시
	private int product_id; // 상품번호
	private String product_name; // 상품명
	private int product_price; // 상품가격
	private int product_amount; // 상품갯수
	private int cart_money; // 총 금액
	private int cart_amount; // 총 갯수
	
	// getter
	public int getOrder_id() {return order_id;}
	public String getEmail() {return email;}
	public String getPhone() {return phone;}
	public Timestamp getOrder_date() {return order_date;}
	public int getProduct_id() {return product_id;}
	public String getProduct_name() {return product_name;}
	public int getProduct_price() {return product_price;}
	public int getProduct_amount() {return product_amount;}
	public int getCart_money() {return cart_money;}
	public int getCart_amount() {return cart_amount;}

	// setter
	public void setOrder_id(int order_id) {this.order_id = order_id;}
	public void setEmail(String email) {this.email = email;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setOrder_date(Timestamp order_date) {this.order_date = order_date;}
	public void setProduct_id(int product_id) {this.product_id = product_id;}
	public void setProduct_name(String product_name) {this.product_name = product_name;}
	public void setProduct_price(int product_price) {this.product_price = product_price;}
	public void setProduct_amount(int product_amount) {this.product_amount = product_amount;}
	public void setCart_money(int cart_money) {this.cart_money = cart_money;}
	public void setCart_amount(int cart_amount) {this.cart_amount = cart_amount;}

	// toString()
	@Override
	public String toString() {
		return "PaymentVO [order_id=" + order_id + ", email=" + email + ", phone=" + phone + ", order_date="
				+ order_date + ", product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_amount=" + product_amount + ", cart_money=" + cart_money + ", cart_amount="
				+ cart_amount + "]";
	}
	
}