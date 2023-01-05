package com.mycompany.webapp.dto;

public class SurveyQuestionDTO {
	//for 문제
	private int surveyId;
	private int questionId;
	private String questionContent;
	private String questionTypeCode;
	
	//for 문항
	// questionId는 문제와 동일하게 사용
	private int itemId;
	private String itemContent;
	private String itemScore;
	
	public int getSurveyId() {
		return surveyId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public String getQuestionTypeCode() {
		return questionTypeCode;
	}
	public int getItemId() {
		return itemId;
	}
	public String getItemContent() {
		return itemContent;
	}
	public String getItemScore() {
		return itemScore;
	}
	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public void setQuestionTypeCode(String questionTypeCode) {
		this.questionTypeCode = questionTypeCode;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;

	}
	public void setItemScore(String itemScore) {
		this.itemScore = itemScore;
	}
	@Override
	public String toString() {
		return "SurveyQuestionDTO [surveyId=" + surveyId + ", questionId=" + questionId + ", questionContent="
				+ questionContent + ", questionTypeCode=" + questionTypeCode + ", itemId=" + itemId + ", itemContent="
				+ itemContent + ", itemScore=" + itemScore + "]";

				
	}
	
	
	
	
	
}