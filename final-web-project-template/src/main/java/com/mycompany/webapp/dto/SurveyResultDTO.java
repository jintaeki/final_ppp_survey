package com.mycompany.webapp.dto;

public class SurveyResultDTO {
	private String surveySeq;
	private String raterId;
	private String appraiseeId;
	private int anonymitySeq;
	private String questionSeq;
	private String itemSeq;
	private String answerContent;
	
	public String getSurveySeq() {
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
	public String getQuestionSeq() {
		return questionSeq;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setSurveySeq(String surveySeq) {
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
	public void setQuestionSeq(String questionSeq) {
		this.questionSeq = questionSeq;
	}
	public void setItemSeq(String itemSeq) {
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
