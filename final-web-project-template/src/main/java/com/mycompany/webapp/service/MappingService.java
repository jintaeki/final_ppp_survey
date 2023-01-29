package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IMappingRepository;
import com.mycompany.webapp.dto.GradeDTO;
import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;

@Service
public class MappingService implements IMappingService {

	@Autowired
	IMappingRepository mappingrepository;
	
	@Override // 처음 조건대로 매핑하기
	public void setMapping(int surveySeq, int month, int number) {
		mappingrepository.setMapping(surveySeq, month, number);
	}
	
	@Override // 이메일 추가
	public void insertEmail(int surveySeq) {
		mappingrepository.insertEmail(surveySeq);
	}
	
	@Override // SMS 추가
	public void insertSMS(int surveySeq) {
		mappingrepository.insertSMS(surveySeq);
	}
	
	@Override
	public void deleteEmail(int surveySeq) {
		mappingrepository.deleteEmail(surveySeq);
	}
	
	@Override
	public void deleteSMS(int surveySeq) {
		mappingrepository.deleteSMS(surveySeq);
	}
	
	@Override // 매핑 상태 업데이트
	public void updateState(int surveySeq, String stateCode) {
		mappingrepository.updateState(surveySeq, stateCode);
	}
	
	@Override // 매핑 상태 조회
	public String stateCheck(int surveySeq) {
		return mappingrepository.stateCheck(surveySeq);
	}

	@Override // 매핑 삭제
	public void deleteMapping(int surveySeq) {
		mappingrepository.deleteMapping(surveySeq);
	}
	
	@Override // 직급 목록 출력
	public List<GradeDTO> selectGradeList() {
		return mappingrepository.selectGradeList();
	}
	
	@Override // 매핑된 데이터 출력
	public List<PopupDTO> selectMappingData(PagingDTO pagingdto) {
		return mappingrepository.selectMappingData(pagingdto);
	}
	
	@Override // 추가할 피평가자 검색 병준형
	public List<PopupDTO> getPopup(PagingDTO pagingdto) {
		return mappingrepository.getPopup(pagingdto);
	}
	
	@Override // 조건에 상관없는 인원 출력
	public List<PopupDTO> getAnother(PagingDTO pagingdto){
		return mappingrepository.getAnother(pagingdto);
	}
	
	@Override // 중복체크
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