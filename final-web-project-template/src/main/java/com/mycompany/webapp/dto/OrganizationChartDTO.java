package com.mycompany.webapp.dto;

public class OrganizationChartDTO {
	private int highDepartmentId;
	private int departmentId;
	private String departmentNAME;
	
	
	public int getHighDepartmentId() {
		return highDepartmentId;
	}
	public void setHighDepartmentId(int highDepartmentId) {
		this.highDepartmentId = highDepartmentId;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentNAME() {
		return departmentNAME;
	}
	public void setDepartmentNAME(String departmentNAME) {
		this.departmentNAME = departmentNAME;
	}
	@Override
	public String toString() {
		return "OrganizationChartDTO [highDepartmentId=" + highDepartmentId + ", departmentId=" + departmentId
				+ ", departmentNAME=" + departmentNAME + ", getHighDepartmentId()=" + getHighDepartmentId()
				+ ", getDepartmentId()=" + getDepartmentId() + ", getDepartmentNAME()=" + getDepartmentNAME()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
