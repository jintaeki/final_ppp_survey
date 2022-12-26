package com.mycompany.webapp.dto;

public class DTO_for_json {

	private String ratioid;
	private String classes;
	private  String email;
	private  String name;
	private  String phone;
	private  long departmentid;
	private  long managerid;
	public String getRatioid() {
		return ratioid;
	}
	public void setRatioid(String ratioid) {
		this.ratioid = ratioid;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public long getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(long departmentid) {
		this.departmentid = departmentid;
	}
	public long getManagerid() {
		return managerid;
	}
	public void setManagerid(long managerid) {
		this.managerid = managerid;
	}
	@Override
	public String toString() {
		return "DTO_for_json [ratioid=" + ratioid + ", classes=" + classes + ", email=" + email + ", name=" + name
				+ ", phone=" + phone + ", departmentid=" + departmentid + ", managerid=" + managerid + "]";
	}
	
	
	
}
