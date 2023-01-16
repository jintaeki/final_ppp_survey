package com.mycompany.webapp.dto;

public class CommonDTO {
	private String codeId;
	private String codeName;
	private String codeDetailId;
	private String codeDetailName;
	
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeDetailId() {
		return codeDetailId;
	}
	public void setCodeDetailId(String codeDetailId) {
		this.codeDetailId = codeDetailId;
	}
	public String getCodeDetailName() {
		return codeDetailName;
	}
	public void setCodeDetailName(String codeDetailName) {
		this.codeDetailName = codeDetailName;
	}
	
	@Override
	public String toString() {
		return "CommonDTO [codeId=" + codeId + ", codeName=" + codeName + ", codeDetailId=" + codeDetailId
				+ ", codeDetailName=" + codeDetailName + "]";
	}

	
	
}
