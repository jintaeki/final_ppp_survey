package com.mycompany.webapp.dto;


public class ProjectHistoryDTO {
	private String projectId;
	private String participationEmployeeId;
	private String projectStartDate;
	private String projectClosedDate;
	
	public String getProjectId() {
		return projectId;
	}
	public String getParticipationEmployeeId() {
		return participationEmployeeId;
	}
	public String getProjectStartDate() {
		return projectStartDate;
	}
	public String getProjectClosedDate() {
		return projectClosedDate;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public void setParticipationEmployeeId(String participationEmployeeId) {
		this.participationEmployeeId = participationEmployeeId;
	}
	public void setProjectStartDate(String projectStartDate) {
		this.projectStartDate = projectStartDate;
	}
	public void setProjectClosedDate(String projectClosedDate) {
		this.projectClosedDate = projectClosedDate;
	}
	@Override
	public String toString() {
		return "ProjectHistoryDTO [projectId=" + projectId + ", participationEmployeeId=" + participationEmployeeId
				+ ", projectStartDate=" + projectStartDate + ", projectClosedDate=" + projectClosedDate + "]";
	}
	
	
	
		
	
}