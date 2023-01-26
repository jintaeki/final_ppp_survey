package com.mycompany.webapp.service;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.OrganizationChartDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.dto.ProjectDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);

	void updateSurvey(SurveyListDTO surveylist);

	void insertQuestion(SurveyQuestionDTO sqd);


	void insertItem(SurveyQuestionDTO sqd);


	void UpdateQuestion(SurveyQuestionDTO sqd);

	List<Map<String, String>> selectSurveyEvaluate(int surveySeq);

	List<Map<String, Object>> selectQuestion(int surveySeq);


	SurveyListDTO selectSurvey(int surveySeq);

	public List<SurveyQuestionDTO> getQuestionList(int surveySeq);

	public List<SurveyQuestionDTO>questionList(int surveySeq);

	void sendMessage(int surveySeq);
	
	// 메일 발송시 상태 업데이트
	void updateEmail(int surveySeq);
	void updateSMS(int surveySeq);

	void DeleteQuestion(int questionSeq);

	void deleteItemByQSeq(int questionSeq);

	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);


	List<Map<String, Object>> selectQuestionBySeq(int questionSeq,int surveySeq);

	List<Map<String, Object>> selectItems(int questionSeq);

	void surveyInsertComplete(int surveySeq);

	void deleteSurvey(int surveySeq);

	List<Map<String, Object>> searchByEvaluate(PagingDTO pagingdto);



	// 결과 통계 페이지
	List<SurveyListDTO> surveyList();
	List<ProjectDTO> projectList();
	List<OrganizationChartDTO> organList();
			
	//결과 목록
	List<SurveyResultDTO> resultList(int surveySeq, String projectId, String departmentId);	

	List<SurveyResultDTO> surveyResult(SurveyResultDTO SRD);

}






