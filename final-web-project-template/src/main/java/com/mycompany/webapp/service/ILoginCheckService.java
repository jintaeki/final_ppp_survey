package com.mycompany.webapp.service;

import java.util.List;

import com.mycompany.webapp.dto.UserCheckDTO;

public interface ILoginCheckService {

	public int checkUser(UserCheckDTO UCD);
	
	public List<UserCheckDTO> getUserInfo(UserCheckDTO UCD);
	
	public String getUserManagerYN(UserCheckDTO UCD);
}
