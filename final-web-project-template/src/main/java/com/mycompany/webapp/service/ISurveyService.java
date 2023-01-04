package com.mycompany.webapp.service;

import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyService {

	void setQuestInsert(SurveyQuestionDTO sqd);

	int selectMaxQuestionId();

	void setItemInsert(SurveyQuestionDTO sqd);

	int selectMaxItemId();

	void setQuestUpdate(SurveyQuestionDTO sqd);

}
