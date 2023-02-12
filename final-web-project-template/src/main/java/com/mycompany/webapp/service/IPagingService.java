package com.mycompany.webapp.service;

import java.util.Date;

public interface IPagingService {


	int getTotalBoardNum(String keyword, String selection, Date surveyStartDateLeft,Date surveyStartDateRight, String anonyMityCheckCode);

	int getTotalMappingNum(String keyword, String keyword2, String selection, String selection2, int surveySeq, String selectGD);

	int getTotalInsertNum(String keyword, String keyword2, String selection, String selection2, int surveySeq, String selectGD, String raterId, int month);

	int getEvaluateMessageBoardNum(String keyword, String selection, String selection2, int surveySeq, String selectGD);
	
	int getEvaluateSearchBoardNum(String keyword, String selection,String selection2, int surveySeq);
}
