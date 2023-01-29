package com.mycompany.webapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.CommonDTO;


public interface ICommonCodeRepository {
	// 상태 코드 목록 불러오기
	public List<CommonDTO> selectStateCode();
	
	// 계월수 조건
	public List<CommonDTO> selectDateCode();
	
	// 매핑 검색 조건
	public List<CommonDTO> selectMappingCode();

	public List<CommonDTO> selectEvaluateCode();
	
	public List<CommonDTO> selectStatisticCode();
}
