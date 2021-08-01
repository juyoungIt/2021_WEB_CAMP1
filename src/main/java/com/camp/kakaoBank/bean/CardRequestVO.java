package com.camp.kakaoBank.bean;

import java.util.Date;

public class CardRequestVO {
	private int req_id; // request id
	private String kor_first_name;
	private String kor_last_name;
	private String eng_first_name;
	private String eng_last_name;
	private String birth_date;
	private String phone;
	private String address;
	private Date requestAt;
	
	// getter and setters
	public int getReq_id() {
		return req_id;
	}
	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	public String getKor_first_name() {
		return kor_first_name;
	}
	public void setKor_first_name(String kor_first_name) {
		this.kor_first_name = kor_first_name;
	}
	public String getKor_last_name() {
		return kor_last_name;
	}
	public void setKor_last_name(String kor_last_name) {
		this.kor_last_name = kor_last_name;
	}
	public String getEng_first_name() {
		return eng_first_name;
	}
	public void setEng_first_name(String eng_first_name) {
		this.eng_first_name = eng_first_name;
	}
	public String getEng_last_name() {
		return eng_last_name;
	}
	public void setEng_last_name(String eng_last_name) {
		this.eng_last_name = eng_last_name;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRequestAt() {
		return requestAt;
	}
	public void setRequestAt(Date requestAt) {
		this.requestAt = requestAt;
	}
}
