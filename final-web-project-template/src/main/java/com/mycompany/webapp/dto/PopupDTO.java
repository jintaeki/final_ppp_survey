package com.mycompany.webapp.dto;

public class PopupDTO {
	private int projectId;		 	// 프로젝트 아이디
	private int gradeId;		    // 직급 아이디
	private int departmentId; 	    // 부서 아이디
	private int surveySeq;	 	    // 설문 아이디
	private int raterId;		    // 평가자 아이디
	private int appraiseeId;	    // 피평가자 아이디
	private String surveyName;      // 설문명
	private String departmentName;  // 부서명
	private String employeeName;    // 이름
	private String gradeName;       // 직급 이름
	
	public int getProjectId() {
		return projectId;
	}
	public int getGradeId() {
		return gradeId;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public int getSurveySeq() {
		return surveySeq;
	}
	public int getRaterId() {
		return raterId;
	}
	public int getAppraiseeId() {
		return appraiseeId;
	}
	public String getSurveyName() {
		return surveyName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public String getGradeName() {
		return gradeName;
	}
	
	@Override
	public String toString() {
		return "PopupDTO [projectId=" + projectId + ", gradeId=" + gradeId + ", departmentId=" + departmentId
				+ ", surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId + ", surveyName="
				+ surveyName + ", departmentName=" + departmentName + ", employeeName=" + employeeName + ", gradeName="
				+ gradeName + "]";
	}

	
}
