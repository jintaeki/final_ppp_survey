package com.mycompany.webapp.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	ISurveyService surveySurvice;


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
	@RequestMapping("/surveyinsert1/{surveyId}")
	public String survey_insert(@PathVariable int surveyId, Model model, HttpSession session) {
		logger.info("실행");
		int checkSurveyId = ((SurveyListDTO) session.getAttribute("SLD")).getSurveyId();
		System.out.println(checkSurveyId);
		
		
		if(checkSurveyId==0) {
			SurveyListDTO SLD = (SurveyListDTO) session.getAttribute("SLD");
			// surveyId로 설문지의 설문 문제와 문항들 가져와서 model에 담자
			model.addAttribute("SLD", SLD);
		}else {

			SurveyListDTO SLD = (SurveyListDTO) session.getAttribute("SLD");
//			session.removeAttribute("SLD");
			model.addAttribute("SLD", SLD);	
		}
			
		
		return "survey_insert";
	}
	
	@RequestMapping("/surveyinsert")
	public String survey_insert_practice() {
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



	// 모달창을 통해 설문지 설정 데이터 입력
	@RequestMapping(value="/set.do", method=RequestMethod.POST)
	public String setSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result, HttpSession session) {
		logger.info("모달창을 통해 설문 등록하는 컨트롤러 진입");
		//SLD.setSurveyId(surveySurvice.selectMaxSurveyId()+1);
		surveySurvice.setSurvey(SLD);
		session.setAttribute("SLD", SLD);
		
		return "redirect:/survey/surveyinsert1/"+SLD.getSurveyId();

	}


	// 설문 설정 변경
	@RequestMapping(value="/surveyupdate.do")
	@ResponseBody
	public SurveyListDTO updateSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result, Model model) {
		//public String updateSurvey(SurveyListDTO SLD, Model model) {
		logger.info("모달창을 통해 설문 등록 페이지 진입");
		logger.info(SLD.toString());
		surveySurvice.setSurveyUpdate(SLD);

		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("decideCheck", SLD.getDecideCheck());

		String json = jsonObject.toString();*/
		return SLD;

	}

	// 문항 수정
	@RequestMapping(value="/itemupdate.do")
	@ResponseBody
	public SurveyQuestionDTO updateitem(@ModelAttribute ("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,Model model) {
		logger.info("itemupdate.do");
		logger.info(SQD.toString());
		
		
		
//		for(int i =0; i <= cntcontent;i++) { 
//			logger.info(itmencontent[i]);
//		}
		
		String checkCode = SQD.getQuestionTypeCode();
		if(checkCode.equals("10001")) {
			// 문제 id, 점수, 문항내용, itemid, 각 각 받아야 한다
			// questionId, itemScore, itemContent, itemId
			String itemcontents = SQD.getItemContent();
			String itemscores = SQD.getItemScore();
			int cntcontent = itemcontents.length()-itemcontents.replace(",", "").length();
//			int cntscores = itemscores.length() - itemscores.replace(",","").length();
			String  [] itmencontent = itemcontents.split(",");
			String  [] itemscore = itemscores.split(",");
			for(int i = 0 ; i<=cntcontent;i++) {
//				ISS.setItemUpdate(SQD);

			}
		}else if(checkCode.equals("10002")) {
			
		}else if(checkCode.equals("10003")) {
			
		}
	

		
		

		//		ISS.setItemUpdate(SQD);
		return SQD;

	}





	//문제 등록
	@RequestMapping(value="/questioninsert.do")
	@ResponseBody
	public  SurveyQuestionDTO insertSurvey(@ModelAttribute("SQD") @Valid  SurveyQuestionDTO SQD, BindingResult result ,Model model) {
			logger.info("문제 생성 진입했나?");
			model.addAttribute("SQD",SQD);
			surveySurvice.setQuestInsert(SQD);
			
			return SQD;
		}	


	
	
}

