package com.mycompany.webapp.dto;

public class UserCheckDTO {

	private int surveySeq;
	private String surveyName;
	private String raterId;
	private String raterName;
	private String raterDepartmentName;
	private String raterGradeName;
	private String appraiseeId;
	private String appraiseeName;
	private String appraiseeDepartmentName;
	private String appraiseeGradeName;
	private String surveyCompleteYN;
	private String email;
	private String managerYN;
	private String anonymitySeq;
	
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
	public String getRaterDepartmentName() {
		return raterDepartmentName;
	}
	public String getRaterGradeName() {
		return raterGradeName;
	}
	public String getAppraiseeId() {
		return appraiseeId;
	}
	public String getAppraiseeName() {
		return appraiseeName;
	}
	public String getAppraiseeDepartmentName() {
		return appraiseeDepartmentName;
	}
	public String getAppraiseeGradeName() {
		return appraiseeGradeName;
	}
	public String getSurveyCompleteYN() {
		return surveyCompleteYN;
	}
	public String getEmail() {
		return email;
	}
	public String getManagerYN() {
		return managerYN;
	}
	public String getAnonymitySeq() {
		return anonymitySeq;
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
	public void setRaterDepartmentName(String raterDepartmentName) {
		this.raterDepartmentName = raterDepartmentName;
	}
	public void setRaterGradeName(String raterGradeName) {
		this.raterGradeName = raterGradeName;
	}
	public void setAppraiseeId(String appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public void setAppraiseeName(String appraiseeName) {
		this.appraiseeName = appraiseeName;
	}
	public void setAppraiseeDepartmentName(String appraiseeDepartmentName) {
		this.appraiseeDepartmentName = appraiseeDepartmentName;
	}
	public void setAppraiseeGradeName(String appraiseeGradeName) {
		this.appraiseeGradeName = appraiseeGradeName;
	}
	public void setSurveyCompleteYN(String surveyCompleteYN) {
		this.surveyCompleteYN = surveyCompleteYN;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setManagerYN(String managerYN) {
		this.managerYN = managerYN;
	}
	public void setAnonymitySeq(String anonymitySeq) {
		this.anonymitySeq = anonymitySeq;
	}
	
	@Override
	public String toString() {
		return "UserCheckDTO [surveySeq=" + surveySeq + ", surveyName=" + surveyName + ", raterId=" + raterId
				+ ", raterName=" + raterName + ", raterDepartmentName=" + raterDepartmentName + ", raterGradeName="
				+ raterGradeName + ", appraiseeId=" + appraiseeId + ", appraiseeName=" + appraiseeName
				+ ", appraiseeDepartmentName=" + appraiseeDepartmentName + ", appraiseeGradeName=" + appraiseeGradeName
				+ ", surveyCompleteYN=" + surveyCompleteYN + ", email=" + email + ", managerYN=" + managerYN
				+ ", anonymitySeq=" + anonymitySeq + "]";
	}
	
	
	
	
	
	
	
}
