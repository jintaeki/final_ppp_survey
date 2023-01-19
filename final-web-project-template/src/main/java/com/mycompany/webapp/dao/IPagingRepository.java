package com.mycompany.webapp.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

public interface IPagingRepository {

	int getTotalBoardNum(@Param("keyword")String keyword,@Param("selection") String selection, @Param("surveyStartDate") Date surveyStartDate);
		
	int getTotalMappingNum(@Param("keyword")String keyword, @Param("selection") String selection, 
			@Param("surveySeq") int surveySeq, @Param("selectGD") String selectGD);
	
	int getTotalInsertNum(@Param("keyword")String keyword, @Param("selection") String selection, 
			@Param("surveySeq") int surveySeq, @Param("selectGD") String selectGD, @Param("raterId") String raterId , @Param("month") int month);
	
	int getTotalNonMappingNum(@Param("keyword")String keyword, @Param("selection") String selection, 
			@Param("surveySeq") int surveySeq, @Param("selectGD") String selectGD);
	
}
