package com.mycompany.webapp.dto;

import java.util.Date;

public class NoticeEmailDTO {
	private int emailSeq;
	private String raterId;
	private String email;
	private String surveyLink;
	private Date deliveryDate;
	private String deliveryYN;
	private String deliveyContent;
	private int survey_seq;
	
	public int getEmailSeq() {
		return emailSeq;
	}
	public void setEmailSeq(int emailSeq) {
		this.emailSeq = emailSeq;
	}
	public String getRaterId() {
		return raterId;
	}
	public void setRaterId(String raterId) {
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
	public String getDeliveryYN() {
		return deliveryYN;
	}
	public void setDeliveryYN(String deliveryYN) {
		this.deliveryYN = deliveryYN;
	}
	public String getDeliveyContent() {
		return deliveyContent;
	}
	public void setDeliveyContent(String deliveyContent) {
		this.deliveyContent = deliveyContent;
	}
	public int getSurvey_seq() {
		return survey_seq;
	}
	public void setSurvey_seq(int survey_seq) {
		this.survey_seq = survey_seq;
	}
	
	@Override
	public String toString() {
		return "NoticeEmailDTO [emailSeq=" + emailSeq + ", raterId=" + raterId + ", email=" + email + ", surveyLink="
				+ surveyLink + ", deliveryDate=" + deliveryDate + ", deliveryYN=" + deliveryYN + ", deliveyContent="
				+ deliveyContent + ", survey_seq=" + survey_seq + "]";
	}

}

