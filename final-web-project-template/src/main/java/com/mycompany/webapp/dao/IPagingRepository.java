package com.mycompany.webapp.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

public interface IPagingRepository {


	int getTotalBoardNum(@Param("keyword")String keyword,@Param("selection") String selection, @Param("surveyStartDateLeft") Date surveyStartDateLeft,@Param("surveyStartDateRight") Date surveyStartDateRight, @Param("anonyMityCheckCode") String anonyMityCheckCode);

	int getTotalMappingNum(@Param("keyword")String keyword, @Param("keyword2")String keyword2, @Param("selection") String selection, @Param("selection2") String selection2,
			@Param("surveySeq") int surveySeq, @Param("selectGD") String selectGD);
	
	int getEvaluateMessageBoardNum(@Param("keyword")String keyword, @Param("selection") String selection, @Param("selection2") String selection2, @Param("surveySeq") int surveySeq, @Param("selectGD") String selectGD);
	
	int getTotalInsertNum(@Param("keyword")String keyword, @Param("keyword2")String keyword2, @Param("selection") String selection, @Param("selection2") String selection2,
			@Param("surveySeq") int surveySeq, @Param("selectGD") String selectGD, @Param("raterId") String raterId , @Param("month") int month);

	int getEvaluateSearchBoardNum(@Param("keyword")String keyword, @Param("selection") String selection,@Param("selection2") String selection2,  @Param("surveySeq") int surveySeq);
}
