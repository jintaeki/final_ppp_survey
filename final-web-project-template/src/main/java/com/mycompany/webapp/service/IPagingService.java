package com.mycompany.webapp.service;

import java.util.Date;

public interface IPagingService {


	int getTotalBoardNum(String keyword, String selection, Date surveyStartDateLeft,Date surveyStartDateRight, String anonyMityCheckCode);

	int getTotalMappingNum(String keyword, String selection, int surveySeq, String selectGD);
	
	int getTotalNonMappingNum(String keyword, String selection, int surveySeq, String selectGD);
	
	int getTotalInsertNum(String keyword, String selection, int surveySeq, String selectGD, String raterId, int month);

	int getEvaluateSearchBoardNum(String keyword, String selection, int surveySeq);
	
	int getEvaluateMessageBoardNum(String keyword, String selection, int surveySeq);
}
