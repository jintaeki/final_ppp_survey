package com.mycompany.webapp.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ExcelRead;
import com.mycompany.webapp.dao.ExcelReadOption;
import com.mycompany.webapp.dao.ILoginCheckRepository;
import com.mycompany.webapp.dto.OrganizationChartDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;
import com.mycompany.webapp.dto.UserCheckDTO;

@Service
public class LoginCheckService implements ILoginCheckService{

	@Autowired
	ILoginCheckRepository loginCheckRepository;

	@Override
	public int checkUser(UserCheckDTO UCD) {

		return loginCheckRepository.checkUser(UCD);
	}

	@Override
	public List<UserCheckDTO> getUserInfo(String raterId, int surveySeq) {

		return loginCheckRepository.getUserInfo(raterId,surveySeq);
	}

	@Override
	public UserCheckDTO getUserManagerYN(String raterId, String password) {

		return loginCheckRepository.getUserManagerYN(raterId, password);
	}

	@Override
	public List<Map<String, Object>> getQuestion(int surveySeq) {

		return loginCheckRepository.getQuestion(surveySeq);
	}

	@Override
	public List<Map<String, Object>> getSurveySeqAndName(String raterId) {

		return loginCheckRepository.getSurveySeqAndName(raterId);
	}

	@Override
	public int getNansu() {

		return loginCheckRepository.getNansu();
	}

	@Override
	public int checkNansu(int nanSu) {

		return loginCheckRepository.checkNansu(nanSu);
	}

	@Override
	public void insertResult(SurveyResultDTO SRD) {

		loginCheckRepository.insertResult(SRD);
	}

	@Override
	public SurveyListDTO getAnonimityCode(int surveySeq) {

		return loginCheckRepository.getAnonimityCode(surveySeq);
	}

	@Override
	public void completeSurvey(String surveySeq, String appraiseeId, String raterId) {

		loginCheckRepository.completeSurvey(surveySeq, appraiseeId, raterId);
	}

	  @Override
	    public void excelUploadOCD(File destFile) {

	        ExcelReadOption excelReadOption = new ExcelReadOption();

	        //파일경로 추가
	        excelReadOption.setFilePath(destFile.getAbsolutePath());

	        //추출할 컬럼명 추가
	        excelReadOption.setOutputColumns("A", "B", "C");

	        //시작행
	        excelReadOption.setStartRow(2);

	        List<Map<String, String>>excelContent  = ExcelRead.read(excelReadOption);

	        Map<String, Object> paramMap = new HashMap<String, Object>();
	        paramMap.put("excelContent", excelContent);

	        try {
	            loginCheckRepository.insertExcelOCD(paramMap);
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	    }

	  @Override
	    public void excelUploadPH(File destFile) {

	        ExcelReadOption excelReadOption = new ExcelReadOption();

	        //파일경로 추가
	        excelReadOption.setFilePath(destFile.getAbsolutePath());

	        //추출할 컬럼명 추가
	        excelReadOption.setOutputColumns("A", "B");

	        //시작행
	        excelReadOption.setStartRow(2);

	        List<Map<String, String>>excelContent  = ExcelRead.read(excelReadOption);

	        Map<String, Object> paramMap = new HashMap<String, Object>();
	        paramMap.put("excelContent", excelContent);

	        try {
	            loginCheckRepository.insertExcelPH(paramMap);
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
}
