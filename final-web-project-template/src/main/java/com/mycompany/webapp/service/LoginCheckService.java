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
	public List<UserCheckDTO> getUserInfo(String raterId, int surveySeq) {
		
		return loginCheckRepository.getUserInfo(raterId,surveySeq);
	}

	@Override
	public String getUserManagerYN(UserCheckDTO UCD) {
	
		return loginCheckRepository.getUserManagerYN(UCD);
	}

	@Override
	public List<Map<String, Object>> getQuestion(int surveySeq) {
		
		return loginCheckRepository.getQuestion(surveySeq);
	}

	@Override
	public List<Map<String, Object>> getSurveySeqAndName(String raterId) {
		
		return loginCheckRepository.getSurveySeqAndName(raterId);
	}

	@Override
	public int getNansu() {
	
		return loginCheckRepository.getNansu();
	}

	
	
}
