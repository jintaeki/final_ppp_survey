
package com.mycompany.webapp.dto;

public class MappingDTO {
	private int surveySeq;
	private String raterId;
	private String appraiseeId;
	private String surveyCompleteYN;
	public int getSurveySeq() {
		return surveySeq;
	}
	public String getRaterId() {
		return raterId;
	}
	public String getAppraiseeId() {
		return appraiseeId;
	}
	public String getSurveyCompleteYN() {
		return surveyCompleteYN;
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
	public void setSurveyCompleteYN(String surveyCompleteYN) {
		this.surveyCompleteYN = surveyCompleteYN;
	}
	@Override
	public String toString() {
		return "MappingDTO [surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", surveyCompleteYN=" + surveyCompleteYN + "]";
	}

}
