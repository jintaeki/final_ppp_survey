package com.mycompany.webapp.dao;


import java.util.Date;
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


public interface ISurveyRepository {

	void setSurvey(SurveyListDTO surveylist);

	void updateSurvey(SurveyListDTO surveylist);

	void insertQuestion(SurveyQuestionDTO SQD);

	void insertItem(SurveyQuestionDTO SQD);

	SurveyListDTO selectSurvey(int surveyid);

	void UpdateQuestion(SurveyQuestionDTO SQD);

	List<SurveyQuestionDTO> getQuestionListOrderByDesc(int surveySeq);

	List<SurveyQuestionDTO> getQuestionListOrderByAsc(int surveySeq);


	void sendMessage(int surveySeq);

	// 메일 발송시 상태 업데이트
	void updateEmail(int surveySeq);
	void updateSMS(int surveySeq);

	void DeleteQuestion(int questionSeq);

	void deleteItemByQSeq(int questionSeq);

	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(@Param ("questionSeq") int questionSeq, @Param ("surveySeq") int surveySeq);

	List<Map<String, Object>> selectItems(int questionSeq);

	void surveyInsertComplete(int surveySeq);

	void deleteSurvey(int surveySeq);

	void deleteItem (int itemSeq);

	List<Map<String, String>> selectSurveyEvaluate(int surveySeq);

	List<Map<String, Object>> searchByEvaluate(PagingDTO pagingdto);

	// 결과 통계 페이지
	List<SurveyListDTO> surveyList();
	List<OrganizationChartDTO> organList(int surveySeq);

	//결과 목록
	List<SurveyResultTeamDTO> resultList(int surveySeq);
	List<SurveyResultTeamDTO> resultDPList(@Param("surveySeq") int surveySeq, @Param("departmentId") String departmentId);

	List<SurveyResultDTO> surveyResult(@Param("employeeId") int employeeId, @Param("surveySeq") int surveySeq);

	List<Map<String, Object>> getResultTarget(int employeeId);
	
	// 개인 점수 요악본
	List<SurveyResultDTO> personalStats(@Param("surveySeq") int surveySeq, @Param("employeeId") int employeeId);

	// 문항 수 체크 for 등록완료 가능 여부
	int getItemCnt(int surveySeq);

}







