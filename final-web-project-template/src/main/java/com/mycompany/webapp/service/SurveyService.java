package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ISurveyRepository;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

@Service
public class SurveyService implements ISurveyService{
	
	@Autowired
	ISurveyRepository surveyDao;	
	
	static final Logger logger = LoggerFactory.getLogger(SurveyService.class);
	
	
	@Override
	public void setQuestInsert(SurveyQuestionDTO sqd) {
		logger.info("setQuestInsert service" + sqd );
		sqd.setQuestionId(surveyDao.selectMaxQuestionId()+1);
		surveyDao.setQuestInsert(sqd);
	}

	@Override
	public int selectMaxQuestionId() {
		return surveyDao.selectMaxQuestionId();
	}

	@Override
	public void setItemInsert(SurveyQuestionDTO sqd) {
		//Logger.info("setItemInsert" + sqd);
		//sqd.setQ
		
	}

	@Override
	public int selectMaxItemId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void setQuestUpdate(SurveyQuestionDTO sqd) {
		// TODO Auto-generated method stub
		
	}
		
}
