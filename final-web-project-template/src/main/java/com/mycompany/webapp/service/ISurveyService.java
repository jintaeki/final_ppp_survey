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
	
	List<Map<String, Object>> selectQuestion(int surveySeq);
	
	List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto);
	
	SurveyListDTO selectSurvey(int surveySeq);
	
	public List<SurveyQuestionDTO> getQuestionList(int surveySeq);
	
	public List<SurveyQuestionDTO>questionList(int surveySeq);

	void sendMessage(int surveySeq);
	
	void setQuestionDelete(int questionSeq);
	
	void setItemDeleteQus(int questionSeq);
	
	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<SurveyListDTO> searchListByKeywordAndDicideYN(PagingDTO pagingdto);

	List<SurveyListDTO> searchListByKeywordAndDate(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(int questionSeq);
	
	List<Map<String, Object>> selectItems(int questionSeq);
}



	

	
