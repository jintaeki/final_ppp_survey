package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SurveyListDTO {
	private int surveySeq;
	private String surveyName;
	private String surveyContent;
	private String anonymityCheckCode;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date surveyStartDate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date surveyClosedDate;
	
	private String decideYN;

	public int getSurveySeq() {
		return surveySeq;
	}

	public String getSurveyName() {
		return surveyName;
	}

	public String getSurveyContent() {
		return surveyContent;
	}

	public String getAnonymityCheckCode() {
		return anonymityCheckCode;
	}

	public Date getSurveyStartDate() {
		return surveyStartDate;
	}

	public Date getSurveyClosedDate() {
		return surveyClosedDate;
	}

	public String getDecideYN() {
		return decideYN;
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

	public void setAnonymityCheckCode(String anonymityCheckCode) {
		this.anonymityCheckCode = anonymityCheckCode;
	}

	public void setSurveyStartDate(Date surveyStartDate) {
		this.surveyStartDate = surveyStartDate;
	}

	public void setSurveyClosedDate(Date surveyClosedDate) {
		this.surveyClosedDate = surveyClosedDate;
	}

	public void setDecideYN(String decideYN) {
		this.decideYN = decideYN;
	}

	@Override
	public String toString() {
		return "SurveyListDTO [surveySeq=" + surveySeq + ", surveyName=" + surveyName + ", surveyContent="
				+ surveyContent + ", anonymityCheckCode=" + anonymityCheckCode + ", surveyStartDate=" + surveyStartDate
				+ ", surveyClosedDate=" + surveyClosedDate + ", decideYN=" + decideYN + "]";
	}
	
	
	
}
