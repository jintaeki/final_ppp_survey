package com.mycompany.webapp.dto;

import java.util.Date;

public class NoticeSmsDTO {
	private int smsSeq;
	private int raterId;
	private String phone;
	private String surveyLink;
	private Date deliveryDate;
	private String deliveyYN;
	private String deliveryContent;
	public int getSmsSeq() {
		return smsSeq;
	}
	public int getRaterId() {
		return raterId;
	}
	public String getPhone() {
		return phone;
	}
	public String getSurveyLink() {
		return surveyLink;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public String getDeliveyYN() {
		return deliveyYN;
	}
	public String getDeliveryContent() {
		return deliveryContent;
	}
	public void setSmsSeq(int smsSeq) {
		this.smsSeq = smsSeq;
	}
	public void setRaterId(int raterId) {
		this.raterId = raterId;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setSurveyLink(String surveyLink) {
		this.surveyLink = surveyLink;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public void setDeliveyYN(String deliveyYN) {
		this.deliveyYN = deliveyYN;
	}
	public void setDeliveryContent(String deliveryContent) {
		this.deliveryContent = deliveryContent;
	}
	@Override
	public String toString() {
		return "NoticeSmsDTO [smsSeq=" + smsSeq + ", raterId=" + raterId + ", phone=" + phone + ", surveyLink="
				+ surveyLink + ", deliveryDate=" + deliveryDate + ", deliveyYN=" + deliveyYN + ", deliveryContent="
				+ deliveryContent + "]";
	}
	
	
	
	
	
}
