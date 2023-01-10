package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.PopupDTO;

public interface IMappingRepository {
	
	// 병준
	PopupDTO selectPopup (String surveyName); // 조회
	List<PopupDTO> getPopup();				  // 전체 리스트 출력
	
}
