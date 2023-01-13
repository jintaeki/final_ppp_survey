package com.mycompany.webapp.dto;

public class OrganizationChartDTO {
	private String highDepartmentId;
	private String departmentId;
	private String departmentNAME;
	
	public String getHighDepartmentId() {
		return highDepartmentId;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public String getDepartmentNAME() {
		return departmentNAME;
	}
	public void setHighDepartmentId(String highDepartmentId) {
		this.highDepartmentId = highDepartmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public void setDepartmentNAME(String departmentNAME) {
		this.departmentNAME = departmentNAME;
	}
	@Override
	public String toString() {
		return "OrganizationChartDTO [highDepartmentId=" + highDepartmentId + ", departmentId=" + departmentId
				+ ", departmentNAME=" + departmentNAME + "]";
	}
	
	
	
	
	
}
