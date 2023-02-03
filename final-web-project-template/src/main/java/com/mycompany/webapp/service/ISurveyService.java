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
import com.mycompany.webapp.dto.SurveyResultTeamDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);

	void updateSurvey(SurveyListDTO surveylist);

	void insertQuestion(SurveyQuestionDTO sqd);

	void insertItem(SurveyQuestionDTO sqd);

	void UpdateQuestion(SurveyQuestionDTO sqd);

	List<Map<String, String>> selectSurveyEvaluate(int surveySeq);

	SurveyListDTO selectSurvey(int surveySeq);

	public List<SurveyQuestionDTO> getQuestionListOrderByDesc(int surveySeq);

	public List<SurveyQuestionDTO> getQuestionListOrderByAsc(int surveySeq);


	void sendMessage(int surveySeq);

	// 메일 발송시 상태 업데이트
	void updateEmail(int surveyseq, String deliveryContent);
	void updateSMS(int surveyseq, String deliveryContent);

	// 메일 재 발송
	void sendReEmail(int surveySeq, String deliveryContent);
	void sendReSMS(int surveySeq, String deliveryContent);

	void deleteQuestion(int questionSeq);

	void deleteItemByQSeq(int questionSeq);

	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(int questionSeq,int surveySeq);

	List<Map<String, Object>> selectItems(int questionSeq);

	void surveyInsertComplete(int surveySeq);

	void deleteSurvey(int surveySeq);

	List<Map<String, Object>> searchByEvaluate(PagingDTO pagingdto);

	List<SurveyResultDTO> objectiveResult(int employeeId, int surveyId);

	List<SurveyResultDTO> subjectiveResult(int employeeId, int surveyId);

	List<SurveyResultDTO> mixResult(int employeeId, int surveyId);

	// 결과 통계 페이지
	List<SurveyListDTO> surveyList();
	List<OrganizationChartDTO> organList(int surveySeq);

	//결과 목록
	List<Map<String, Object>> getResultTarget(int employeeId);

	// 개인 결과 요약
	List<SurveyResultDTO> personalStats(int surveySeq, int employeeId);

	//설문 복사를 위한 문제 및 문항 복사
	void insertQuestionsAndItems(List<SurveyQuestionDTO> SQD);

	List<SurveyResultTeamDTO> resultList(int surveySeq);
	List<SurveyResultTeamDTO> resultDPList(int surveySeq, String departmentId);

	int getItemCnt(int surveySeq);

}






