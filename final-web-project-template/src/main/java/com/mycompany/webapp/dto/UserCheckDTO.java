package com.mycompany.webapp.dto;

public class UserCheckDTO {

	private int surveySeq;
	private String surveyName;
	private String surveyContent;
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
	private String password;
	private String gender;
	private String anonymityCheckCode;
	
	public int getSurveySeq() {
		return surveySeq;
	}
	public String getSurveyName() {
		return surveyName;
	}
	public String getSurveyContent() {
		return surveyContent;
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
	public String getPassword() {
		return password;
	}
	public String getGender() {
		return gender;
	}
	public String getAnonymityCheckCode() {
		return anonymityCheckCode;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}
	public void setSurveyContent(String surveyContent) {
		this.surveyContent = surveyContent;
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
	public void setPassword(String password) {
		this.password = password;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setAnonymityCheckCode(String anonymityCheckCode) {
		this.anonymityCheckCode = anonymityCheckCode;
	}
	@Override
	public String toString() {
		return "UserCheckDTO [surveySeq=" + surveySeq + ", surveyName=" + surveyName + ", surveyContent="
				+ surveyContent + ", raterId=" + raterId + ", raterName=" + raterName + ", raterDepartmentName="
				+ raterDepartmentName + ", raterGradeName=" + raterGradeName + ", appraiseeId=" + appraiseeId
				+ ", appraiseeName=" + appraiseeName + ", appraiseeDepartmentName=" + appraiseeDepartmentName
				+ ", appraiseeGradeName=" + appraiseeGradeName + ", surveyCompleteYN=" + surveyCompleteYN + ", email="
				+ email + ", managerYN=" + managerYN + ", anonymitySeq=" + anonymitySeq + ", password=" + password
				+ ", gender=" + gender + ", anonymityCheckCode=" + anonymityCheckCode + "]";
	}
	
	
	
	
}

