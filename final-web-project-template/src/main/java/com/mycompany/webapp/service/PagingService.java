package com.mycompany.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.IPagingRepository;

@Service
public class PagingService implements IPagingService{

	@Autowired
	IPagingRepository pagingRepo;
	
	@Override
	public int getTotalBoardNum() {
		return pagingRepo.getTotalBoardNum();
	}

	@Override
	public int getTotalListNumByKeyword(String keyword, String selection) {
		String newkeyword = ("%"+keyword+"%");
		return pagingRepo.getTotalListNumByKeyword(newkeyword , selection);
	}
	
	@Override
	public int getTotalListNumByKeywordAndDecideYN(String keyword, String selection) {
		String newkeyword = ("%"+keyword+"%");
		return pagingRepo.getTotalListNumByKeywordAndDecideYN(newkeyword , selection);
	}
	
	@Override
	public int getTotalListNumByKeywordAndDate(String keyword, String selection) {
		String newkeyword = ("%"+keyword+"%");
		return pagingRepo.getTotalListNumByKeywordAndDate(newkeyword , selection);
	}
}
