package com.mycompany.webapp.dto;

public class UserCheckDTO {

	private int surveySeq;
	private String surveyName;
	private String raterId;
	private String raterName;
	private String appraiseeId;
	private String appraiseeName;
	private String surveyCompleteYN;
	private String email;
	private String managerYN;
	
	public int getSurveySeq() {
		return surveySeq;
	}
	public String getSurveyName() {
		return surveyName;
	}
	public String getRaterId() {
		return raterId;
	}
	public String getRaterName() {
		return raterName;
	}
	public String getAppraiseeId() {
		return appraiseeId;
	}
	public String getAppraiseeName() {
		return appraiseeName;
	}
	public String getSurveyCompleteYN() {
		return surveyCompleteYN;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}
	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}
	public void setRaterName(String raterName) {
		this.raterName = raterName;
	}
	public void setAppraiseeId(String appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public void setAppraiseeName(String appraiseeName) {
		this.appraiseeName = appraiseeName;
	}
	public void setSurveyCompleteYN(String surveyCompleteYN) {
		this.surveyCompleteYN = surveyCompleteYN;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getManagerYN() {
		return managerYN;
	}
	public void setManagerYN(String managerYN) {
		this.managerYN = managerYN;
	}
	
	@Override
	public String toString() {
		return "UserCheckDTO [surveySeq=" + surveySeq + ", surveyName=" + surveyName + ", raterId=" + raterId
				+ ", raterName=" + raterName + ", appraiseeId=" + appraiseeId + ", appraiseeName=" + appraiseeName
				+ ", surveyCompleteYN=" + surveyCompleteYN + ", email=" + email + ", managerYN=" + managerYN + "]";
	}
	
	
	
	
	
	
}
