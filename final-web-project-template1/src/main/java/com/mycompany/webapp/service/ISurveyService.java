<<<<<<< HEAD
package com.mycompany.webapp.service;



import java.util.List;
import java.util.Map;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);

	void updateSurvey(SurveyListDTO surveylist);

	void insertQuestion(SurveyQuestionDTO sqd);


	void insertItem(SurveyQuestionDTO sqd);


	void UpdateQuestion(SurveyQuestionDTO sqd);

	List<Map<String, String>> selectSurveyEvaluate(int surveySeq);

	List<Map<String, Object>> selectQuestion(int surveySeq);


	SurveyListDTO selectSurvey(int surveySeq);

	public List<SurveyQuestionDTO> getQuestionList(int surveySeq);

	public List<SurveyQuestionDTO>questionList(int surveySeq);

	void sendMessage(int surveySeq);

	void DeleteQuestion(int questionSeq);

	void deleteItemByQSeq(SurveyQuestionDTO SQD);

	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);


	List<Map<String, Object>> selectQuestionBySeq(int questionSeq,int surveySeq);

	List<Map<String, Object>> selectItems(int questionSeq);

	void surveyInsertComplete(int surveySeq);

	void deleteSurvey(int surveySeq);
	
	void deleteItem (int itemSeq);
	
	// 설문 화면 왼쪽 그리드 (평가 대상 출력)
	List<PopupDTO> selectSurveyMapping(int surveySeq, int raterId);
	
	// 설문조사 중복 체크
	int mappingCheck(int surveySeq);
}






=======
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);
	
	void updateSurvey(SurveyListDTO surveylist);
	
	void updateItem(SurveyQuestionDTO surveyquestion);

	int selectMaxSurveyId();
	
	
	void insertQuestion(SurveyQuestionDTO sqd);

	int selectMaxQuestionId();

	void insertItem(SurveyQuestionDTO sqd);

	int selectMaxItemId();

	void UpdateQuestion(SurveyQuestionDTO sqd);
	
	List<Map<String, Object>> selectQuestion(int surveyId);
	
	List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto);
	
	SurveyListDTO selectSurvey(int surveyid);
	
	public List<SurveyQuestionDTO>questionList(int surveyId);

	public List<SurveyQuestionDTO> getQuestionList(int surveySeq);
		
	void sendMessage(int surveySeq);
	
	void DeleteQuestion(int questionSeq);
	
	void deleteItemByQSeq(SurveyQuestionDTO SQD);
	
	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(int questionSeq);
	
	List<Map<String, Object>> selectItems(int questionSeq);
}



	

	
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
=======
package com.mycompany.webapp.service;



import java.util.List;
import java.util.Map;

import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;

public interface ISurveyService {

	void setSurvey(SurveyListDTO surveylist);
	
	void updateSurvey(SurveyListDTO surveylist);
	
	void updateItem(SurveyQuestionDTO surveyquestion);

	int selectMaxSurveyId();
	
	
	void insertQuestion(SurveyQuestionDTO sqd);

	int selectMaxQuestionId();

	void insertItem(SurveyQuestionDTO sqd);

	int selectMaxItemId();

	void UpdateQuestion(SurveyQuestionDTO sqd);
	
	List<Map<String, Object>> selectQuestion(int surveyId);
	
	List<SurveyListDTO> selectSurveyList(PagingDTO pagingdto);
	
	SurveyListDTO selectSurvey(int surveyid);
	
	public List<SurveyQuestionDTO>questionList(int surveyId);

	public List<SurveyQuestionDTO> getQuestionList(int surveySeq);
		
	void sendMessage(int surveySeq);
	
	void DeleteQuestion(int questionSeq);
	
	void deleteItemByQSeq(SurveyQuestionDTO SQD);
	
	List<SurveyListDTO> searchListByKeyword(PagingDTO pagingdto);

	List<Map<String, Object>> selectQuestionBySeq(int questionSeq);
	
	List<Map<String, Object>> selectItems(int questionSeq);
}



	

	
>>>>>>> refs/remotes/origin/cbj2
