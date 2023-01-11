package com.mycompany.webapp.dto;

public class ProjectDTO {
	private String projectId;
	private String projectName;
	public String getProjectId() {
		return projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	@Override
	public String toString() {
		return "ProjectDTO [projectId=" + projectId + ", projectName=" + projectName + "]";
	}
	

}
