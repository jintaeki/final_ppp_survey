package com.mycompany.webapp.service;

import java.util.Date;

public interface IPagingService {


	int getTotalBoardNum(String keyword, String selection, Date surveyStartDate, String anonyMityCheckCode);

	int getTotalMappingNum(String keyword, String selection, int surveySeq, String selectGD);
	
	int getTotalNonMappingNum(String keyword, String selection, int surveySeq, String selectGD);
	
	int getTotalInsertNum(String keyword, String selection, int surveySeq, String selectGD, String raterId, int month);

	int getEvaluateTotalBoardNum(String keyword, String selection);
}
