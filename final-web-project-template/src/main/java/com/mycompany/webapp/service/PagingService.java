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
	public int getTotalBoardNum(String keyword, String selection, Date surveyStartDate, String anonyMityCheckCode) {
		return pagingRepo.getTotalBoardNum(keyword, selection, surveyStartDate, anonyMityCheckCode);
	}

	@Override
	public int getTotalMappingNum(String keyword, String selection, int surveySeq, String selectGD) {
		return pagingRepo.getTotalMappingNum(keyword, selection, surveySeq, selectGD);
	}
	public int getEvaluateTotalBoardNum(String keyword, String selection) {
		return pagingRepo.getEvaluateTotalBoardNum(keyword, selection);
	}


	@Override
	public int getTotalNonMappingNum(String keyword, String selection, int surveySeq, String selectGD) {
		return pagingRepo.getTotalNonMappingNum(keyword, selection, surveySeq, selectGD);
	}

	@Override
	public int getTotalInsertNum(String keyword, String selection, int surveySeq, String selectGD, String raterId, int month) {
		return pagingRepo.getTotalInsertNum(keyword, selection, surveySeq, selectGD, raterId, month);
	}
}
