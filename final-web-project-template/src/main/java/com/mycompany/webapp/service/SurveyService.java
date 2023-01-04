package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.ISurveyRepository;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

@Service
public class SurveyService implements ISurveyService{
	
	@Autowired
	ISurveyRepository surveyDao;
	ISurveyService surveyService;
	
	static final Logger logger = LoggerFactory.getLogger(SurveyService.class);

	private static final String sqd= null;
	
	
	@Transactional
	public void setQuestInsert(SurveyQuestionDTO sqd) {
		logger.info("setQuestInsert service: " + sqd );
		sqd.setQuestionId(surveyDao.selectMaxQuestionId()+1);
		logger.info("id가 들어갔니 안갔니 :" + sqd);
		surveyDao.setQuestInsert(sqd);
		logger.info("문제등록");
		surveyService.setItemInsert(sqd);
		logger.info("문항등록");
	}

	@Override
	public int selectMaxQuestionId() {
		return surveyDao.selectMaxQuestionId();
	}

	@Override
	public void setItemInsert(SurveyQuestionDTO sqd) {
		logger.info("setItemInserT: " + sqd);
		sqd.setItemId(surveyDao.selectMaxItemId()+1);
		logger.info("문항 id가 들어갔냐 안갔냐"  + sqd);
		surveyDao.setItemInsert(sqd);
	}

	@Override
	public int selectMaxItemId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void setQuestUpdate(SurveyQuestionDTO SQD) {
		// TODO Auto-generated method stub
		
	}
		
}
