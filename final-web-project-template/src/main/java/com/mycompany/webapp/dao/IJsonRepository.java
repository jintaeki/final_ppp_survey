package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.DTO_for_json;
import com.mycompany.webapp.dto.DTO_for_json2;
import com.mycompany.webapp.dto.OrganizationChartDTO;
import com.mycompany.webapp.dto.ProjectHistoryDTO;

public interface IJsonRepository {
	public void insert_into_groupinfo(DTO_for_json dto);
	public void insert_into_pjhistorys(DTO_for_json2 dto2);
	public void insert_into_mappingtable();
	public List<ProjectHistoryDTO> getHistoryList();
	public List<OrganizationChartDTO> getOCList();
}
