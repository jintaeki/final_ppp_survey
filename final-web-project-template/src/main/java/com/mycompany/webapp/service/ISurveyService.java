package com.mycompany.webapp.service;



import java.util.List;
import java.util.Map;

import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);
	
	void updateSurvey(SurveyListDTO surveylist);
	
	void updateItem(SurveyQuestionDTO surveyquestion);

	int selectMaxSurveyId();
	
	
	void insertQuestion(SurveyQuestionDTO sqd);

	int selectMaxQuestionId();

	void insertItem(SurveyQuestionDTO sqd);

	int selectMaxItemId();

	void UpdateQuestion(SurveyQuestionDTO sqd);
	
	List<Map<String, Object>> selectQuestion(int surveyId);
	
	List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto);
	
	SurveyListDTO selectSurvey(int surveyid);
	
	public List<SurveyQuestionDTO>questionList(int surveyId);

	public List<SurveyQuestionDTO> getQuestionList(int surveySeq);
		
	void sendMessage(int surveySeq);
	
	void DeleteQuestion(int questionSeq);
	
	void deleteItemByQSeq(SurveyQuestionDTO SQD);
	
	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<SurveyListDTO> searchListByKeywordAndDicideYN(PagingDTO pagingdto);

	List<SurveyListDTO> searchListByKeywordAndDate(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(int questionSeq);
	
	List<Map<String, Object>> selectItems(int questionSeq);
}



	

	
