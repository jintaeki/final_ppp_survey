package com.mycompany.webapp.dto;

import java.util.Date;

public class NoticeEmailDTO {
	private int emailSerialNumber;
	private int raterId;
	private String email;
	private String surveyLink;
	private Date deliveryDate;
	private String deliveryCheck;
	private String deliveyContent;
	
	public int getEmailSerialNumber() {
		return emailSerialNumber;
	}
	public void setEmailSerialNumber(int emailSerialNumber) {
		this.emailSerialNumber = emailSerialNumber;
	}
	public int getRaterId() {
		return raterId;
	}
	public void setRaterId(int raterId) {
		this.raterId = raterId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getDeliveryCheck() {
		return deliveryCheck;
	}
	public void setDeliveryCheck(String deliveryCheck) {
		this.deliveryCheck = deliveryCheck;
	}
	public String getDeliveyContent() {
		return deliveyContent;
	}
	public void setDeliveyContent(String deliveyContent) {
		this.deliveyContent = deliveyContent;
	}
	@Override
	public String toString() {
		return "NoticeEmailDTO [emailSerialNumber=" + emailSerialNumber + ", raterId=" + raterId + ", email=" + email
				+ ", surveyLink=" + surveyLink + ", deliveryDate=" + deliveryDate + ", deliveryCheck=" + deliveryCheck
				+ ", deliveyContent=" + deliveyContent + ", getEmailSerialNumber()=" + getEmailSerialNumber()
				+ ", getRaterId()=" + getRaterId() + ", getEmail()=" + getEmail() + ", getSurveyLink()="
				+ getSurveyLink() + ", getDeliveryDate()=" + getDeliveryDate() + ", getDeliveryCheck()="
				+ getDeliveryCheck() + ", getDeliveyContent()=" + getDeliveyContent() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
