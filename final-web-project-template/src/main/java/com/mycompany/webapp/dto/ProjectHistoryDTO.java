package com.mycompany.webapp.dto;


public class ProjectHistoryDTO {
	private int projectId;
	private int participationEmployeeId;
	private String projectStartDate;
	private String projectClosedDate;
	
	public int getProjectId() {
		return projectId;
	}
	public int getParticipationEmployeeId() {
		return participationEmployeeId;
	}
	public String getProjectStartDate() {
		return projectStartDate;
	}
	public String getProjectClosedDate() {
		return projectClosedDate;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public void setParticipationEmployeeId(int participationEmployeeId) {
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
