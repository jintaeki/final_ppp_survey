package com.mycompany.webapp.service.json;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dto.DTO_for_json;
import com.mycompany.webapp.dto.DTO_for_json2;

@Service
public interface IJsonService {
	
	public void insert_into_groupinfo(DTO_for_json dto);
	public void insert_into_pjhistorys(DTO_for_json2 dto2);
	public void insert_into_mappingtable();

}
