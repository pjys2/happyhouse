package com.ssafy.dto;

public class BoardDTO {
	private String no;
	private String id;
	private String subject;
	private String contents;
	private String search;
	
	
	
	public BoardDTO() {
		super();
	}
	public BoardDTO(String no, String id, String subject, String contents, String search) {
		super();
		this.no = no;
		this.id = id;
		this.subject = subject;
		this.contents = contents;
		this.search = search;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", id=" + id + ", subject=" + subject + ", contents=" + contents + ", search="
				+ search + "]";
	}
	
	
	

}