<<<<<<< HEAD
<<<<<<< HEAD
package com.mycompany.webapp.dto;

public class PopupDTO {
	private String projectId;		// 프로젝트 아이디
	private String gradeId;		    // 평가자 직급 아이디
	private String departmentId; 	// 평가자 부서 아이디
	private int surveySeq;	 	    // 설문 아이디
	private String raterId;		    // 평가자 아이디
	private String appraiseeId;	    // 피평가자 아이디
	private String projectName;     // 프로젝트 이름
	private String surveyName;      // 설문명
	private String departmentName;  // 피평가자 부서명
	private String raterName;    	// 평가자 이름
	private String appraiseeName;   // 피평가자 이름
	private String gradeName;       // 평가자 직급 이름
	
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public int getSurveySeq() {
		return surveySeq;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public String getRaterId() {
		return raterId;
	}
	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}
	public String getAppraiseeId() {
		return appraiseeId;
	}
	public void setAppraiseeId(String appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getSurveyName() {
		return surveyName;
	}
	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getRaterName() {
		return raterName;
	}
	public void setRaterName(String raterName) {
		this.raterName = raterName;
	}
	public String getAppraiseeName() {
		return appraiseeName;
	}
	public void setAppraiseeName(String appraiseeName) {
		this.appraiseeName = appraiseeName;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
	@Override
	public String toString() {
		return "PopupDTO [projectId=" + projectId + ", gradeId=" + gradeId + ", departmentId=" + departmentId
				+ ", surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", projectName=" + projectName + ", surveyName=" + surveyName + ", departmentName=" + departmentName
				+ ", raterName=" + raterName + ", appraiseeName=" + appraiseeName + ", gradeName=" + gradeName + "]";
	}
=======
package com.mycompany.webapp.dto;

public class PopupDTO {
	private int projectId;		 	// 프로젝트 아이디
	private int gradeId;		    // 직급 아이디
	private int departmentId; 	    // 피평가자 부서 아이디
	private int surveySeq;	 	    // 설문 아이디
	private int raterId;		    // 평가자 아이디
	private int appraiseeId;	    // 피평가자 아이디
	private String surveyName;      // 설문명
	private String departmentName;  // 피평가자 부서명
	private String raterName;    	// 평가자 이름
	private String appraiseeName;   // 피평가자 이름
	private String gradeName;       // 평가자 직급 이름
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public int getSurveySeq() {
		return surveySeq;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public int getRaterId() {
		return raterId;
	}
	public void setRaterId(int raterId) {
		this.raterId = raterId;
	}
	public int getAppraiseeId() {
		return appraiseeId;
	}
	public void setAppraiseeId(int appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public String getSurveyName() {
		return surveyName;
	}
	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getRaterName() {
		return raterName;
	}
	public void setRaterName(String raterName) {
		this.raterName = raterName;
	}
	public String getAppraiseeName() {
		return appraiseeName;
	}
	public void setAppraiseeName(String appraiseeName) {
		this.appraiseeName = appraiseeName;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	@Override
	public String toString() {
		return "PopupDTO [projectId=" + projectId + ", gradeId=" + gradeId + ", departmentId=" + departmentId
				+ ", surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId + ", surveyName="
				+ surveyName + ", departmentName=" + departmentName + ", raterName=" + raterName + ", appraiseeName="
				+ appraiseeName + ", gradeName=" + gradeName + "]";
	}
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
}
=======
package com.mycompany.webapp.dto;

public class PopupDTO {
	private int projectId;		 	// 프로젝트 아이디
	private int gradeId;		    // 직급 아이디
	private int departmentId; 	    // 피평가자 부서 아이디
	private int surveySeq;	 	    // 설문 아이디
	private int raterId;		    // 평가자 아이디
	private int appraiseeId;	    // 피평가자 아이디
	private String surveyName;      // 설문명
	private String departmentName;  // 피평가자 부서명
	private String raterName;    	// 평가자 이름
	private String appraiseeName;   // 피평가자 이름
	private String gradeName;       // 평가자 직급 이름
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public int getSurveySeq() {
		return surveySeq;
	}
	public void setSurveySeq(int surveySeq) {
		this.surveySeq = surveySeq;
	}
	public int getRaterId() {
		return raterId;
	}
	public void setRaterId(int raterId) {
		this.raterId = raterId;
	}
	public int getAppraiseeId() {
		return appraiseeId;
	}
	public void setAppraiseeId(int appraiseeId) {
		this.appraiseeId = appraiseeId;
	}
	public String getSurveyName() {
		return surveyName;
	}
	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getRaterName() {
		return raterName;
	}
	public void setRaterName(String raterName) {
		this.raterName = raterName;
	}
	public String getAppraiseeName() {
		return appraiseeName;
	}
	public void setAppraiseeName(String appraiseeName) {
		this.appraiseeName = appraiseeName;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	@Override
	public String toString() {
		return "PopupDTO [projectId=" + projectId + ", gradeId=" + gradeId + ", departmentId=" + departmentId
				+ ", surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId + ", surveyName="
				+ surveyName + ", departmentName=" + departmentName + ", raterName=" + raterName + ", appraiseeName="
				+ appraiseeName + ", gradeName=" + gradeName + "]";
	}
}
>>>>>>> refs/remotes/origin/cbj2
