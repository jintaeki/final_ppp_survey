package com.mycompany.webapp.dto;

public class UserInfoDTO {
	private int employeeId;
	private int departmentId;
	private String employeeName;
	private int gradeId;
	private String phone;
	private String email;
	private String managerCheck;
	
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
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
	public String getManagerCheck() {
		return managerCheck;
	}
	public void setManagerCheck(String managerCheck) {
		this.managerCheck = managerCheck;
	}
	@Override
	public String toString() {
		return "UserInfoDTO [employeeId=" + employeeId + ", departmentId=" + departmentId + ", employeeName="
				+ employeeName + ", gradeId=" + gradeId + ", phone=" + phone + ", email=" + email + ", managerCheck="
				+ managerCheck + ", getEmployeeId()=" + getEmployeeId() + ", getDepartmentId()=" + getDepartmentId()
				+ ", getEmployeeName()=" + getEmployeeName() + ", getGradeId()=" + getGradeId() + ", getPhone()="
				+ getPhone() + ", getEmail()=" + getEmail() + ", getManagerCheck()=" + getManagerCheck()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
}
