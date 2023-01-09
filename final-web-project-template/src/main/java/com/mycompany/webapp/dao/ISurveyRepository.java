package com.mycompany.webapp.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyRepository {

	void setSurvey(SurveyListDTO surveylist);
	
	void setSurveyUpdate(SurveyListDTO surveylist);
	
	void setItemUpdate(SurveyQuestionDTO surveyquestion);
	void setItemDelete(SurveyQuestionDTO sqd);
	
	int selectMaxSurveyId();
	
	void setQuestInsert(SurveyQuestionDTO SQD);
	int selectMaxQuestionId();
	int selectMaxItemId();
	void setItemInsert(SurveyQuestionDTO SQD);

	//문제 비동기 조회 목적
	List<Map<String, Object>> selectQuestion(int surveyId);
	
	List<SurveyListDTO> selectSurveyList();	
	
	SurveyListDTO selectSurvey(int surveyid);
	
	//SurveyQuestionDTO getQuestionList(int surveyId);
	void setQuestUpdate(SurveyQuestionDTO SQD);


	List<SurveyQuestionDTO> getQuestionList(int surveyId);
	
	Date getAddDate(int serveySeq);
}


	

	
	

