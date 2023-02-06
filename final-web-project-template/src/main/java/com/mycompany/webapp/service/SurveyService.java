
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
import com.mycompany.webapp.dto.OrganizationChartDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.dto.ProjectDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;
import com.mycompany.webapp.dto.SurveyResultTeamDTO;

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

	public void deleteItem (int questionSeq, int itemSeq) {
		surveyDao.deleteItem(questionSeq, itemSeq);
	}

	@Override
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
	public void UpdateQuestion(String questionContent, int questionSeq, String questionTypeCode) {
		 surveyDao.UpdateQuestion(questionContent, questionSeq,  questionTypeCode);

	}

	@Override
	public void sendMessage(int surveySeq) {
		surveyDao.sendMessage(surveySeq);
	}

	@Override
	public void updateEmail(int surveyseq, String deliveryContent) {
		surveyDao.updateEmail(surveyseq, deliveryContent);
	}

	@Override
	public void updateSMS(int surveyseq, String deliveryContent) {
		surveyDao.updateSMS(surveyseq, deliveryContent);
	}

	@Override
	public void sendReEmail(int surveySeq, String deliveryContent) {
		surveyDao.sendReEmail(surveySeq, deliveryContent);
	}

	@Override
	public void sendReSMS(int surveySeq, String deliveryContent) {
		surveyDao.sendReSMS(surveySeq, deliveryContent);
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
	public void deleteQuestion(int questionSeq) {
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
		logger.info("검색:" + surveyDao.searchByEvaluate(pagingDto).toString());
		logger.info("검색 전 dto: " + pagingDto.toString());
		return surveyDao.searchByEvaluate(pagingDto);
	}

	@Override
	public List<SurveyListDTO> surveyList() {
		return surveyDao.surveyList();
	}

	@Override
	public List<OrganizationChartDTO> organList(int surveySeq) {
		return surveyDao.organList(surveySeq);
	}

	@Override
	public List<SurveyResultTeamDTO> resultList(int surveySeq) {
		return surveyDao.resultList(surveySeq);
	}

	@Override
	public List<SurveyResultTeamDTO> resultDPList(int surveySeq, String departmentId) {
		return surveyDao.resultDPList(surveySeq, departmentId);
	}


	@Override
	public void insertQuestionsAndItems(List<SurveyQuestionDTO> SQDList) {
		int SQDListsize = SQDList.size();

		SurveyQuestionDTO SQD = new SurveyQuestionDTO() ;
		for(int i = 0; i<SQDListsize;i++) {
			SQD.setQuestionContent(SQDList.get(i).getQuestionContent());
			SQD.setQuestionTypeCode(SQDList.get(i).getQuestionTypeCode());
			SQD.setSurveySeq(SQDList.get(i).getSurveySeq());
			List<Map<String,Object>> items =surveyDao.selectItems(SQDList.get(i).getQuestionSeq());
			System.out.println(items.toString());
			surveyDao.insertQuestion(SQD);

			for(int j = 0; j<items.size();j++) {
				SQD.setItemContent(items.get(j).get("ITEM_CONTENT").toString());
				SQD.setItemScore(items.get(j).get("ITEM_SCORE").toString());
				surveyDao.insertItem(SQD);
			}
		}

	}


	@Override
	public List<SurveyResultDTO> objectiveResult(int employeeId, int surveySeq) {
			logger.info("개인별 설문 결과 페이지 서비스 진입");
			logger.info("employeeId: "  + employeeId);
			logger.info("surveySeq: "  + surveySeq);
		return surveyDao.objectiveResult(employeeId, surveySeq);
	}

	@Override
	public List<SurveyResultDTO> subjectiveResult(int employeeId, int surveySeq) {
			logger.info("개인별 설문 결과 페이지 서비스 진입");
			logger.info("employeeId: "  + employeeId);
			logger.info("surveySeq: "  + surveySeq);
		return surveyDao.subjectiveResult(employeeId, surveySeq);
	}

	@Override
	public List<SurveyResultDTO> mixResult(int employeeId, int surveySeq) {
			logger.info("개인별 설문 결과 페이지 서비스 진입");
			logger.info("employeeId: "  + employeeId);
			logger.info("surveySeq: "  + surveySeq);
		return surveyDao.mixResult(employeeId, surveySeq);
	}





	@Override
	public List<Map<String, Object>> getResultTarget(int employeeId) {
		logger.info("SRT 진입");
		logger.info("SRT 대상 ID: " + employeeId);
		return surveyDao.getResultTarget(employeeId);
	}

	//개인별 점수 요약
	@Override
	public List<SurveyResultDTO> personalStats(int surveySeq, int employeeId) {
		System.out.println("진입");
		logger.info("personalStats 진입");
		logger.info("surveySeq: " + surveySeq);
		logger.info("employeeId: " + surveySeq);

		return surveyDao.personalStats(surveySeq, employeeId);
	}


	// 등록관리에서 문제 조회할 때 desc
	@Override
	public List<SurveyQuestionDTO> getQuestionListOrderByDesc(int surveySeq) {
		return surveyDao.getQuestionListOrderByDesc(surveySeq);
	}

	// 설문지 복사하려고 문제 조회할 때 asc
	@Override
	public List<SurveyQuestionDTO> getQuestionListOrderByAsc(int surveySeq) {
		return surveyDao.getQuestionListOrderByAsc(surveySeq);
	}

	// 문항 수 체크하여 등록완료 여부 확인
	@Override
	public int getItemCnt(int surveySeq) {

		return surveyDao.getItemCnt(surveySeq);
	}






}







