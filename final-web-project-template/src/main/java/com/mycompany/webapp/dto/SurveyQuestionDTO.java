package com.mycompany.webapp.dto;

public class SurveyQuestionDTO {
	private int surveyId;
	private int questionId;
	private String questionContent;
	private int questionTypeCode;
	private int itemId;
	private String itemContent;
	private String itemScore;
	
	
	public int getSurveyId() {
		return surveyId;
	}
	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public int getQuestionTypeCode() {
		return questionTypeCode;
	}
	public void setQuestionTypeCode(int questionTypeCode) {
		this.questionTypeCode = questionTypeCode;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public String getItemScore() {
		return itemScore;
	}
	public void setItemScore(String itemScore) {
		this.itemScore = itemScore;
	}
	@Override
	public String toString() {
		return "SurveyQuestionDTO [surveyId=" + surveyId + ", questionId=" + questionId + ", questionContent="
				+ questionContent + ", questionTypeCode=" + questionTypeCode + ", itemId=" + itemId + ", itemContent="
				+ itemContent + ", itemScore=" + itemScore + ", getSurveyId()=" + getSurveyId() + ", getQuestionId()="
				+ getQuestionId() + ", getQuestionContent()=" + getQuestionContent() + ", getQuestionTypeCode()="
				+ getQuestionTypeCode() + ", getItemId()=" + getItemId() + ", getItemContent()=" + getItemContent()
				+ ", getItemScore()=" + getItemScore() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
}