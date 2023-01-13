package com.mycompany.webapp.dto;

public class SurveyItemDTO {
	private int questionSeq;
	private int itemSeq;
	private String itemContent;
	private String itemScore;
	
	public int getQuestionSeq() {
		return questionSeq;
	}
	public int getItemSeq() {
		return itemSeq;
	}
	public String getItemContent() {
		return itemContent;
	}
	public String getItemScore() {
		return itemScore;
	}
	public void setQuestionSeq(int questionSeq) {
		this.questionSeq = questionSeq;
	}
	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public void setItemScore(String itemScore) {
		this.itemScore = itemScore;
	}
	@Override
	public String toString() {
		return "SurveyItemDTO [questionSeq=" + questionSeq + ", itemSeq=" + itemSeq + ", itemContent=" + itemContent
				+ ", itemScore=" + itemScore + "]";
	}
	

}
