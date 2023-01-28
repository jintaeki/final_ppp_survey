
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
	public void UpdateQuestion(SurveyQuestionDTO SQD) {
		logger.info("문제 업데이트 서비스 진입: " + SQD);
		 surveyDao.UpdateQuestion(SQD);

	}

	@Override
	public void sendMessage(int surveySeq) {
		surveyDao.sendMessage(surveySeq);
	}
	
	@Override
	public void updateEmail(int surveySeq) {
		surveyDao.updateEmail(surveySeq);
	}
	
	@Override
	public void updateSMS(int surveySeq) {
		surveyDao.updateSMS(surveySeq);
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
			
//			System.out.println("문제 입력"+i);
//			System.out.println("문제들"+SQD.toString());
			for(int j = 0; j<items.size();j++) {
//				System.out.println(items.get(j).get("ITEM_CONTENT").toString());
//				System.out.println(items.get(j).get("ITEM_SCORE").toString());
				SQD.setItemContent(items.get(j).get("ITEM_CONTENT").toString());
				SQD.setItemScore(items.get(j).get("ITEM_SCORE").toString());
				surveyDao.insertItem(SQD);
//				System.out.println("문항 입력"+i);
			}
		}
		

	}


	@Override
	public List<SurveyResultDTO> surveyResult(int employeeId, int surveySeq) {
			logger.info("개인별 설문 결과 페이지 서비스 진입");
			logger.info("employeeId: "  + employeeId);
		return surveyDao.surveyResult(employeeId, surveySeq);
	}

	@Override
	public List<Map<String, Object>> getResultTarget(int employeeId) {

		return surveyDao.getResultTarget(employeeId);
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




}







