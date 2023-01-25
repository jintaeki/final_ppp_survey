
package com.mycompany.webapp.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.IMappingRepository;
import com.mycompany.webapp.dao.ISurveyRepository;
import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

@Service
public class SurveyService implements ISurveyService{
	private static final Logger logger = LoggerFactory.getLogger(SurveyService.class);

	@Autowired
	ISurveyRepository surveyDao;

	@Autowired
	IMappingRepository mappingrepository;

	@Override
	public void setSurvey(SurveyListDTO surveylist) {
		surveyDao.setSurvey(surveylist);
		logger.info(surveylist.toString());

	}

	@Override
	public SurveyListDTO selectSurvey(int surveySeq) {


		return surveyDao.selectSurvey(surveySeq);

	}

	@Override
	public void updateSurvey(SurveyListDTO surveylist) {
		surveyDao.updateSurvey(surveylist);

	}



	public void deleteItemByQSeq(int questionSeq ) {
		surveyDao.deleteItemByQSeq(questionSeq);
	}



	@Transactional
	public void insertQuestion(SurveyQuestionDTO sqd) {
		logger.info("insertQuestion service: " + sqd );
		surveyDao.insertQuestion(sqd);
		logger.info("문제등록");

	}


	@Override

	public void insertItem(SurveyQuestionDTO sqd) {
		logger.info("insertItem: " + sqd);
		logger.info("문항 id가 들어갔냐 안갔냐"  + sqd);
		surveyDao.insertItem(sqd);
	}

	@Override
	public void UpdateQuestion(SurveyQuestionDTO SQD) {
		logger.info("문제 업데이트 서비스 진입: " + SQD);
		 surveyDao.UpdateQuestion(SQD);

	}

	@Override
	public List<Map<String, Object>> selectQuestion(int surveySeq) {

		logger.info("문제 찾을 설문지:" + surveySeq);
		return surveyDao.selectQuestion(surveySeq);

	}



	@Override
	public List<SurveyQuestionDTO> questionList(int surveySeq) {

		return surveyDao.getQuestionList(surveySeq);
	}
	@Override
	public List<SurveyQuestionDTO> getQuestionList(int surveySeq) {
		logger.info("문제 조회 서비스: " + surveySeq);
		return surveyDao.getQuestionList(surveySeq);
	}

	@Override
	public void sendMessage(int surveySeq) {
		surveyDao.sendMessage(surveySeq);
	}

	@Override
	public List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto) {
		logger.info(surveyDao.searchListByKeyword(pagingdto).toString());
		return surveyDao.searchListByKeyword(pagingdto);
	}


	@Override
	public List<Map<String, Object>> selectQuestionBySeq(int questionSeq, int surveySeq){
		logger.info("selectQuestionBySeq 서비스 진입");
		logger.info(surveyDao.selectQuestionBySeq(questionSeq,surveySeq).toString());
		return surveyDao.selectQuestionBySeq(questionSeq,surveySeq);
	}

	@Override
	public void DeleteQuestion(int questionSeq) {
		logger.info("문제삭제 서비스 진입");
		surveyDao.deleteItemByQSeq(questionSeq);
		surveyDao.DeleteQuestion(questionSeq);
	}



	@Override
	public List<Map<String, Object>> selectItems(int questionSeq) {
		return surveyDao.selectItems(questionSeq);
	}

	@Override
	public void surveyInsertComplete(int surveySeq) {
		surveyDao.surveyInsertComplete(surveySeq);
	}

	@Override
	public void deleteSurvey(int surveySeq) {
		surveyDao.deleteSurvey(surveySeq);

	}


	public List<Map<String, String>> selectSurveyEvaluate(int surveySeq) {
		logger.info("selectSurveyEvaluate 서비스 진입");
		logger.info("서비스: " +surveySeq);

		return surveyDao.selectSurveyEvaluate(surveySeq);
	}

	@Override
	public List<Map<String, Object>> searchByEvaluate(PagingDTO pagingDto) {
		// TODO Auto-generated method stub
		logger.info("검색:" + surveyDao.searchByEvaluate(pagingDto).toString());
		return surveyDao.searchByEvaluate(pagingDto);
	}

	@Override
	public List<Map<String, Object>> getSurveySeqAndName(int raterId) {
		
		return null;
	}
}







