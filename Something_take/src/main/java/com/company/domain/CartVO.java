package com.company.domain;

import java.sql.Timestamp;

public class CartVO {

	// table CartVO
	private int cart_id; // 카트 번호
	private String cart_email; // 아이디(이메일)
	private Timestamp cart_addDate; // 카트 생성 시간
	private int cart_amount; // 총 갯수
	private int cart_money; // 총 금액
	
	// table productVO
	private int product_id; // 메뉴 번호
	private String product_name; // 상품명
	private int price; // 메뉴 금액
	private String picture_url; // 상품 이미지
	
	// getter
	public int getCart_id() {return cart_id;}
	public String getCart_email() {return cart_email;}
	public Timestamp getCart_addDate() {return cart_addDate;}
	public int getCart_amount() {return cart_amount;}
	public int getCart_money() {return cart_money;}
	public int getProduct_id() {return product_id;}
	public String getProduct_name() {return product_name;}
	public int getPrice() {return price;}
	public String getPicture_url() {return picture_url;}

	// setter
	public void setCart_id(int cart_id) {this.cart_id = cart_id;}
	public void setCart_email(String cart_email) {this.cart_email = cart_email;}
	public void setCart_addDate(Timestamp cart_addDate) {this.cart_addDate = cart_addDate;}
	public void setCart_amount(int cart_amount) {this.cart_amount = cart_amount;}
	public void setCart_money(int cart_money) {this.cart_money = cart_money;}
	public void setProduct_id(int product_id) {this.product_id = product_id;}
	public void setProduct_name(String product_name) {this.product_name = product_name;}
	public void setPrice(int price) {this.price = price;}
	public void setPicture_url(String picture_url) {this.picture_url = picture_url;}

	// toString
	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", cart_email=" + cart_email + ", cart_addDate=" + cart_addDate
				+ ", cart_amount=" + cart_amount + ", cart_money=" + cart_money + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", price=" + price + ", picture_url=" + picture_url + "]";
	}
	
}