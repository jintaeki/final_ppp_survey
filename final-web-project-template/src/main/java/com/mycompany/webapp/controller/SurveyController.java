package com.mycompany.webapp.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import javax.validation.Valid;

import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.service.ISurveyService;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);

	@Autowired
	ISurveyService surveyService;
	

	@RequestMapping("")
	public String survey() {
		logger.info("실행");
		//log.info("실행");
		return "survey";
	}

	@RequestMapping("/surveydetails")
	public String survey_details() {
		logger.info("실행");
		//log.info("실행");
		return "survey_details";
	}
	@RequestMapping("/surveyevaluate")
	public String survey_evaluate() {
		logger.info("실행");
		//log.info("실행");
		return "survey_evaluate";
	}
	@RequestMapping("/surveyinsert")
	public String survey_insert() {
		logger.info("실행");
		//log.info("실행");
		
		
		return "survey_insert";
	}
	
	
	@RequestMapping(value="/surveylist" , method=RequestMethod.GET)
	public String survey_list(Model model) {
	
//		model.addAttribute("SLD", new SurveyListDTO());
		logger.info("실행");
		//log.info("실행");
		return "survey_list";
	}
	@RequestMapping("/surveyresultteam")
	public String survey_success() {
		logger.info("실행");
		//log.info("실행");
		return "survey_result_team";
	}
	@RequestMapping("/surveyresult")
	public String survey_result() {
		logger.info("실행");
		//log.info("실행");
		return "survey_result";
	}
	
	
	// 모달창을 통해 설문 등록 페이지로 이동
	@RequestMapping(value="/set.do", method=RequestMethod.POST)
	public String setSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result,Model model) {
		logger.info("모달창을 통해 설문 등록 페이지 진입");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String Sdate = transFormat.format(SLD.getSurveyStartDate());
		String Cdate = transFormat.format(SLD.getSurveyClosedDate());
		System.out.println(Cdate);
		model.addAttribute("Sdate",Sdate);
		model.addAttribute("Cdate",Cdate);
		SLD.setSurveyId(surveyService.selectMaxSurveyId()+1);
		logger.info(SLD.toString());
		surveyService.setSurvey(SLD);
		model.addAttribute("SLD",SLD);
		return "/survey_insert";
				
	}
	
	// 모달창을 통해 설문 등록 페이지로 이동
	@RequestMapping(value="/surveyupdate.do")
	@ResponseBody
	public SurveyListDTO updateSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result, Model model) {
	//public String updateSurvey(SurveyListDTO SLD, Model model) {
		logger.info("모달창을 통해 설문 등록 페이지 진입");
		logger.info(SLD.toString());
		surveyService.setSurveyUpdate(SLD);

		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("decideCheck", SLD.getDecideCheck());

		String json = jsonObject.toString();*/
		return SLD;
				
	}
	
	// 모달창을 통해 설문 등록 페이지로 이동
	@RequestMapping(value="/itemupdate.do")
	@ResponseBody
	public SurveyQuestionDTO updateitem(@ModelAttribute ("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,Model model) {
		logger.info("모달창을 통해 설문 등록 페이지 진입");
		logger.info(SQD.toString());
//		ISS.setItemUpdate(SQD);
		
		String itemcontents = SQD.getItemContent();
		
		int cnt = itemcontents.length()-itemcontents.replace(",", "").length();
		String  [] itmencontent = itemcontents.split(",");
		for(int i =0; i <= cnt;i++) { 
			logger.info(itmencontent[i]);
		}
//		JSONParser parser = new JSONParser();
//		Object obj = null;
//		try {
//			obj = parser.parse(SQD.getItemContent());
//		} catch (org.json.simple.parser.ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		JSONArray jsonArr = (JSONArray) obj;
//		System.out.println(jsonArr.size());
		logger.info(Integer.toString(cnt));
		logger.info(itemcontents);
		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("decideCheck", SLD.getDecideCheck());

		String json = jsonObject.toString();*/
		return SQD;
				
	}
	


	/*
	@RequestMapping(value="survey/questioninsert.do/{surveyListDTO}", method=RequestMethod.GET)
	public String getSurveyInfo(Model model){
			
			return "common/survey_insert";
		}
	*/
	//문제 등록
	@RequestMapping(value="/questioninsert.do")
	@ResponseBody
	public  SurveyQuestionDTO insertSurvey(@ModelAttribute("SQD") @Valid  SurveyQuestionDTO SQD, BindingResult result ,Model model) {
			logger.info("문제 생성 진입했나?");
			model.addAttribute("SQD",SQD);
			surveyService.setQuestInsert(SQD);
			
			return SQD;
		}	
	
	//문항 수정
	@RequestMapping(value="survey/iteminsert.do", method=RequestMethod.POST)
	public String updateItem(@ModelAttribute("SID") @Valid SurveyItemDTO SID, BindingResult result) {
			
			
		return null;
		
	}
	
	
	//문제 비동기 조회
	@RequestMapping(value="/questionList.do")
	@ResponseBody
	public SurveyQuestionDTO questionList(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result, Model model, int surveyId) {
		logger.info("문제 비동기 조회");
		SurveyQuestionDTO questionList = surveyService.getQuestionList(surveyId);
		model.addAttribute("questionList", questionList);
		logger.info("제 비동기 조회 dto: " + SQD);
		
		return SQD;
	}
	
	
	//문제 업데이트
	@RequestMapping(value="/questionUpdate.do")
	@ResponseBody
	public SurveyQuestionDTO questionUpdate(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD,int surveyId, BindingResult result, Model model) {
		logger.info("업데이트 진입");
		surveyService.setQuestUpdate(SQD);
		surveyService.getQuestionList(surveyId);
		return SQD;
	}
}

