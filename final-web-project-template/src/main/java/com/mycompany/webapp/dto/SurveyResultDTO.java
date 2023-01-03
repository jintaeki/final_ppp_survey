package com.mycompany.webapp.dto;

public class SurveyResultDTO {
	private int surveyId;
	private int raterId;
	private int appraiseeId;
	private int anonymitySerialNumber;
	private int questionId;
	private int itemId;
	private String answerContent;
	public int getSurveyId() {
		return surveyId;
	}
	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}
	public int getRaterId() {
		return raterId;
	}
	public void setRaterId(int raterId) {
		this.raterId = raterId;
	}
	public int getAppraiseeId() {
		return appraiseeId;
	}
	public void setAppraiseeId(int appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public int getAnonymitySerialNumber() {
		return anonymitySerialNumber;
	}
	public void setAnonymitySerialNumber(int anonymitySerialNumber) {
		this.anonymitySerialNumber = anonymitySerialNumber;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	@Override
	public String toString() {
		return "SurveyResultDTO [surveyId=" + surveyId + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", anonymitySerialNumber=" + anonymitySerialNumber + ", questionId=" + questionId + ", itemId="
				+ itemId + ", answerContent=" + answerContent + ", getSurveyId()=" + getSurveyId() + ", getRaterId()="
				+ getRaterId() + ", getAppraiseeId()=" + getAppraiseeId() + ", getAnonymitySerialNumber()="
				+ getAnonymitySerialNumber() + ", getQuestionId()=" + getQuestionId() + ", getItemId()=" + getItemId()
				+ ", getAnswerContent()=" + getAnswerContent() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
