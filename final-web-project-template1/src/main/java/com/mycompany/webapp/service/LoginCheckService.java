package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ILoginCheckRepository;
import com.mycompany.webapp.dto.UserCheckDTO;

@Service
public class LoginCheckService implements ILoginCheckService{

	@Autowired
	ILoginCheckRepository LCR;
	
	@Override
	public int checkUser(UserCheckDTO UCD) {
		
		return LCR.checkUser(UCD);
	}

	@Override
	public List<UserCheckDTO> getUserInfo(UserCheckDTO UCD) {
		
		return LCR.getUserInfo(UCD);
	}

	@Override
	public String getUserManagerYN(UserCheckDTO UCD) {
	
		return LCR.getUserManagerYN(UCD);
	}

	
	
}
