<<<<<<< HEAD
package com.mycompany.webapp.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IPagingRepository;

@Service
public class PagingService implements IPagingService{

	@Autowired
	IPagingRepository pagingRepo;
<<<<<<< HEAD

	@Override
	public int getTotalBoardNum(String keyword, String selection, Date surveyStartDate, String anonyMityCheckCode) {
		return pagingRepo.getTotalBoardNum(keyword, selection, surveyStartDate, anonyMityCheckCode);
	}


=======
	
	@Override
	public int getTotalBoardNum(String keyword, String selection, Date surveyStartDate) {
		return pagingRepo.getTotalBoardNum(keyword, selection, surveyStartDate);
	}

	
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
}
=======
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
>>>>>>> refs/remotes/origin/cbj2
