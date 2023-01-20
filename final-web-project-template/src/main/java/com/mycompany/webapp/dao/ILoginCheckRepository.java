package com.mycompany.webapp.dao;


import java.util.List;
import java.util.Map;

import com.mycompany.webapp.dto.UserCheckDTO;

public interface ILoginCheckRepository {

	public int checkUser(UserCheckDTO UCD);
	
	public List<UserCheckDTO> getUserInfo(UserCheckDTO UCD);
	
	public String getUserManagerYN(UserCheckDTO UCD);
	
	public List<Map<String, Object>> getQuestion(int surveySeq);
}
