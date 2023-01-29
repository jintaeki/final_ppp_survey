package com.mycompany.webapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;
import com.mycompany.webapp.dto.UserCheckDTO;

public interface ILoginCheckService {

	public int checkUser(UserCheckDTO UCD);
	
	public List<UserCheckDTO> getUserInfo(String raterId, int surveySeq);
	
	public UserCheckDTO getUserManagerYN(UserCheckDTO UCD);
	
	public List<Map<String, Object>> getQuestion(int surveySeq);
	
	public List<Map<String, Object>> getSurveySeqAndName (String raterId);

	public int getNansu ();
	
	public int checkNansu(int nanSu);
	
	public  void insertResult (SurveyResultDTO SRD);
	
	public SurveyListDTO getAnonimityCode(int surveySeq);
	
	public void completeSurvey(String surveySeq, String appraiseeId, String raterId);

}
