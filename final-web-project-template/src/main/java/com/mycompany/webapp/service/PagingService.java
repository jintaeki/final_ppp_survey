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
	public int getEvaluateMessageBoardNum(String keyword, String selection, String selection2, int surveySeq, String selectGD) {
		return pagingRepo.getEvaluateMessageBoardNum(keyword, selection, selection2, surveySeq, selectGD);
	}
	@Override
	public int getTotalMappingNum(String keyword, String keyword2, String selection, String selection2, int surveySeq, String selectGD) {
		return pagingRepo.getTotalMappingNum(keyword, keyword2, selection, selection2, surveySeq, selectGD);
	}

	@Override
	public int getTotalInsertNum(String keyword, String keyword2, String selection, String selection2, int surveySeq, String selectGD, String raterId, int month) {
		return pagingRepo.getTotalInsertNum(keyword, keyword2, selection, selection2, surveySeq, selectGD, raterId, month);
	}
}
