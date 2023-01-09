package com.mycompany.webapp.dto;

public class GradeDTO {
	private int gradeId;
	private String gradeName;
	private int rank;
	
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "GradeDTO [gradeId=" + gradeId + ", gradeName=" + gradeName + ", rank=" + rank + ", getGradeId()="
				+ getGradeId() + ", getGradeName()=" + getGradeName() + ", getRank()=" + getRank() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
