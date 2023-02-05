package com.mycompany.webapp.dto;

public class UserInfoDTO {
	private String employeeId;
	private String departmentId;
	private String employeeName;
	private String gradeId;
	private String phone;
	private String email;
	private String managerYN;

	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getManagerYN() {
		return managerYN;
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
