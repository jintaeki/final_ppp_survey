package com.mycompany.webapp.service.json;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dto.DTO_for_json;
import com.mycompany.webapp.dto.DTO_for_json2;
import com.mycompany.webapp.dto.OrganizationChartDTO;
import com.mycompany.webapp.dto.ProjectHistoryDTO;

@Service
public interface IJsonService {
	
	public void insert_into_groupinfo(DTO_for_json dto);
	public void insert_into_pjhistorys(DTO_for_json2 dto2);
	public void insert_into_mappingtable();
	public List<ProjectHistoryDTO> getHistoryList();
	public List<OrganizationChartDTO> getOCList();

}
