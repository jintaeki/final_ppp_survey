package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyRepository {

	void setSurvey(SurveyListDTO surveylist);
	
	void setSurveyUpdate(SurveyListDTO surveylist);
	
	void setItemUpdate(SurveyQuestionDTO surveyquestion);
	
	int selectMaxSurveyId();
	
	void setQuestInsert(SurveyQuestionDTO SQD);
	int selectMaxQuestionId();
	int selectMaxItemId();
	void setItemInsert(SurveyQuestionDTO SQD);
	//SurveyQuestionDTO getQuestionList(int surveyId);
	void setQuestUpdate(SurveyQuestionDTO SQD);

	List<Map<String, Object>> selectQuestion(int surveyId);
	List<SurveyQuestionDTO> getQuestionList(int surveyId);
	
	void setItemDelete(SurveyQuestionDTO sqd);

}
