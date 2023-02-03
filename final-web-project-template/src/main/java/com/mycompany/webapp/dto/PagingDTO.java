package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PagingDTO {

		private int surveySeq;
		private int totalRows;		//전체 행수 (페이징 대상이 되는 전체 행의 수)
		private int totalPageNo;	//전체 페이지 수
		private int totalGroupNo;	//전체 그룹 수
		private int startPageNo;	//그룹의 시작 페이지 번호
		private int endPageNo;		//그룹의 끝 페이지 번호
		private int pageNo;			//현재 페이지 번호
		private int pagesPerGroup;	//그룹당 페이지 수
		private int groupNo;		//현재 그룹 번호
		private int rowsPerPage;	//페이지당 행 수
		private int startRowNo;		//페이지의 시작 행 번호(1, ..., n)
		private int startRowIndex;	//페이지의 시작 행 인덱스(0, ..., n-1) for mysql
		private int endRowNo;		//페이지의 마지막 행 번호
		private int endRowIndex;	//페이지의 마지막 행 인덱스
		private String keyword; 	//검색을 위한 변수
		private String keyword2; 	//검색을 위한 변수
		private String anonyMityCheckCode;
		private String selection;	// 검색 선택지 변수
		private String selection2;	// 추가 선택지 변수
		private String selectGD;	// 직급 검색 변수
		private String raterId;		// 매핑 추가를 위한 평가자 id
		private int month;			// 매핑 추가를 위한 날짜 변수
		private int rnum; // 로우넘
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date surveyStartDate;


		public PagingDTO(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo) {
			this.rowsPerPage = rowsPerPage;
			this.pagesPerGroup = pagesPerGroup;
			this.totalRows = totalRows;
			this.pageNo = pageNo;
			if (totalRows == 0) totalRows=1;

			totalPageNo = totalRows / rowsPerPage;
			if(totalRows % rowsPerPage != 0) totalPageNo++;

			totalGroupNo = totalPageNo / pagesPerGroup;
			if(totalPageNo % pagesPerGroup != 0) totalGroupNo++;

			groupNo = (pageNo - 1) / pagesPerGroup + 1;

			startPageNo = (groupNo-1) * pagesPerGroup + 1;

			endPageNo = startPageNo + pagesPerGroup - 1;
			if(groupNo == totalGroupNo) endPageNo = totalPageNo;

			startRowNo = (pageNo - 1) * rowsPerPage + 1;
			startRowIndex = startRowNo - 1;
			endRowNo = pageNo * rowsPerPage;
			endRowIndex = endRowNo - 1;
		}


		public int getSurveySeq() {
			return surveySeq;
		}


		public void setSurveySeq(int surveySeq) {
			this.surveySeq = surveySeq;
		}


		public int getTotalRows() {
			return totalRows;
		}


		public void setTotalRows(int totalRows) {
			this.totalRows = totalRows;
		}


		public int getTotalPageNo() {
			return totalPageNo;
		}


		public void setTotalPageNo(int totalPageNo) {
			this.totalPageNo = totalPageNo;
		}


		public int getTotalGroupNo() {
			return totalGroupNo;
		}


		public void setTotalGroupNo(int totalGroupNo) {
			this.totalGroupNo = totalGroupNo;
		}


		public int getStartPageNo() {
			return startPageNo;
		}


		public void setStartPageNo(int startPageNo) {
			this.startPageNo = startPageNo;
		}


		public int getEndPageNo() {
			return endPageNo;
		}


		public void setEndPageNo(int endPageNo) {
			this.endPageNo = endPageNo;
		}


		public int getPageNo() {
			return pageNo;
		}


		public void setPageNo(int pageNo) {
			this.pageNo = pageNo;
		}


		public int getPagesPerGroup() {
			return pagesPerGroup;
		}


		public void setPagesPerGroup(int pagesPerGroup) {
			this.pagesPerGroup = pagesPerGroup;
		}


		public int getGroupNo() {
			return groupNo;
		}


		public void setGroupNo(int groupNo) {
			this.groupNo = groupNo;
		}


		public int getRowsPerPage() {
			return rowsPerPage;
		}


		public void setRowsPerPage(int rowsPerPage) {
			this.rowsPerPage = rowsPerPage;
		}


		public int getStartRowNo() {
			return startRowNo;
		}


		public void setStartRowNo(int startRowNo) {
			this.startRowNo = startRowNo;
		}


		public int getStartRowIndex() {
			return startRowIndex;
		}


		public void setStartRowIndex(int startRowIndex) {
			this.startRowIndex = startRowIndex;
		}


		public int getEndRowNo() {
			return endRowNo;
		}


		public void setEndRowNo(int endRowNo) {
			this.endRowNo = endRowNo;
		}


		public int getEndRowIndex() {
			return endRowIndex;
		}


		public void setEndRowIndex(int endRowIndex) {
			this.endRowIndex = endRowIndex;
		}


		public String getKeyword() {
			return keyword;
		}


		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}


		public String getKeyword2() {
			return keyword2;
		}


		public void setKeyword2(String keyword2) {
			this.keyword2 = keyword2;
		}


		public String getAnonyMityCheckCode() {
			return anonyMityCheckCode;
		}


		public void setAnonyMityCheckCode(String anonyMityCheckCode) {
			this.anonyMityCheckCode = anonyMityCheckCode;
		}


		public String getSelection() {
			return selection;
		}


		public void setSelection(String selection) {
			this.selection = selection;
		}


		public String getSelection2() {
			return selection2;
		}


		public void setSelection2(String selection2) {
			this.selection2 = selection2;
		}


		public String getSelectGD() {
			return selectGD;
		}


		public void setSelectGD(String selectGD) {
			this.selectGD = selectGD;
		}


		public String getRaterId() {
			return raterId;
		}


		public void setRaterId(String raterId) {
			this.raterId = raterId;
		}


		public int getMonth() {
			return month;
		}


		public void setMonth(int month) {
			this.month = month;
		}


		public int getRnum() {
			return rnum;
		}


		public void setRnum(int rnum) {
			this.rnum = rnum;
		}


		public Date getSurveyStartDate() {
			return surveyStartDate;
		}


		public void setSurveyStartDate(Date surveyStartDate) {
			this.surveyStartDate = surveyStartDate;
		}


		@Override
		public String toString() {
			return "PagingDTO [surveySeq=" + surveySeq + ", totalRows=" + totalRows + ", totalPageNo=" + totalPageNo
					+ ", totalGroupNo=" + totalGroupNo + ", startPageNo=" + startPageNo + ", endPageNo=" + endPageNo
					+ ", pageNo=" + pageNo + ", pagesPerGroup=" + pagesPerGroup + ", groupNo=" + groupNo
					+ ", rowsPerPage=" + rowsPerPage + ", startRowNo=" + startRowNo + ", startRowIndex=" + startRowIndex
					+ ", endRowNo=" + endRowNo + ", endRowIndex=" + endRowIndex + ", keyword=" + keyword + ", keyword2="
					+ keyword2 + ", anonyMityCheckCode=" + anonyMityCheckCode + ", selection=" + selection
					+ ", selection2=" + selection2 + ", selectGD=" + selectGD + ", raterId=" + raterId + ", month="
					+ month + ", rnum=" + rnum + ", surveyStartDate=" + surveyStartDate + "]";
		}

}

