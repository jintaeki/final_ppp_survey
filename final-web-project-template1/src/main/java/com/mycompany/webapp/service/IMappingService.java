package com.mycompany.webapp.service;

import java.util.List;

import com.mycompany.webapp.dto.PopupDTO;

public interface IMappingService {
	// 조건, 데이터 입력 후 메핑
	void setMapping(int surveySeq, int month, int number);
	
	// 설문 화면 왼쪽 그리드 (평가 대상 출력)
	List<PopupDTO> selectSurveyMapping(int surveySeq, int raterId);
	
	// 설문조사 중복 체크
	int mappingCheck(int surveySeq);
	
	// 데이터 리스트 출력
	List<PopupDTO> selectMappingData(int surveySeq);
	
	// 추가할 피평가자 출력 (병준형 버전)
	List<PopupDTO> getPopup(int surveySeq, String raterId, int month);	
	
	// 선택한 피평가자 저장
	void insertAppraiseId(int surveySeq, String raterId, String appraiseeId);
	
	// 삭제하기 
	void deleteAppraisee(int surveySeq, String raterId, String appraiseeId);

}
