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
		private String selection;	// 검색 선택지 변수
		private String selectGD;	// 직급 검색 변수
		private String raterId;		// 매핑 추가를 위한 평가자 id
		private int month;			// 매핑 추가를 위한 날짜 변수

		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date surveyStartDate;


		public PagingDTO(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo) {
			this.rowsPerPage = rowsPerPage;
			this.pagesPerGroup = pagesPerGroup;
			this.totalRows = totalRows;
			this.pageNo = pageNo;

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

		public int getTotalRows() {
			return totalRows;
		}

		public int getTotalPageNo() {
			return totalPageNo;
		}

		public int getTotalGroupNo() {
			return totalGroupNo;
		}

		public int getStartPageNo() {
			return startPageNo;
		}

		public int getEndPageNo() {
			return endPageNo;
		}

		public int getPageNo() {
			return pageNo;
		}

		public int getPagesPerGroup() {
			return pagesPerGroup;
		}

		public int getGroupNo() {
			return groupNo;
		}

		public int getRowsPerPage() {
			return rowsPerPage;
		}

		public int getStartRowNo() {
			return startRowNo;
		}

		public int getStartRowIndex() {
			return startRowIndex;
		}

		public int getEndRowNo() {
			return endRowNo;
		}

		public int getEndRowIndex() {
			return endRowIndex;
		}

		public int getSurveySeq() {
			return surveySeq;
		}

		public void setSurveySeq(int surveySeq) {
			this.surveySeq = surveySeq;
		}

		public String getKeyword() {
			return keyword;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}

		public String getSelection() {
			return selection;
		}
		public String getSelectGD() {
			return selectGD;
		}
		
		public String getRaterId() {
			return raterId;
		}
		public int getMonth() {
			return month;
		}

		public void setSelection(String selection) {
			this.selection = selection;
		}
		
		public void setSelectGD(String selectGD) {
			this.selectGD = selectGD;
		}
		
		public void setRaterId(String raterId) {
			this.raterId = raterId;
		}
		
		public void setMonth(int month) {
			this.month = month;
		}

		public void setPageNo(int pageNo) {
			this.pageNo = pageNo;
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
					+ ", endRowNo=" + endRowNo + ", endRowIndex=" + endRowIndex + ", keyword=" + keyword
					+ ", selection=" + selection + ", selectGD=" + selectGD + ", raterId=" + raterId + ", month=" + month
					+ ", surveyStartDate=" + surveyStartDate + "]";
		}
		
}

