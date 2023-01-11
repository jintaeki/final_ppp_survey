
package com.mycompany.webapp.dao;

import com.mycompany.webapp.dto.PopupDTO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IMappingRepository {
	// 설문조사 팝업창의 조건을 받아 메핑데이터에 선택
	void setMapping(@Param("surveySeq") int surveySeq, @Param("year") int year, @Param("number") int number);
	
	// 중복 확인
	int mappingCheck(@Param("surveySeq") int surveySeq);
	
	// 메핑된 데이터를 화면에 랜덤으로 조건에 맞게 출력
	List<PopupDTO> selectMappingData(@Param("surveySeq") int surveySeq);
	
	// 병준형
	List<PopupDTO> getPopup();// 전체 리스트 출력

	// 해당 평가자를 눌러 해당 평가자가 평가할 수 있지만 제외된 피평가자를 포함 전체 목록 팝업창에 뛰우기
	List<PopupDTO> selectRater(String raterId);
	
	// 위에 선택된 피평가자를 데이터를 저장 
	void insertAppraisee(int surveySeq, String raterId, String appraiseeId);
	
	// 피평가자를 피평가자 목록에서 제외
	void deleteAppriesee(String raterId, String appraiseeId);
	
	
}

