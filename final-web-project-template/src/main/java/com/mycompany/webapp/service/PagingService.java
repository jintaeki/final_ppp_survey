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
	public int getTotalBoardNum(String keyword, String selection,  Date surveyStartDateLeft,Date surveyStartDateRight, String anonyMityCheckCode) {
		System.out.println(surveyStartDateLeft);
		System.out.println(keyword);
		System.out.println(selection);
		System.out.println(anonyMityCheckCode);
		return pagingRepo.getTotalBoardNum(keyword, selection, surveyStartDateLeft, surveyStartDateRight, anonyMityCheckCode);
	}

	@Override
	public int getEvaluateSearchBoardNum(String keyword, String selection, String selection2, int surveySeq) {
		return pagingRepo.getEvaluateSearchBoardNum(keyword, selection, selection2, surveySeq);
	}
	@Override
	public int getTotalMappingNum(String keyword, String selection, int surveySeq, String selectGD) {
		return pagingRepo.getTotalMappingNum(keyword, selection, surveySeq, selectGD);
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
