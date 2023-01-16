package com.mycompany.webapp.dto;

public class DTO_for_json3 {

	private String ratioid;
	private long surveyid;
	private long projectid;
	private String evaluatedid;
	public String getRatioid() {
		return ratioid;
	}
	public void setRatioid(String ratioid) {
		this.ratioid = ratioid;
	}
	public long getSurveyid() {
		return surveyid;
	}
	public void setSurveyid(long surveyid) {
		this.surveyid = surveyid;
	}
	public long getProjectid() {
		return projectid;
	}
	public void setProjectid(long projectid) {
		this.projectid = projectid;
	}
	public String getEvaluatedid() {
		return evaluatedid;
	}
	public void setEvaluatedid(String evaluatedid) {
		this.evaluatedid = evaluatedid;
	}
	@Override
	public String toString() {
		return "DTO_for_json3 [ratioid=" + ratioid + ", surveyid=" + surveyid + ", projectid=" + projectid
				+ ", evaluatedid=" + evaluatedid + "]";
	}
	
	
	
}
