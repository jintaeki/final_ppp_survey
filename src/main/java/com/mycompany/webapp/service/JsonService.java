package com.mycompany.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IJsonRepository;
import com.mycompany.webapp.dto.DTO_for_json;
import com.mycompany.webapp.dto.DTO_for_json2;

@Service
public class JsonService implements IJsonService{

	@Autowired
	IJsonRepository ijr;
	
	
	@Override
	public void insert_into_groupinfo(DTO_for_json dto) {
		ijr.insert_into_groupinfo(dto);
	}


	@Override
	public void insert_into_pjhistorys(DTO_for_json2 dto2) {
		ijr.insert_into_pjhistorys(dto2);		
	}


	@Override
	public void insert_into_mappingtable() {
		ijr.insert_into_mappingtable();
		
	}
	
}
