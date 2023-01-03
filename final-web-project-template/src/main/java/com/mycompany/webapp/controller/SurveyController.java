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

import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.service.ISurveyService;

@Controller
public class SurveyController {
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);

	@Autowired
	ISurveyService ISS;
	

	
	
	
	// 모달창을 통해 설문 등록 페이지로 이동
	@RequestMapping(value="/survey/set.do", method=RequestMethod.POST)
	public String setSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result,Model model) {
		logger.info("모달창을 통해 설문 등록 페이지 진입");
		ISS.setSurvey(SLD);
		model.addAttribute("SLD",SLD);
		return "/survey_insert";
				
	}
	
//	// 모달창을 통해 설문 등록 페이지로 이동
//	@RequestMapping(value="/set", method=RequestMethod.POST)
//	public String setSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result,Model model) {
//		logger.info("모달창을 통해 설문 등록 페이지 진입");
//		ISS.setSurvey(SLD);
//		model.addAttribute("SLD",SLD);
//		return "/survey_insert";
//				
//	}
	
}
