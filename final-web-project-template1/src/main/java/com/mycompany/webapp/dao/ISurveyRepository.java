package com.mycompany.webapp.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyRepository {

	void setSurvey(SurveyListDTO surveylist);

	void updateSurvey(SurveyListDTO surveylist);

	void updateItem(SurveyQuestionDTO surveyquestion);


	int selectMaxSurveyId();

	void insertQuestion(SurveyQuestionDTO SQD);
	int selectMaxQuestionId();
	int selectMaxItemId();
	void insertItem(SurveyQuestionDTO SQD);

	//문제 비동기 조회 목적
	List<Map<String, Object>> selectQuestion(int surveyId);

	List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto);	

	SurveyListDTO selectSurvey(int surveyid);

	//SurveyQuestionDTO getQuestionList(int surveyId);
	void UpdateQuestion(SurveyQuestionDTO SQD);


	List<SurveyQuestionDTO> getQuestionList(int surveyId);



	void sendMessage(int surveySeq);

	void DeleteQuestion(int questionSeq);

	void deleteItemByQSeq(int questionSeq);

	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);


	List<Map<String, Object>> selectQuestionBySeq(int questionSeq);
	
	List<Map<String, Object>> selectItems(int questionSeq);

	void UpdateQTypeBySeq(SurveyQuestionDTO SQD);

	
}







