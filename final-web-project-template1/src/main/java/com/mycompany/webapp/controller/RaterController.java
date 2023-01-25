package com.mycompany.webapp.controller;

import java.util.List;
import java.util.Map;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.service.ISurveyService;

@Controller
public class RaterController {
	private static final Logger logger = LoggerFactory.getLogger(RaterController.class);

	@Autowired
	ISurveyService surveyService;

	// 문제 비동기식으로 출력 
	@RequestMapping(value="/selectquestion.do/{surveySeq}")
	@ResponseBody
	public  List<Map<String, Object>> selectquestion(@PathVariable int surveySeq, Model model) {
		// logger.info("뿌리기 컨트롤 ");


		return surveyService.selectQuestion(surveySeq) ;
	}	

	// 문항 비동기식으로 출력 
	@RequestMapping(value="/selectitems.do/{questionseq}")
	@ResponseBody
	public  List<Map<String, Object>> selectitems(@PathVariable int questionseq, Model model) {

		// logger.info(surveyService.selectItems(questionseq).toString());
		return surveyService.selectItems(questionseq) ;
	}
}
