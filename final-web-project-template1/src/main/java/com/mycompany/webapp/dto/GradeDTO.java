package com.mycompany.webapp.dto;

public class GradeDTO {
	private String gradeId;
	private String gradeName;
	private int rank;
	
	public String getGradeId() {
		return gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public int getRank() {
		return rank;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "GradeDTO [gradeId=" + gradeId + ", gradeName=" + gradeName + ", rank=" + rank + "]";
	}
	


}
