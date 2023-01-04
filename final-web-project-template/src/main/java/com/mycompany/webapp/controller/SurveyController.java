package com.mycompany.webapp.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import javax.validation.Valid;

import org.json.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.service.ISurveyService;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);

	@Autowired
	ISurveyService ISS;
	

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
		ISS.setSurvey(SLD);
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
		//ISS.setSurveyUpdate(SLD);
		//model.addAttribute("SLD",SLD);
		
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-d", Locale.KOREA);
//		LocalDate Ldate1 = LocalDate.parse((CharSequence) SLD.get("surveyStartDate"), formatter);
//		LocalDate Ldate2 = LocalDate.parse((CharSequence) SLD.get("surveyClosedDate"), formatter);
//		Date date = Date.valueOf(Ldate);
		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("surveyId", SLD.getSurveyId());
		jsonObject.put("surveyName", SLD.getSurveyName());
		jsonObject.put("surveyContent", SLD.getSurveyContent());
		jsonObject.put("anonymityCheckCode", SLD.getanonymityCheckCode());
		jsonObject.put("surveyStartDate", SLD.getSurveyStartDate());
		jsonObject.put("surveyClosedDate", SLD.getSurveyClosedDate());
		jsonObject.put("decideCheck", SLD.getDecideCheck());

		String json = jsonObject.toString();*/
		return SLD;
				
	}
	
}
