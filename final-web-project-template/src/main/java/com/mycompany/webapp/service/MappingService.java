package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IMappingRepository;
import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PopupDTO;

@Service
public class MappingService implements IMappingService {

	@Autowired
	IMappingRepository mappingrepository;
	
	@Override // 처음 조건대로 매핑하기
	public void setMapping(int surveySeq, int month, int number) {
		mappingrepository.setMapping(surveySeq, month, number);
	}
	
	@Override
	public void updateState(int surveySeq, String stateCode) {
		mappingrepository.updateState(surveySeq, stateCode);
	}
	
	@Override // 매핑 상태 조회
	public String stateCheck(int surveySeq) {
		return mappingrepository.stateCheck(surveySeq);
	}

	@Override
	public void deleteMapping(int surveySeq) {
		mappingrepository.deleteMapping(surveySeq);
	}
	
	@Override // 매핑된 데이터 출력
	public List<PopupDTO> selectMappingData(int surveySeq) {
		return mappingrepository.selectMappingData(surveySeq);
	}
	
	@Override // 추가할 피평가자 검색 병준형
	public List<PopupDTO> getPopup(int surveySeq, String raterId, int month) {
		return mappingrepository.getPopup(surveySeq, raterId, month);
	}
	
	@Override
	public List<PopupDTO> getAnother(int surveySeq){
		return mappingrepository.getAnother(surveySeq);
	}
	
	@Override
	public List<MappingDTO> ovrlpCheck(String raterId, String appraiseeId) {
		return mappingrepository.ovrlpCheck(raterId, appraiseeId);
	}
	
	@Override // 피평가자 추가
	public void insertAppraiseId(int surveySeq, String raterId, String appraiseeId) {
		mappingrepository.insertAppraisee(surveySeq, raterId, appraiseeId);
	}

	@Override // 피평가자 삭제
	public void  deleteAppraisee(int surveySeq, String raterId, String appraiseeId) {
		mappingrepository.deleteAppraisee(surveySeq, raterId, appraiseeId);
	}
}