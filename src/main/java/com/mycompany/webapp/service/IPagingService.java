package com.mycompany.webapp.service;

public interface IPagingService {


	int getTotalBoardNum();

	public int getTotalListNumByKeyword(String keyword, String selection);

	public int getTotalListNumByKeywordAndDecideYN(String keyword, String selection);

	public int getTotalListNumByKeywordAndDate(String keyword, String selection);
}
