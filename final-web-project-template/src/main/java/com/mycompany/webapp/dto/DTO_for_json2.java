package com.mycompany.webapp.dto;

import java.sql.Date;

public class DTO_for_json2 {

	private long projectid;
	private String projectname;
	private String evaluatedid;
	private Date startdate;
	private Date enddate;
	public long getProjectid() {
		return projectid;
	}
	public void setProjectid(long projectid) {
		this.projectid = projectid;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getEvaluatedid() {
		return evaluatedid;
	}
	public void setEvaluatedid(String evaluatedid) {
		this.evaluatedid = evaluatedid;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "DTO_for_json2 [projectid=" + projectid + ", projectname=" + projectname + ", evaluatedid=" + evaluatedid
				+ ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}
	
	
	
}
