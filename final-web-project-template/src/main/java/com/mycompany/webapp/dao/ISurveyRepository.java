package com.mycompany.webapp.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyRepository {

	void setSurvey(SurveyListDTO surveylist);

	void updateSurvey(SurveyListDTO surveylist);

	void insertQuestion(SurveyQuestionDTO SQD);

	void insertItem(SurveyQuestionDTO SQD);

	//문제 비동기 조회 목적
	List<Map<String, Object>> selectQuestion(int surveySeq);

	SurveyListDTO selectSurvey(int surveyid);

	void UpdateQuestion(SurveyQuestionDTO SQD);

	List<SurveyQuestionDTO> getQuestionList(int surveySeq);

	void sendMessage(int surveySeq);

	void DeleteQuestion(int questionSeq);

	void deleteItemByQSeq(int questionSeq);

	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(@Param ("questionSeq") int questionSeq, @Param ("surveySeq") int surveySeq);

	List<Map<String, Object>> selectItems(int questionSeq);

	void surveyInsertComplete(int surveySeq);

	void deleteSurvey(int surveySeq);

	void deleteItem (int itemSeq);

	List<Map<String, String>> selectSurveyEvaluate(int surveySeq);

	// 설문 화면 왼쪽 그리드 (평가 대상 출력)
	List<PopupDTO> selectSurveyMapping(@Param("surveySeq") int surveySeq, @Param("raterId") int raterId);

	// 중복 확인

	int mappingCheck(@Param("surveySeq") int surveySeq);

	List<Map<String, Object>> searchByEvaluate(PagingDTO pagingdto);
	


}







