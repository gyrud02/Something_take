package com.company.domain;

import java.util.Random;

public class AuthKeyVO {

	private int authkey;
	private int data;
	
	// getter
	public int getAuthkey() {return authkey;}
	public int getData() {return data;}

	// setter
	public void setAuthkey(int authkey) {this.authkey = authkey;}
	public void setData(int data) {this.data = data;}
	
	public int init() throws Exception{
		Random random = new Random();
	    data = 0;
	    for(int i=0; i<=4; i++) {
	    	data = random.nextInt(10000); // 0부터 9까지 난수 생성
	    	if(data <= 999) {
	    		data += 1234;
	    	}
	    } // for
		return data;
	} // init()

	// toString()
	@Override
	public String toString() {
		return "AuthKeyVO [authkey=" + authkey + ", data=" + data + "]";
	}
}