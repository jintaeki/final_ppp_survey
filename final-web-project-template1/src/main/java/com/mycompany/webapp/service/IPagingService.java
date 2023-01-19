package com.mycompany.webapp.service;

import java.util.Date;

public interface IPagingService {


	int getTotalBoardNum(String keyword, String selection, Date surveyStartDate, String anonyMityCheckCode);

	
}
