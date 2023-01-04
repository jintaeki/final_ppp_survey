package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.SurveyController;
import com.mycompany.webapp.dao.ISurveyRepository;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

@Service
public class SurveyService implements ISurveyService{
	private static final Logger logger = LoggerFactory.getLogger(SurveyService.class);

	@Autowired
	ISurveyRepository ISR;
	
	@Override
	public void setSurvey(SurveyListDTO surveylist) {
		logger.info(surveylist.toString());
		ISR.setSurvey(surveylist);
	}

	@Override
	public void setSurveyUpdate(SurveyListDTO surveylist) {
		ISR.setSurveyUpdate(surveylist);
		
	}

	@Override
	public void setItemUpdate(SurveyQuestionDTO surveyquestion) {
		
		ISR.setItemUpdate(surveyquestion);
		
	}
	
	@Override
	public int selectMaxSurveyId() {
		
		return ISR.selectMaxSurveyId();
		
	}
	

}
