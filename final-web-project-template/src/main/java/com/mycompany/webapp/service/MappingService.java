package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IMappingRepository;
import com.mycompany.webapp.dto.PopupDTO;

@Service
public class MappingService implements IMappingService {

	@Autowired
	IMappingRepository mappingrepository;

	@Override
	public PopupDTO selectPopup(String surveyName) {
		return mappingrepository.selectPopup(surveyName);
	}

	@Override
	public List<PopupDTO> getPopup() {
		return mappingrepository.getPopup();
	}

}
