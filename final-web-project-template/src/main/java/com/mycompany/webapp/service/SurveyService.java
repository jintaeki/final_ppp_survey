package com.mycompany.webapp.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.ISurveyRepository;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

@Service
public class SurveyService implements ISurveyService{
	private static final Logger logger = LoggerFactory.getLogger(SurveyService.class);

	@Autowired
	ISurveyRepository surveyDao;
	
	@Override
	public void setSurvey(SurveyListDTO surveylist) {
		surveyDao.setSurvey(surveylist);
		logger.info(surveylist.toString());

	}

	@Override
	public void setSurveyUpdate(SurveyListDTO surveylist) {
		surveyDao.setSurveyUpdate(surveylist);
		
	}

	@Override
	public void setItemUpdate(SurveyQuestionDTO surveyquestion) {
		
		surveyDao.setItemUpdate(surveyquestion);
		
	}
	
	@Override
	public int selectMaxSurveyId() {
		// 불필요하다 지우자
		return surveyDao.selectMaxSurveyId();
		
	}
	
	@Transactional
	public void setQuestInsert(SurveyQuestionDTO sqd) {
		logger.info("setQuestInsert service: " + sqd );
		sqd.setQuestionId(surveyDao.selectMaxQuestionId()+1);
		logger.info("id가 들어갔니 안갔니 :" + sqd);
		surveyDao.setQuestInsert(sqd);
		logger.info("문제등록");
		logger.info("");
		setItemInsert(sqd);
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
	public void setItemDelete(SurveyQuestionDTO sqd) {
		
		surveyDao.setItemDelete(sqd);
	}
	
	@Override
	public int selectMaxItemId() {
		// 필요없음
		return 0;
	}

	@Override
	public void setQuestUpdate(SurveyQuestionDTO SQD) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Map<String, Object>> selectQuestion(int surveyId) {

		
		return surveyDao.selectQuestion(surveyId);
		
	}

	@Override
	public List<SurveyListDTO> selectSurveyList(){
		return surveyDao.selectSurveyList();
	}


}
