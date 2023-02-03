package com.mycompany.webapp.dto;

public class SurveyResultDTO {
	private String surveySeq;
	private String raterId;
	private String appraiseeId;
	private String anonymitySeq;
	private String employeeName;
	private String gradeName;
	private int questionTypeCode;
	private String questionContent;
	private String itemContent;
	private int itemScore;
	private String departmentName;
	private String questionSeq;
	private String itemSeq;
	private String answerContent;
	private String anonymityCode;
	private String raterName;
	private String raterGrade;
	private String raterDepartmentName;
	private String questionType;

	//설문 통계용
	private int score; //총점수
	private String grd; //등급
	private int max; //설문지 내 최고점
	private float avg; //설문지 내 평균
	private int min; //설문지 내 최저점

	private String rnum;

	public String getSurveySeq() {
		return surveySeq;
	}

	public void setSurveySeq(String surveySeq) {
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

	public String getAnonymitySeq() {
		return anonymitySeq;
	}

	public void setAnonymitySeq(String anonymitySeq) {
		this.anonymitySeq = anonymitySeq;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getQuestionTypeCode() {
		return questionTypeCode;
	}

	public void setQuestionTypeCode(int questionTypeCode) {
		this.questionTypeCode = questionTypeCode;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getItemContent() {
		return itemContent;
	}

	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}

	public int getItemScore() {
		return itemScore;
	}

	public void setItemScore(int itemScore) {
		this.itemScore = itemScore;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getQuestionSeq() {
		return questionSeq;
	}

	public void setQuestionSeq(String questionSeq) {
		this.questionSeq = questionSeq;
	}

	public String getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnonymityCode() {
		return anonymityCode;
	}

	public void setAnonymityCode(String anonymityCode) {
		this.anonymityCode = anonymityCode;
	}

	public String getRaterName() {
		return raterName;
	}

	public void setRaterName(String raterName) {
		this.raterName = raterName;
	}

	public String getRaterGrade() {
		return raterGrade;
	}

	public void setRaterGrade(String raterGrade) {
		this.raterGrade = raterGrade;
	}

	public String getRaterDepartmentName() {
		return raterDepartmentName;
	}

	public void setRaterDepartmentName(String raterDepartmentName) {
		this.raterDepartmentName = raterDepartmentName;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getGrd() {
		return grd;
	}

	public void setGrd(String grd) {
		this.grd = grd;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public float getAvg() {
		return avg;
	}

	public void setAvg(float avg) {
		this.avg = avg;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "SurveyResultDTO [surveySeq=" + surveySeq + ", raterId=" + raterId + ", appraiseeId=" + appraiseeId
				+ ", anonymitySeq=" + anonymitySeq + ", employeeName=" + employeeName + ", gradeName=" + gradeName
				+ ", questionTypeCode=" + questionTypeCode + ", questionContent=" + questionContent + ", itemContent="
				+ itemContent + ", itemScore=" + itemScore + ", departmentName=" + departmentName + ", questionSeq="
				+ questionSeq + ", itemSeq=" + itemSeq + ", answerContent=" + answerContent + ", anonymityCode="
				+ anonymityCode + ", raterName=" + raterName + ", raterGrade=" + raterGrade + ", raterDepartmentName="
				+ raterDepartmentName + ", questionType=" + questionType + ", score=" + score + ", grd=" + grd
				+ ", max=" + max + ", avg=" + avg + ", min=" + min + ", rnum=" + rnum + ", getSurveySeq()="
				+ getSurveySeq() + ", getRaterId()=" + getRaterId() + ", getAppraiseeId()=" + getAppraiseeId()
				+ ", getAnonymitySeq()=" + getAnonymitySeq() + ", getEmployeeName()=" + getEmployeeName()
				+ ", getGradeName()=" + getGradeName() + ", getQuestionTypeCode()=" + getQuestionTypeCode()
				+ ", getQuestionContent()=" + getQuestionContent() + ", getItemContent()=" + getItemContent()
				+ ", getItemScore()=" + getItemScore() + ", getDepartmentName()=" + getDepartmentName()
				+ ", getQuestionSeq()=" + getQuestionSeq() + ", getItemSeq()=" + getItemSeq() + ", getAnswerContent()="
				+ getAnswerContent() + ", getAnonymityCode()=" + getAnonymityCode() + ", getRaterName()="
				+ getRaterName() + ", getRaterGrade()=" + getRaterGrade() + ", getRaterDepartmentName()="
				+ getRaterDepartmentName() + ", getQuestionType()=" + getQuestionType() + ", getScore()=" + getScore()
				+ ", getGrd()=" + getGrd() + ", getMax()=" + getMax() + ", getAvg()=" + getAvg() + ", getMin()="
				+ getMin() + ", getRnum()=" + getRnum() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}



}
