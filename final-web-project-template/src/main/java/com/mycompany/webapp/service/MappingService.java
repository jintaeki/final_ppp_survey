package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IMappingRepository;
import com.mycompany.webapp.dto.PopupDTO;

@Service
public class MappingService implements IMappingService {

	@Autowired
	IMappingRepository mappingrepository;
	
	@Override
	public void setMapping(int surveySeq, int year, int number) {
		mappingrepository.setMapping(surveySeq, year, number);
	}
	
	@Override
	public int mappingCheck(int surveySeq) {
		return mappingrepository.mappingCheck(surveySeq);
	}

	@Override
	public List<PopupDTO> selectMappingData(int surveySeq) {
		return mappingrepository.selectMappingData(surveySeq);
	}

	@Override
	public List<PopupDTO> selectRater(String raterId) {
		return mappingrepository.selectRater(raterId);
	}
	
	@Override
	public void insertAppraiseId(int surveySeq, String raterId, String appraiseeId) {
		mappingrepository.insertAppraisee(surveySeq, raterId, appraiseeId);
	}

	@Override
	public void  deleteAppraiseId(String raterId, String appraiseeId) {
		mappingrepository.deleteAppriesee(raterId, appraiseeId);
	}
	
	@Override
	public List<PopupDTO> getPopup() {
		return mappingrepository.getPopup();
	}
}




