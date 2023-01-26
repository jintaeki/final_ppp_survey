<<<<<<< HEAD
package com.mycompany.webapp.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;




public interface IPagingRepository {

<<<<<<< HEAD
	int getTotalBoardNum(@Param("keyword")String keyword,@Param("selection") String selection, @Param("surveyStartDate") Date surveyStartDate, @Param("anonyMityCheckCode") String anonyMityCheckCode);
	
	int getTotalMappingNum(@Param("keyword")String keyword,@Param("selection") String selection, @Param("surveySeq") int surveySeq);
	
	int getTotalNonMappingNum(@Param("keyword")String keyword,@Param("selection") String selection, @Param("surveySeq") int surveySeq);
=======
	int getTotalBoardNum(@Param("keyword")String keyword,@Param("selection") String selection, @Param("surveyStartDate") Date surveyStartDate);
	
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
	
}
=======
package com.mycompany.webapp.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;




public interface IPagingRepository {

	int getTotalBoardNum(@Param("keyword")String keyword,@Param("selection") String selection, @Param("surveyStartDate") Date surveyStartDate);
	
	
}
>>>>>>> refs/remotes/origin/cbj2
