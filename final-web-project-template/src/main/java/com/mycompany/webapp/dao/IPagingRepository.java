package com.mycompany.webapp.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;




public interface IPagingRepository {

	int getTotalBoardNum(@Param("keyword")String keyword,@Param("selection") String selection, @Param("surveyStartDate") Date surveyStartDate);
	
	
}
