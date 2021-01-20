package com.company.domain;

import java.sql.Date;

public class BoardVO {

	private int bno; // 글번호
	private String title; // 글제목
	private String content; // 글내용 
	private String writer; // 작성자
	private Date reg_date; // 작성일시
	private int viewcount; // 조회수
	private String storedFileName; // 이미지 파일 저장명
	private String originalFileName; // 이미지 파일명
	
	// setter
	public void setBno(int bno) {this.bno = bno;}
	public void setTitle(String title) {this.title = title;}
	public void setContent(String content) {this.content = content;}
	public void setWriter(String writer) {this.writer = writer;}
	public void setReg_date(Date reg_date) {this.reg_date = reg_date;}
	public void setStoredFileName(String storedFileName) {this.storedFileName = storedFileName;}
	public void setOriginalFileName(String originalFileName) {this.originalFileName = originalFileName;}
	public void setViewcount(int viewcount) {this.viewcount = viewcount;}

	// getter
	public int getBno() {return bno;}
	public String getTitle() {return title;}
	public String getContent() {return content;}
	public String getWriter() {return writer;}
	public Date getReg_date() {return reg_date;}
	public int getViewcount() {return viewcount;}
	public String getStoredFileName() {return storedFileName;}
	public String getOriginalFileName() {return originalFileName;}
	
	// toString()
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", reg_date=" + reg_date + ", viewcount=" + viewcount + ", storedFileName=" + storedFileName
				+ ", originalFileName=" + originalFileName + "]";
	}
	
}