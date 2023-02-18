package com.mycompany.webapp.dto;
import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
public class SampleDefaultVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	/** 검색조건 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

	/*등록연월 검색*/
	private String searchRegDate = "";

	/*처리상태 검색*/
	private String searchProcessCode = "";

	/*사용내역 검색*/
	private String searchUseCode = "";



	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 *//*
	private int pageUnit = 10;
	*//** 페이지사이즈 *//*
	private int pageSize = 10;*/

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 1000000000;








	public String getSearchUseCode() {
		return searchUseCode;
	}

	public void setSearchUseCode(String searchUseCode) {
		this.searchUseCode = searchUseCode;
	}

	public String getSearchProcessCode() {
		return searchProcessCode;
	}

	public void setSearchProcessCode(String searchProcessCode) {
		this.searchProcessCode = searchProcessCode;
	}

	public String getSearchRegDate() {
		return searchRegDate;
	}

	public void setSearchRegDate(String searchRegDate) {
		this.searchRegDate = searchRegDate;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	/*public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}*/

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
