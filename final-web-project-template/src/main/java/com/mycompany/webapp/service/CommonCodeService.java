package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ICommonCodeRepository;
import com.mycompany.webapp.dto.CommonDTO;

@Service
public class CommonCodeService implements ICommonCodeService{

	@Autowired
	ICommonCodeRepository CCR;
	
	
	@Override
	public List<CommonDTO> selectStateCode() {
		// TODO Auto-generated method stub
		return 	CCR.selectStateCode();

	}


	@Override
	public List<CommonDTO> selectDateCode() {
		// TODO Auto-generated method stub
		return CCR.selectDateCode();
	}

	@Override
	public List<CommonDTO> selectMappingCode() {
		// TODO Auto-generated method stub
		return CCR.selectMappingCode();
	}

}
