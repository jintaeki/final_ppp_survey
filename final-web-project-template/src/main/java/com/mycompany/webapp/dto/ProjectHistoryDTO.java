package com.mycompany.webapp.dto;

public class ProjectHistoryDTO {
	private String projectId;
	private String participationEmployeeId;
	
	public String getProjectId() {
		return projectId;
	}
	public String getParticipationEmployeeId() {
		return participationEmployeeId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public void setParticipationEmployeeId(String participationEmployeeId) {
		this.participationEmployeeId = participationEmployeeId;
	}
	@Override
	public String toString() {
		return "ProjectHistoryDTO [projectId=" + projectId + ", participationEmployeeId=" + participationEmployeeId + "]";
	}
}
