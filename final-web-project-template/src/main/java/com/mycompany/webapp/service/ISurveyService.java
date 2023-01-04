package com.mycompany.webapp.service;

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);
	
	void setSurveyUpdate(SurveyListDTO surveylist);
	
	void setItemUpdate(SurveyQuestionDTO surveyquestion);

	int selectMaxSurveyId();
	
}
