package com.mycompany.webapp.service;



import java.util.List;
import java.util.Map;

import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);
	
	void setSurveyUpdate(SurveyListDTO surveylist);
	
	void setItemUpdate(SurveyQuestionDTO surveyquestion);

	int selectMaxSurveyId();
	
	void setItemDelete(SurveyQuestionDTO sqd);
	
	void setQuestInsert(SurveyQuestionDTO sqd);

	int selectMaxQuestionId();

	void setItemInsert(SurveyQuestionDTO sqd);

	int selectMaxItemId();

	void setQuestUpdate(SurveyQuestionDTO sqd);
	
	List<Map<String, Object>> selectQuestion(int surveyId);
	
	List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto);
	
	SurveyListDTO selectSurvey(int surveyid);
	
	SurveyQuestionDTO getQuestionList(int surveyId);
	
	public List<SurveyQuestionDTO>questionList(int surveyId);

	void sendMessage(int surveySeq);
	
	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<SurveyListDTO> searchListByKeywordAndDicideYN(PagingDTO pagingdto);

	List<SurveyListDTO> searchListByKeywordAndDate(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(int questionSeq);
	
}



	

	
