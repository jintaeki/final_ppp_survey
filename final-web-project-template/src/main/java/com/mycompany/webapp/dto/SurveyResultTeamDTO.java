package com.mycompany.webapp.dto;

public class SurveyResultTeamDTO {
	private int score;
	private String departmentName;
	private String employeeName;
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
	@Override
	public String toString() {
		return "SurveyResultTeamDTO [score=" + score + ", departmentName=" + departmentName + ", employeeName="
				+ employeeName + "]";
	}
}
