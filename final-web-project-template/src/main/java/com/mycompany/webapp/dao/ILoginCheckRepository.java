package com.mycompany.webapp.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;
import com.mycompany.webapp.dto.UserCheckDTO;

public interface ILoginCheckRepository {

	public int checkUser(UserCheckDTO UCD);

	public List<UserCheckDTO> getUserInfo(@Param("raterId") String raterId, @Param("surveySeq") int surveySeq);

	public UserCheckDTO getUserManagerYN(@Param("raterId") String raterId, @Param("password") String password);

	public List<Map<String, Object>> getQuestion(int surveySeq);

	public List<Map<String, Object>> getSurveySeqAndName (String raterId);

	public int getNansu();

	public int checkNansu(int nanSu);

	public  void insertResult (SurveyResultDTO SRD);

	public SurveyListDTO getAnonimityCode(int surveySeq);

	public void completeSurvey(@Param("surveySeq") String surveySeq,@Param("appraiseeId") String appraiseeId,@Param("raterId") String raterId);

	void insertExcelOCD(Map<String, Object> paramMap) throws Exception;
	void insertExcelPH(Map<String, Object> paramMap) throws Exception;
}
