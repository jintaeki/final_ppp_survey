package com.mycompany.webapp.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mycompany.webapp.dto.PagingDTO;
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
	List<Map<String, Object>> selectQuestion(int surveySeq);
	
	List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto);	
	
	SurveyListDTO selectSurvey(int surveyid);
	
	//SurveyQuestionDTO getQuestionList(int surveyId);
	void setQuestUpdate(SurveyQuestionDTO SQD);


	List<SurveyQuestionDTO> getQuestionList(int surveySeq);
	
	Date getAddDate(int serveySeq);
	
	void sendMessage(int surveySeq);
	
	void setQuestionDelete(int questionSeq);

	void setItemDeleteQus(int questionSeq);

	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<SurveyListDTO> searchListByKeywordAndDicideYN(PagingDTO pagingdto);

	List<SurveyListDTO> searchListByKeywordAndDate(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(int questionSeq);

}


	

	
	

