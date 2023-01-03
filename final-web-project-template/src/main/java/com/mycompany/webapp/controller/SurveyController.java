package com.mycompany.webapp.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.service.ISurveyService;

	@Controller
public class SurveyController {
		static final Logger logger = LoggerFactory.getLogger(SurveyController.class);
		@Autowired
		ISurveyService surveySurvice;
		
		
	@RequestMapping(value="/survey/questioninsert.do/{surveyListDTO}", method=RequestMethod.GET)
	public String getSurveyInfo(@ModelAttribute("sld") @Valid SurveyListDTO SLD){
			
		
		
			return "common/survey_insert";
		}
	
	@RequestMapping(value="/survey/questioninsert.do/{surveyListDTO}", method=RequestMethod.POST)
	public void insertSurvey(SurveyQuestionDTO SQD) {
		
		}
	}
