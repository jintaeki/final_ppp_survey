package com.mycompany.webapp.dto;

import java.util.Date;

public class NoticeEmailDTO {
	private int emailSeq;
	private int raterId;
	private String email;
	private String surveyLink;
	private Date deliveryDate;
	private String deliveryYN;
	private String deliveyContent;
	
	public int getEmailSeq() {
		return emailSeq;
	}
	public int getRaterId() {
		return raterId;
	}
	public String getEmail() {
		return email;
	}
	public String getSurveyLink() {
		return surveyLink;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public String getDeliveryYN() {
		return deliveryYN;
	}
	public String getDeliveyContent() {
		return deliveyContent;
	}
	public void setEmailSeq(int emailSeq) {
		this.emailSeq = emailSeq;
	}
	public void setRaterId(int raterId) {
		this.raterId = raterId;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setSurveyLink(String surveyLink) {
		this.surveyLink = surveyLink;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public void setDeliveryYN(String deliveryYN) {
		this.deliveryYN = deliveryYN;
	}
	public void setDeliveyContent(String deliveyContent) {
		this.deliveyContent = deliveyContent;
	}
	
	@Override
	public String toString() {
		return "NoticeEmailDTO [emailSeq=" + emailSeq + ", raterId=" + raterId + ", email=" + email + ", surveyLink="
				+ surveyLink + ", deliveryDate=" + deliveryDate + ", deliveryYN=" + deliveryYN + ", deliveyContent="
				+ deliveyContent + "]";
	}
	
	
	
	
}
