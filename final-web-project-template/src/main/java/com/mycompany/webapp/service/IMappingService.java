package com.mycompany.webapp.service;

import java.util.List;

import com.mycompany.webapp.dto.PopupDTO;

public interface IMappingService {
	
	// 병준
	PopupDTO selectPopup (String surveyName); // 조회
	List<PopupDTO> getPopup();	
}
	