package com.mycompany.webapp.dao;

import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyRepository {
		void setQuestInsert(SurveyQuestionDTO surveyQuestionDTO);
		int selectMaxQuestionId();
		
		
}
