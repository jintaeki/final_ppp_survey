package com.mycompany.webapp.dto;

public class MappingDTO {
	private int surveySeq;
	private int raterId;
	private int appraiseeId;
	private String surveyCompleteCheck;
	public int getSurveySeq() {
		return surveySeq;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
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
		return "MappingDTO [surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", surveyCompleteCheck=" + surveyCompleteCheck + "]";
	}
	
}
