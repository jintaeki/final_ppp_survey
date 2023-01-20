package com.mycompany.webapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ILoginCheckRepository;
import com.mycompany.webapp.dto.UserCheckDTO;

@Service
public class LoginCheckService implements ILoginCheckService{

	@Autowired
	ILoginCheckRepository loginCheckRepository;
	
	@Override
	public int checkUser(UserCheckDTO UCD) {
		
		return loginCheckRepository.checkUser(UCD);
	}

	@Override
	public List<UserCheckDTO> getUserInfo(UserCheckDTO UCD) {
		
		return loginCheckRepository.getUserInfo(UCD);
	}

	@Override
	public String getUserManagerYN(UserCheckDTO UCD) {
	
		return loginCheckRepository.getUserManagerYN(UCD);
	}

	@Override
	public List<Map<String, Object>> getQuestion(int surveySeq) {
		
		return loginCheckRepository.getQuestion(surveySeq);
	}

	
	
}
