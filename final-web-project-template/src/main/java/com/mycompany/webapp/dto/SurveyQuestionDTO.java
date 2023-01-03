package com.mycompany.webapp.dto;

public class SurveyQuestionDTO {
	private int surveyId;
	private int questionId;
	private String questionContent;
	private int questionTypeCode;
	
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
	@Override
	public String toString() {
		return "Survey_QuestionDTO [surveyId=" + surveyId + ", questionId=" + questionId + ", questionContent="
				+ questionContent + ", questionTypeCode=" + questionTypeCode + ", getSurveyId()=" + getSurveyId()
				+ ", getQuestionId()=" + getQuestionId() + ", getQuestionContent()=" + getQuestionContent()
				+ ", getQuestionTypeCode()=" + getQuestionTypeCode() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}