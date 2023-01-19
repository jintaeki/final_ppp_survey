package com.mycompany.webapp.service;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);

	void updateSurvey(SurveyListDTO surveylist);

	void updateItem(SurveyQuestionDTO surveyquestion);

	int selectMaxSurveyId();

	void setItemDelete(SurveyQuestionDTO sqd);



	void insertQuestion(SurveyQuestionDTO sqd);

	int selectMaxQuestionId();

	void insertItem(SurveyQuestionDTO sqd);

	int selectMaxItemId();

	void UpdateQuestion(SurveyQuestionDTO sqd);

	List<Map<String, String>> selectSurveyEvaluate(int surveySeq);

	List<Map<String, Object>> selectQuestion(int surveySeq);

	List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto);

	SurveyListDTO selectSurvey(int surveySeq);

	public List<SurveyQuestionDTO> getQuestionList(int surveySeq);

	public List<SurveyQuestionDTO>questionList(int surveySeq);

	void sendMessage(int surveySeq);

	void DeleteQuestion(int questionSeq);

	void deleteItemByQSeq(SurveyQuestionDTO SQD);

	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);


	List<Map<String, Object>> selectQuestionBySeq(int questionSeq,int surveySeq);

	List<Map<String, Object>> selectItems(int questionSeq);

	//진택

	void surveyInsertComplete(int surveySeq);

	void deleteSurvey(int surveySeq);
	
	void deleteItem (int itemSeq);
	
	// 설문 화면 왼쪽 그리드 (평가 대상 출력)
	List<PopupDTO> selectSurveyMapping(int surveySeq, int raterId);
	
	// 설문조사 중복 체크
	int mappingCheck(int surveySeq);
}






