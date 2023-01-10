package com.mycompany.webapp.dto;

public class SurveyResultDTO {
	private int surveySeq;
	private String raterId;
	private String appraiseeId;
	private int anonymitySeq;
	private int questionSeq;
	private int itemSeq;
	private String answerContent;
	public int getSurveySeq() {
		return surveySeq;
	}
	public String getRaterId() {
		return raterId;
	}
	public String getAppraiseeId() {
		return appraiseeId;
	}
	public int getAnonymitySeq() {
		return anonymitySeq;
	}
	public int getQuestionSeq() {
		return questionSeq;
	}
	public int getItemSeq() {
		return itemSeq;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}
	public void setAppraiseeId(String appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public void setAnonymitySeq(int anonymitySeq) {
		this.anonymitySeq = anonymitySeq;
	}
	public void setQuestionSeq(int questionSeq) {
		this.questionSeq = questionSeq;
	}
	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	@Override
	public String toString() {
		return "SurveyResultDTO [surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", anonymitySeq=" + anonymitySeq + ", questionSeq=" + questionSeq + ", itemSeq=" + itemSeq
				+ ", answerContent=" + answerContent + "]";
	}
	
	
	
	
	
	
}