package com.mycompany.webapp.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.service.ISurveyService;

@Controller
public class SurveyController {
		static final Logger logger = LoggerFactory.getLogger(SurveyController.class);
		@Autowired
		ISurveyService surveySurvice;
		
		
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
		@RequestMapping(value="/surveyinsert", method=RequestMethod.GET)
		public String survey_insert(Model model) {
			logger.info("실행");
			//log.info("실행");
			return "survey_insert";
		}
		@RequestMapping("/surveylist")
		public String survey_list() {
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
		
		@RequestMapping("/survey")
		public String survey() {
			logger.info("실행");
			//log.info("실행");
			return "survey";
		}
		@RequestMapping("/mappingview")
		public String mapping_view() {
			logger.info("실행");
			//log.info("실행");
			return "home2";
		}
		
		
	//
	@RequestMapping(value="survey/questioninsert.do/{surveyListDTO}", method=RequestMethod.GET)
	public String getSurveyInfo(Model model){
			
			return "common/survey_insert";
		}
	
	//문제 등록
	@RequestMapping(value="survey/questioninsert.do/{surveyListDTO}", method=RequestMethod.POST)
	public String insertSurvey(@ModelAttribute("sqd") @Valid  SurveyQuestionDTO sqd, Model model, BindingResult result) {
			logger.info("문제 생성 진입했나?");
			surveySurvice.setQuestInsert(sqd);
			
			
			return "common/survey_insert";
		}	
	}
