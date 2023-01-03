package com.mycompany.webapp.dto;

import java.util.Date;

public class NoticeSmsDTO {
	private int smsSerialNumber;
	private int raterId;
	private String phone;
	private String surveyLink;
	private Date deliveryDate;
	private String deliveyCheck;
	private String deliveryContent;
	
	
	public int getSmsSerialNumber() {
		return smsSerialNumber;
	}
	public void setSmsSerialNumber(int smsSerialNumber) {
		this.smsSerialNumber = smsSerialNumber;
	}
	public int getRaterId() {
		return raterId;
	}
	public void setRaterId(int raterId) {
		this.raterId = raterId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSurveyLink() {
		return surveyLink;
	}
	public void setSurveyLink(String surveyLink) {
		this.surveyLink = surveyLink;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getDeliveyCheck() {
		return deliveyCheck;
	}
	public void setDeliveyCheck(String deliveyCheck) {
		this.deliveyCheck = deliveyCheck;
	}
	public String getDeliveryContent() {
		return deliveryContent;
	}
	public void setDeliveryContent(String deliveryContent) {
		this.deliveryContent = deliveryContent;
	}
	@Override
	public String toString() {
		return "NoticeSmsDTO [smsSerialNumber=" + smsSerialNumber + ", raterId=" + raterId + ", phone=" + phone
				+ ", surveyLink=" + surveyLink + ", deliveryDate=" + deliveryDate + ", deliveyCheck=" + deliveyCheck
				+ ", deliveryContent=" + deliveryContent + ", getSmsSerialNumber()=" + getSmsSerialNumber()
				+ ", getRaterId()=" + getRaterId() + ", getPhone()=" + getPhone() + ", getSurveyLink()="
				+ getSurveyLink() + ", getDeliveryDate()=" + getDeliveryDate() + ", getDeliveyCheck()="
				+ getDeliveyCheck() + ", getDeliveryContent()=" + getDeliveryContent() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
