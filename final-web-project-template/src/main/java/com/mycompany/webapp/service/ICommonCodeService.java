package com.mycompany.webapp.service;

import java.util.List;

import com.mycompany.webapp.dto.CommonDTO;

public interface ICommonCodeService {
	
	public List<CommonDTO> selectStateCode();

	public List<CommonDTO> selectDateCode();
	
	public List<CommonDTO> selectMappingCode();
	
}
