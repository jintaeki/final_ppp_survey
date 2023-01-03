package com.mycompany.webapp.dto;

public class SurveyItemDTO {
	private int questonId;
	private int itemId;
	private String itemContent;
	private String itemScore;
	
	public int getQuestonId() {
		return questonId;
	}
	public void setQuestonId(int questonId) {
		this.questonId = questonId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public String getItemScore() {
		return itemScore;
	}
	public void setItemScore(String itemScore) {
		this.itemScore = itemScore;
	}
	
	@Override
	public String toString() {
		return "SurveyItem [questonId=" + questonId + ", itemId=" + itemId + ", itemContent=" + itemContent
				+ ", itemScore=" + itemScore + ", getQuestonId()=" + getQuestonId() + ", getItemId()=" + getItemId()
				+ ", getItemContent()=" + getItemContent() + ", getItemScore()=" + getItemScore() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
