package com.mycompany.webapp.dto;

public class MappingDTO {
	private int surveyId;
	private int raterId;
	private int appraiseeId;
	private String surveyCompleteCheck;
	
	
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
	public String getSurveyCompleteCheck() {
		return surveyCompleteCheck;
	}
	public void setSurveyCompleteCheck(String surveyCompleteCheck) {
		this.surveyCompleteCheck = surveyCompleteCheck;
	}
	@Override
	public String toString() {
		return "MappingDTO [surveyId=" + surveyId + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", surveyCompleteCheck=" + surveyCompleteCheck + ", getSurveyId()=" + getSurveyId()
				+ ", getRaterId()=" + getRaterId() + ", getAppraiseeId()=" + getAppraiseeId()
				+ ", getSurveyCompleteCheck()=" + getSurveyCompleteCheck() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
