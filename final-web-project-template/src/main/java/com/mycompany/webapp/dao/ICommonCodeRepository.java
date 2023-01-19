package com.mycompany.webapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.CommonDTO;


public interface ICommonCodeRepository {

	public List<CommonDTO> selectStateCode();

	public List<CommonDTO> selectEvaluateCode();
}
