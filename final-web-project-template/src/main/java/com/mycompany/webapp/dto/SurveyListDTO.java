package com.mycompany.webapp.dto;

import java.util.Date;

public class SurveyListDTO {
	private int surveyId;
	private String surveyName;
	private String surveyContent;
	private int anonymityCheckDate;
	private Date surveyStartDate;
	private Date surveyClosedDate;
	private String decideCheck;
	
	public int getSurveyId() {
		return surveyId;
	}
	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}
	public String getSurveyName() {
		return surveyName;
	}
	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}
	public String getSurveyContent() {
		return surveyContent;
	}
	public void setSurveyContent(String surveyContent) {
		this.surveyContent = surveyContent;
	}
	public int getAnonymityCheckDate() {
		return anonymityCheckDate;
	}
	public void setAnonymityCheckDate(int anonymityCheckDate) {
		this.anonymityCheckDate = anonymityCheckDate;
	}
	public Date getSurveyStartDate() {
		return surveyStartDate;
	}
	public void setSurveyStartDate(Date surveyStartDate) {
		this.surveyStartDate = surveyStartDate;
	}
	public Date getSurveyClosedDate() {
		return surveyClosedDate;
	}
	public void setSurveyClosedDate(Date surveyClosedDate) {
		this.surveyClosedDate = surveyClosedDate;
	}
	public String getDecideCheck() {
		return decideCheck;
	}
	public void setDecideCheck(String decideCheck) {
		this.decideCheck = decideCheck;
	}
	
	@Override
	public String toString() {
		return "SurveyList [surveyId=" + surveyId + ", surveyName=" + surveyName + ", surveyContent=" + surveyContent
				+ ", anonymityCheckDate=" + anonymityCheckDate + ", surveyStartDate=" + surveyStartDate
				+ ", surveyClosedDate=" + surveyClosedDate + ", decideCheck=" + decideCheck + ", getSurveyId()="
				+ getSurveyId() + ", getSurveyName()=" + getSurveyName() + ", getSurveyContent()=" + getSurveyContent()
				+ ", getAnonymityCheckDate()=" + getAnonymityCheckDate() + ", getSurveyStartDate()="
				+ getSurveyStartDate() + ", getSurveyClosedDate()=" + getSurveyClosedDate() + ", getDecideCheck()="
				+ getDecideCheck() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
