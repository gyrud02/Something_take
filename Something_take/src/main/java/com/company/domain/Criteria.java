package com.company.domain;

public class Criteria {

	private int page; // 페이지 정보(시작 지점)
	private int pageSize; // 페이지 크기
	
	public Criteria() {
		this.page = 1; // 1페이지부터 시작
		this.pageSize = 10; // 10블록 
	} // Criteria()

	// getter 
	public int getPage() {return page;}
	public int getPageSize() {return pageSize;}

	// limit 시작값 계산 : Mapper에서 getPageStart()를 호출할 예정
	public int getPageStart() {
		return (this.page - 1) * pageSize;
		// 시작 데이터 번호 = (페이지 번호 - 1) * 10(10=페이지에서 보여질 갯수);
	} // getPageStart()
	
	// setter
	// -> 외부에서 받아서 그 페이지 그대로 시작지점을 결정한다. (비정상적인 데이터 입력 시 1페이지로 고정하기)
	public void setPage(int page) {
		if(0 >= page) {
			this.page = 1;
			return;
		} // if
		this.page = page;
	} // setPage()
	
	// -> 한번에 가져올 글의 갯수를 지정
	public void setPageSize(int pageSize) {
		// 비정상적인 페이지 크기를 입력 받았을 때 기본값으로 지정한다.
		if(0 >= pageSize || 100 < pageSize) {
			this.pageSize = 10;
		} // if

		this.pageSize = pageSize;
	} // setPageSize()

	// toString
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + "]";
	}
	
}