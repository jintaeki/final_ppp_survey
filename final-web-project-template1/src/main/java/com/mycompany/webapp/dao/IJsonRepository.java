package com.mycompany.webapp.dao;

import com.mycompany.webapp.dto.DTO_for_json;
import com.mycompany.webapp.dto.DTO_for_json2;

public interface IJsonRepository {
	public void insert_into_groupinfo(DTO_for_json dto);
	public void insert_into_pjhistorys(DTO_for_json2 dto2);
	public void insert_into_mappingtable();

}
