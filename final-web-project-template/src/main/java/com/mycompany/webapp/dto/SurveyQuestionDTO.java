package com.mycompany.webapp.dto;

import java.util.Date;

public class SurveyQuestionDTO {
	//for 문제
	private int surveySeq;
	private int questionSeq;
	private String questionContent;
	private String questionTypeCode;
	
	
	private Date addDate;
	
	//for 문항
	// questionId는 문제와 동일하게 사용
	
	private int itemSeq;
	private String itemContent;
	private String itemScore;
	
	public int getSurveySeq() {
		return surveySeq;
	}
	public int getQuestionSeq() {
		return questionSeq;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public String getQuestionTypeCode() {
		return questionTypeCode;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public void setQuestionSeq(int questionSeq) {
		this.questionSeq = questionSeq;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public void setQuestionTypeCode(String questionTypeCode) {
		this.questionTypeCode = questionTypeCode;
	}
	
	public int getItemSeq() {
		return itemSeq;
	}
	public String getItemContent() {
		return itemContent;
	}
	public String getItemScore() {
		return itemScore;
	}
	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public void setItemScore(String itemScore) {
		this.itemScore = itemScore;
	}
	
	
	
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	@Override
	public String toString() {
		return "SurveyQuestionDTO [surveySeq=" + surveySeq + ", questionSeq=" + questionSeq + ", questionContent="
				+ questionContent + ", questionTypeCode=" + questionTypeCode + ", addDate=" + addDate + ", itemSeq="
				+ itemSeq + ", itemContent=" + itemContent + ", itemScore=" + itemScore + "]";
	}

	
}