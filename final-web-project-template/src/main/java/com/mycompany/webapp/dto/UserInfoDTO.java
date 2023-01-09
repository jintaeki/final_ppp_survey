package com.mycompany.webapp.dto;

public class UserInfoDTO {
	private int employeeId;
	private int departmentId;
	private String employeeName;
	private int gradeId;
	private String phone;
	private String email;
	private String managerYN;
	public int getEmployeeId() {
		return employeeId;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public int getGradeId() {
		return gradeId;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getManagerYN() {
		return managerYN;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setManagerYN(String managerYN) {
		this.managerYN = managerYN;
	}
	@Override
	public String toString() {
		return "UserInfoDTO [employeeId=" + employeeId + ", departmentId=" + departmentId + ", employeeName="
				+ employeeName + ", gradeId=" + gradeId + ", phone=" + phone + ", email=" + email + ", managerYN="
				+ managerYN + "]";
	}
	
	
	
	
	
	
}
