package com.mycompany.webapp.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.transaction.annotation.Transactional;


import com.mycompany.webapp.dao.ISurveyRepository;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
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
	public SurveyListDTO selectSurvey(int surveySeq) {


		return surveyDao.selectSurvey(surveySeq);

	}

	@Override

	public void updateSurvey(SurveyListDTO surveylist) {
		surveyDao.updateSurvey(surveylist);

	}

	@Override
	public void updateItem(SurveyQuestionDTO surveyquestion) {
		//      Date date = surveyDao.getAddDate(surveyquestion.getQuestionSeq());
		//      logger.info(date.toString());
		//      surveyquestion.setAddDate(date);

		//      surveyDao.setItemDelete(surveyquestion);
		//      surveyDao.deleteItemByQSeq(surveyquestion);
		surveyDao.updateItem(surveyquestion);
	}


	public void deleteItemByQSeq(SurveyQuestionDTO SQD) {
		surveyDao.deleteItemByQSeq(SQD.getQuestionSeq());
	}

	@Override
	public int selectMaxSurveyId() {
		// 불필요하다 지우자
		return surveyDao.selectMaxSurveyId();

	}

	@Transactional
	public void insertQuestion(SurveyQuestionDTO sqd) {
		logger.info("insertQuestion service: " + sqd );
//		sqd.setQuestionSeq(surveyDao.selectMaxQuestionId()+1);
		logger.info("id가 들어갔니 안갔니 :" + sqd);
		surveyDao.insertQuestion(sqd);
		logger.info("문제등록");
		//insertItem(sqd);
		//logger.info("문항등록");
	}

	@Override
	public int selectMaxQuestionId() {
		return surveyDao.selectMaxQuestionId();
	}

	@Override

	public void insertItem(SurveyQuestionDTO sqd) {
		logger.info("insertItem: " + sqd);
//		sqd.setItemSeq(surveyDao.selectMaxItemId()+1);
		logger.info("문항 id가 들어갔냐 안갔냐"  + sqd);
		surveyDao.insertItem(sqd);
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
	public List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto){
		return surveyDao.selectSurveyList(pagingdto);
	}

	/*
   @Override
   public SurveyQuestionDTO getQuestionList(int surveyId) {
      logger.info("getQuestionList: " + surveyId);
      return surveyDao.getQuestionList(surveyId);

   }
	 */
	@Override
	public List<SurveyQuestionDTO> questionList(int surveySeq) {

		return surveyDao.getQuestionList(surveySeq);
	}
	@Override
	public List<SurveyQuestionDTO> getQuestionList(int surveySeq) {
		logger.info("문제 조회 서비스: " + surveySeq);
		return surveyDao.getQuestionList(surveySeq);
	}


	// 1월 9일 여기부터 시작
	@Override
	public void sendMessage(int surveySeq) {
		surveyDao.sendMessage(surveySeq);
	}

	@Override
	public List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto) {
		//	      pagingdto.setKeyword("%"+pagingdto.getKeyword()+"%");
		logger.info(surveyDao.searchListByKeyword(pagingdto).toString());
		return surveyDao.searchListByKeyword(pagingdto);
	}


	@Override
	public List<Map<String, Object>> selectQuestionBySeq(int questionSeq){
		logger.info(surveyDao.selectQuestionBySeq(questionSeq).toString());
		return surveyDao.selectQuestionBySeq(questionSeq);
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




}







