package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IPagingRepository {

	int getTotalBoardNum();
	
	public int getTotalListNumByKeyword(@Param("keyword") String keyword, @Param("selection") String selection);
	
	public int getTotalListNumByKeywordAndDecideYN(@Param("keyword") String keyword, @Param("selection") String selection);
	
	public int getTotalListNumByKeywordAndDate(@Param("keyword") String keyword, @Param("selection") String selection);
}
