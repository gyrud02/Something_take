package com.company.domain;

import java.util.Date;

public class ReplyVO {

	private int bno; // 글번호 
	private String content; // 댓글 내용
	private String writer; // 댓글 작성자
	private Date re_reg_date; // 댓글 등록일자
	
	// getter
	public int getBno() {return bno;}
	public String getContent() {return content;}
	public String getWriter() {return writer;}
	public Date getRe_reg_date() {return re_reg_date;}

	// setter
	public void setBno(int bno) {this.bno = bno;}
	public void setContent(String content) {this.content = content;}
	public void setWriter(String writer) {this.writer = writer;}
	public void setRe_reg_date(Date re_reg_date) {this.re_reg_date = re_reg_date;}

	// toString()
	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", content=" + content + ", writer=" + writer + ", re_reg_date=" + re_reg_date
				+ "]";
	}
}