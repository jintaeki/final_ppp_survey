package com.mycompany.webapp.dao;

import com.mycompany.webapp.dto.GradeDTO;
import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IMappingRepository {
	// 설문조사 팝업창의 조건을 받아 매핑데이터에 선택
	void setMapping(@Param("surveySeq") int surveySeq, @Param("month") int month, @Param("number") int number);
	
	// 메일 데이터 생성
	void insertEmail(@Param("surveySeq") int surveySeq);
	
	// SMS 데이터 생성
	void insertSMS(@Param("surveySeq") int surveySeq);
	
	// 메일 데이터 삭제
	void deleteEmail(@Param("surveySeq") int surveySeq);
		
	// SMS 데이터 삭제
	void deleteSMS(@Param("surveySeq") int surveySeq);
		
	// 상태 코드 변경
	void updateState(@Param("surveySeq") int surveySeq, @Param("stateCode") String stateCode);
	
	// 상태 코드 조회
	String stateCheck(@Param("surveySeq") int surveySeq);
	
	// 매핑 삭제
	void deleteMapping(@Param("surveySeq") int surveySeq);
	
	// 매핑된 데이터를 출력
	List<PopupDTO> selectMappingData(PagingDTO pagingdto);
	
	// 검색용 직급 목록 출력
	List<GradeDTO> selectGradeList();
	
	// 랜덤에 제외된 나머지 목록 띄우기
	List<PopupDTO> getPopup(PagingDTO pagingdto);
	
	// 조건에 제외된 나머지 목록 띄우기
	List<PopupDTO> getAnother(PagingDTO pagingdto);
	
	// 데이터중 현재 시행되고 있는 설문지의 사람 제외 
	List<MappingDTO> ovrlpCheck(@Param("raterId") String raterId, @Param("appraiseeId") String appraiseeId);
	
	// 위에 선택된 피평가자를 데이터를 저장 
	void insertAppraisee(@Param("surveySeq") int surveySeq, @Param("raterId") String raterId, @Param("appraiseeId") String appraiseeId);
	
	// 피평가자를 피평가자 목록에서 제외
	void deleteAppraisee(@Param("surveySeq") int surveySeq, @Param("raterId") String raterId, @Param("appraiseeId") String appraiseeId);
	
	

}