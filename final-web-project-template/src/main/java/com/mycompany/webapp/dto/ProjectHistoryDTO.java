package com.mycompany.webapp.dto;

import java.util.Date;

public class ProjectHistoryDTO {
	private int projectId;
	private int participationEmployeeId;
	private Date projectStartDate;
	private Date projectClosedDate;
	
	
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getParticipationEmployeeId() {
		return participationEmployeeId;
	}
	public void setParticipationEmployeeId(int participationEmployeeId) {
		this.participationEmployeeId = participationEmployeeId;
	}
	public Date getProjectStartDate() {
		return projectStartDate;
	}
	public void setProjectStartDate(Date projectStartDate) {
		this.projectStartDate = projectStartDate;
	}
	public Date getProjectClosedDate() {
		return projectClosedDate;
	}
	public void setProjectClosedDate(Date projectClosedDate) {
		this.projectClosedDate = projectClosedDate;
	}
	@Override
	public String toString() {
		return "ProjectHistoryDTO [projectId=" + projectId + ", participationEmployeeId=" + participationEmployeeId
				+ ", projectStartDate=" + projectStartDate + ", projectClosedDate=" + projectClosedDate
				+ ", getProjectId()=" + getProjectId() + ", getParticipationEmployeeId()="
				+ getParticipationEmployeeId() + ", getProjectStartDate()=" + getProjectStartDate()
				+ ", getProjectClosedDate()=" + getProjectClosedDate() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
