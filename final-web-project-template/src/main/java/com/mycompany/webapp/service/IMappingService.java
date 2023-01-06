package com.mycompany.webapp.service;

import java.util.List;

import com.mycompany.webapp.dto.MappingDTO;

public interface IMappingService {
	// 조건, 데이터 입력 후 메핑
	void setMapping(int surveyId, int year, int number);
	
	// 데이터 리스트 출력
	List<MappingDTO> selectMappingData();
	
	// 추가할 피평가자 출력
	List<MappingDTO> selectRater(int raterId);
	
	// 선택한 피평가자 저장
	void insertAppraiseId(int surveyId, int raterId, int appraiseeId);
	
	// 삭제하기 
	void deleteAppraiseId(int raterId, int appraiseeId);
}
	