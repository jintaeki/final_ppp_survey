package com.mycompany.webapp.dto;

public class MappingDTO {
	private int surveySeq;
	private int raterId;
	private int appraiseeId;
	private String surveyCompleteYN;
	
	public int getSurveySeq() {
		return surveySeq;
	}
	public int getRaterId() {
		return raterId;
	}
	public int getAppraiseeId() {
		return appraiseeId;
	}
	public String getSurveyCompleteYN() {
		return surveyCompleteYN;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public void setRaterId(int raterId) {
		this.raterId = raterId;
	}
	public void setAppraiseeId(int appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public void setSurveyCompleteYN(String surveyCompleteYN) {
		this.surveyCompleteYN = surveyCompleteYN;
	}
	@Override
	public String toString() {
		return "MappingDTO [surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", surveyCompleteYN=" + surveyCompleteYN + "]";
	}
	
	

	
}
