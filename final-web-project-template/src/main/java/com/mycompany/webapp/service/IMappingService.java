package com.mycompany.webapp.service;

import java.util.List;

import com.mycompany.webapp.dto.GradeDTO;
import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;

public interface IMappingService {
	// 조건, 데이터 입력 후 메핑
	void setMapping(int surveySeq, int month, int number);
	
	// 메일 데이터 생성
	void insertEmail(int surveySeq);
	
	// SMS 데이터 생성
	void insertSMS(int surveySeq);
	
	// 메일 데이터 삭제
	void deleteEmail(int surveySeq);
			
	// SMS 데이터 삭제
	void deleteSMS(int surveySeq);
	
	// 상태 코드 변경
	void updateState(int surveySeq, String stateCode);
	
	//설문조사 상태 체크
	String stateCheck(int surveySeq);
	
	// 매핑 삭제
	void deleteMapping(int surveySeq);
	
	// 직급 목록 출력
	List<GradeDTO> selectGradeList();
	
	// 데이터 리스트 출력
	List<PopupDTO> selectMappingData(PagingDTO pagingdto);
	
	// 추가할 피평가자 출력 (병준형 버전)
	List<PopupDTO> getPopup(PagingDTO pagingdto);	
	
	// 조건에 제외된 나머지 목록 띄우기
	List<PopupDTO> getAnother(PagingDTO pagingdto);
	
	// 추가할때 해당 조합이 이미 있는경우 막기
	List<MappingDTO> ovrlpCheck(String raterId, String appraiseeId);
	
	// 선택한 피평가자 저장
	void insertAppraisee(int surveySeq, String raterId, String appraiseeId);
	
	// 삭제하기 
	void deleteAppraisee(int surveySeq, String raterId, String appraiseeId);

}