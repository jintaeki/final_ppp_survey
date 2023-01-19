package com.mycompany.webapp.service;

import java.util.List;

<<<<<<< HEAD
import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PopupDTO;

public interface IMappingService {
	// 조건, 데이터 입력 후 메핑
	void setMapping(int surveySeq, int month, int number);
	
	// 상태 코드 변경
	void updateState(int surveySeq, String stateCode);
	
	//설문조사 상태 체크
	String stateCheck(int surveySeq);
	
	// 매핑 삭제
	void deleteMapping(int surveySeq);
	
	// 데이터 리스트 출력
	List<PopupDTO> selectMappingData(int surveySeq);
	
	// 추가할 피평가자 출력 (병준형 버전)
	List<PopupDTO> getPopup(int surveySeq, String raterId, int month);	
	
	// 조건에 제외된 나머지 목록 띄우기
	List<PopupDTO> getAnother(int surveySeq);
	
	// 추가할때 해당 조합이 이미 있는경우 막기
	List<MappingDTO> ovrlpCheck(String raterId, String appraiseeId);
	
	// 선택한 피평가자 저장
	void insertAppraiseId(int surveySeq, String raterId, String appraiseeId);
	
	// 삭제하기 
	void deleteAppraisee(int surveySeq, String raterId, String appraiseeId);

}
=======
import com.mycompany.webapp.dto.PopupDTO;

public interface IMappingService {
	// 조건, 데이터 입력 후 메핑
	void setMapping(int surveySeq, int month, int number);
	
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
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
