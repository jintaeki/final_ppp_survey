package com.mycompany.webapp.dto;

public class SurveyResultDTO {
	private String surveySeq;
	private String raterId;
	private String appraiseeId;
	private int anonymitySeq;
	private String employeeName;
	private String gradeName;
	private int questionTypeCode;
	private String questionContent;
	private String itemContent;
	private int itemScore;
	private String departmentName;
	private String questionSeq;
	private String itemSeq;
	private String answerContent;
	private String raterName;
	private String raterGrade;
	private String raterDepartmentName;
	public String getSurveySeq() {
		return surveySeq;
	}
	public void setSurveySeq(String surveySeq) {
		this.surveySeq = surveySeq;
	}
	public String getRaterId() {
		return raterId;
	}
	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}
	public String getAppraiseeId() {
		return appraiseeId;
	}
	public void setAppraiseeId(String appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public int getAnonymitySeq() {
		return anonymitySeq;
	}
	public void setAnonymitySeq(int anonymitySeq) {
		this.anonymitySeq = anonymitySeq;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public int getQuestionTypeCode() {
		return questionTypeCode;
	}
	public void setQuestionTypeCode(int questionTypeCode) {
		this.questionTypeCode = questionTypeCode;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public int getItemScore() {
		return itemScore;
	}
	public void setItemScore(int itemScore) {
		this.itemScore = itemScore;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getQuestionSeq() {
		return questionSeq;
	}
	public void setQuestionSeq(String questionSeq) {
		this.questionSeq = questionSeq;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getRaterName() {
		return raterName;
	}
	public void setRaterName(String raterName) {
		this.raterName = raterName;
	}
	public String getRaterGrade() {
		return raterGrade;
	}
	public void setRaterGrade(String raterGrade) {
		this.raterGrade = raterGrade;
	}
	public String getRaterDepartmentName() {
		return raterDepartmentName;
	}
	public void setRaterDepartmentName(String raterDepartmentName) {
		this.raterDepartmentName = raterDepartmentName;
	}
	@Override
	public String toString() {
		return "SurveyResultDTO [surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", anonymitySeq=" + anonymitySeq + ", employeeName=" + employeeName + ", gradeName=" + gradeName
				+ ", questionTypeCode=" + questionTypeCode + ", questionContent=" + questionContent + ", itemContent="
				+ itemContent + ", itemScore=" + itemScore + ", departmentName=" + departmentName + ", questionSeq="
				+ questionSeq + ", itemSeq=" + itemSeq + ", answerContent=" + answerContent + ", raterName=" + raterName
				+ ", raterGrade=" + raterGrade + ", raterDepartmentName=" + raterDepartmentName + ", getSurveySeq()="
				+ getSurveySeq() + ", getRaterId()=" + getRaterId() + ", getAppraiseeId()=" + getAppraiseeId()
				+ ", getAnonymitySeq()=" + getAnonymitySeq() + ", getEmployeeName()=" + getEmployeeName()
				+ ", getGradeName()=" + getGradeName() + ", getQuestionTypeCode()=" + getQuestionTypeCode()
				+ ", getQuestionContent()=" + getQuestionContent() + ", getItemContent()=" + getItemContent()
				+ ", getItemScore()=" + getItemScore() + ", getDepartmentName()=" + getDepartmentName()
				+ ", getQuestionSeq()=" + getQuestionSeq() + ", getItemSeq()=" + getItemSeq() + ", getAnswerContent()="
				+ getAnswerContent() + ", getRaterName()=" + getRaterName() + ", getRaterGrade()=" + getRaterGrade()
				+ ", getRaterDepartmentName()=" + getRaterDepartmentName() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}



}