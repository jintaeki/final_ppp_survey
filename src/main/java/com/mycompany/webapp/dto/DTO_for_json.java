package com.mycompany.webapp.dto;

public class DTO_for_json {

	// 조직조
	
	private long highDepartmentId;
	private long departmentId;
	private String departmentName;
	
	public long getHighDepartmentId() {
		return highDepartmentId;
	}
	public long getDepartmentId() {
		return departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setHighDepartmentId(long highDepartmentId) {
		this.highDepartmentId = highDepartmentId;
	}
	public void setDepartmentId(long departmentId) {
		this.departmentId = departmentId;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	@Override
	public String toString() {
		return "DTO_for_json [highDepartmentId=" + highDepartmentId + ", departmentId=" + departmentId
				+ ", departmentName=" + departmentName + "]";
	}
	
	
	
}
