package com.mycompany.webapp.dao;

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

	//뿌리기
	List<Map<String, Object>> selectQuestion(int surveyId);
	
	List<SurveyListDTO> selectSurveyList();	
}
