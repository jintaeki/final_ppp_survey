package com.mycompany.webapp.dao;


import java.util.List;

import com.mycompany.webapp.dto.UserCheckDTO;

public interface ILoginCheckRepository {

	public int checkUser(UserCheckDTO UCD);
	
	public List<UserCheckDTO> getUserInfo(UserCheckDTO UCD);
	
	public String getUserManagerYN(UserCheckDTO UCD);
	
	public String getQuestion(int surveySeq);
}
