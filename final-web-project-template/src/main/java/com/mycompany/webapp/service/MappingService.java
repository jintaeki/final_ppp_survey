package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IMappingRepository;
import com.mycompany.webapp.dto.MappingDTO;

@Service
public class MappingService implements IMappingService {

	@Autowired
	IMappingRepository mappingrepository;
	
	@Override
	public void setMapping(int surveyId, int year, int number) {
		mappingrepository.setMapping(surveyId, year, number);
	}

	@Override
	public List<MappingDTO> selectMappingData() {
		return mappingrepository.selectMappingData();
	}

	@Override
	public List<MappingDTO> selectRater(int raterId) {
		return mappingrepository.selectRater(raterId);
	}
	
	@Override
	public void insertAppraiseId(int surveyId, int raterId, int appraiseeId) {
		mappingrepository.insertAppraisee(surveyId, raterId, appraiseeId);
	}

	@Override
	public void  deleteAppraiseId(int raterId, int appraiseeId) {
		mappingrepository.deleteAppriesee(raterId, appraiseeId);
	}

}
