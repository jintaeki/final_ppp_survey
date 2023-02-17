package com.mycompany.webapp.dto;

import java.sql.Date;

public class DTO_for_json2 {
	// 프로젝트 투입 이력
	private String participationEmployeeId;
	private String projectId;
	private Date projectStartDate;
	private Date projectClosedDate;
	
	public String getParticipationEmployeeId() {
		return participationEmployeeId;
	}
	public String getProjectId() {
		return projectId;
	}
	public Date getProjectStartDate() {
		return projectStartDate;
	}
	public Date getProjectClosedDate() {
		return projectClosedDate;
	}
	public void setParticipationEmployeeId(String string) {
		this.participationEmployeeId = string;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public void setProjectStartDate(Date projectStartDate) {
		this.projectStartDate = projectStartDate;
	}
	public void setProjectClosedDate(Date projectClosedDate) {
		this.projectClosedDate = projectClosedDate;
	}
	@Override
	public String toString() {
		return "DTO_for_json2 [participationEmployeeId=" + participationEmployeeId + ", projectId=" + projectId
				+ ", projectStartDate=" + projectStartDate + ", projectClosedDate=" + projectClosedDate + "]";
	}
	
	
	
	
}
