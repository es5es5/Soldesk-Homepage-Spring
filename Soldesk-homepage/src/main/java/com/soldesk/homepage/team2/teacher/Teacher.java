package com.soldesk.homepage.team2.teacher;

public class Teacher {
	private int st_no;
	private String st_name;
	private String st_photo;
	private String st_resume;
	private String st_certificate;
	
	public Teacher(int st_no, String st_name, String st_photo, String st_resume, String st_certificate) {
		super();
		this.st_no = st_no;
		this.st_name = st_name;
		this.st_photo = st_photo;
		this.st_resume = st_resume;
		this.st_certificate = st_certificate;
	}
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getSt_photo() {
		return st_photo;
	}
	public void setSt_photo(String st_photo) {
		this.st_photo = st_photo;
	}
	public String getSt_resume() {
		return st_resume;
	}
	public void setSt_resume(String st_resume) {
		this.st_resume = st_resume;
	}
	public String getSt_certificate() {
		return st_certificate;
	}
	public void setSt_certificate(String st_certificate) {
		this.st_certificate = st_certificate;
	}
	
}
