package com.company.domain;

import java.sql.Date;

public class MessageVO {

	private int msg_no; // 메세지 송신 번호
	private String msg_name; // 고객명
	private String msg_phone; // 고객 연락처
	private String msg_textarea; // 문의 내용
	private String msg_answer; // 답변 O/X
	private Date msg_send_date; // 수신일자
	private String msg_answerContent; // 답변 내용
	private Date msg_answer_date; // 답변일자
	
	// getter
	public int getMsg_no() {return msg_no;}
	public String getMsg_name() {return msg_name;}
	public String getMsg_phone() {return msg_phone;}
	public String getMsg_textarea() {return msg_textarea;}
	public String getMsg_answer() {return msg_answer;}
	public Date getMsg_send_date() {return msg_send_date;}
	public String getMsg_answerContent() {return msg_answerContent;}
	public Date getMsg_answer_date() {return msg_answer_date;}

	// setter
	public void setMsg_no(int msg_no) {this.msg_no = msg_no;}
	public void setMsg_name(String msg_name) {this.msg_name = msg_name;}
	public void setMsg_phone(String msg_phone) {this.msg_phone = msg_phone;}
	public void setMsg_textarea(String msg_textarea) {this.msg_textarea = msg_textarea;}
	public void setMsg_answer(String msg_answer) {this.msg_answer = msg_answer;}
	public void setMsg_send_date(Date msg_send_date) {this.msg_send_date = msg_send_date;}
	public void setMsg_answerContent(String msg_answerContent) {this.msg_answerContent = msg_answerContent;}
	public void setMsg_answer_date(Date msg_answer_date) {this.msg_answer_date = msg_answer_date;}
	
	// toString
	@Override
	public String toString() {
		return "MessageVO [msg_no=" + msg_no + ", msg_name=" + msg_name + ", msg_phone=" + msg_phone + ", msg_textarea="
				+ msg_textarea + ", msg_answer=" + msg_answer + ", msg_send_date=" + msg_send_date
				+ ", msg_answerContent=" + msg_answerContent + ", msg_answer_date=" + msg_answer_date + "]";
	}
	
}