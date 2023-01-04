package com.mycompany.webapp.dao;

import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyRepository {
		void setQuestInsert(SurveyQuestionDTO SQD);
		int selectMaxQuestionId();
		int selectMaxItemId();
		void setItemInsert(SurveyQuestionDTO SQD);
		
}
