package com.mycompany.webapp.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IPagingRepository;

@Service
public class PagingService implements IPagingService{

	@Autowired
	IPagingRepository pagingRepo;
	
	@Override
	public int getTotalBoardNum(String keyword, String selection, Date surveyStartDate) {
		return pagingRepo.getTotalBoardNum(keyword, selection, surveyStartDate);
	}

	
}
