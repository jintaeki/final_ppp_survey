package com.mycompany.webapp.dto;

import java.util.Date;

public class SurveyQuestionDTO {

	//for 문제
	private int surveySeq;
	private int questionSeq;
	private String questionContent;
	private String questionTypeCode;
	private int questionNum;
	private Date addDate;

	//for 문항
	// questionId는 문제와 동일하게 사용

	private int itemSeq;
	private String itemContent;
	private String itemScore;
	private int itemNum;


	public int getSurveySeq() {
		return surveySeq;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public int getQuestionSeq() {
		return questionSeq;
	}
	public void setQuestionSeq(int questionSeq) {
		this.questionSeq = questionSeq;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getQuestionTypeCode() {
		return questionTypeCode;
	}
	public void setQuestionTypeCode(String questionTypeCode) {
		this.questionTypeCode = questionTypeCode;
	}
	public int getQuestionNum() {
		return questionNum;
	}
	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public int getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
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
	public int getItemNum() {
		return itemNum;
	}
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	@Override
	public String toString() {
		return "SurveyQuestionDTO [surveySeq=" + surveySeq + ", questionSeq=" + questionSeq + ", questionContent="
				+ questionContent + ", questionTypeCode=" + questionTypeCode + ", questionNum=" + questionNum
				+ ", addDate=" + addDate + ", itemSeq=" + itemSeq + ", itemContent=" + itemContent + ", itemScore="
				+ itemScore + ", itemNum=" + itemNum + "]";
	}






}