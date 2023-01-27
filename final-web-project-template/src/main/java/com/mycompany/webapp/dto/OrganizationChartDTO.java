package com.mycompany.webapp.dto;

public class OrganizationChartDTO {
	private String highDepartmentId;
	private String departmentId;
	private String departmentName;
	
	public String getHighDepartmentId() {
		return highDepartmentId;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setHighDepartmentId(String highDepartmentId) {
		this.highDepartmentId = highDepartmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public void setDepartmentNAME(String departmentName) {
		this.departmentName = departmentName;
	}
	@Override
	public String toString() {
		return "OrganizationChartDTO [highDepartmentId=" + highDepartmentId + ", departmentId=" + departmentId
				+ ", departmentName=" + departmentName + "]";
	}
	
	
	
	
	
}
