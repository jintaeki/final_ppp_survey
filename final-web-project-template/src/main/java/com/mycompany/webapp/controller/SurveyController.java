package com.mycompany.webapp.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	// 설문 작성 페이지로 이동을 위한 컨트롤러
	@RequestMapping("/surveyinsert")
	public String survey_insert(Model model, HttpSession session) {
		logger.info("실행");
		
			if(String.valueOf(session.getAttribute("SLD")).equals("null")){
				
				model.addAttribute("surveylist", surveyService.selectSurveyList());
				return "survey_list";
			}else {
				SurveyListDTO SLD = (SurveyListDTO) session.getAttribute("SLD");
			session.removeAttribute("SLD");
			model.addAttribute("SLD", SLD);	
			return "survey_insert";
			}


		
	}
	// 목록에서 설문지 이름을 누르면 설문 관리 페이지로 이동하는 컨트롤러
	@RequestMapping("/surveyinsert/{surveySeq}")
	public String survey_insert2(@PathVariable int surveySeq, Model model) {
		model.addAttribute("SLD",surveyService.selectSurvey(surveySeq));
		return "survey_insert2";
	}

	// 설문지 목록으로 이동을 위한 컨트롤러
	@RequestMapping(value="/surveylist" , method=RequestMethod.GET)
	public String survey_list(Model model) {
		System.out.println(surveyService.selectSurveyList());
		model.addAttribute("surveylist", surveyService.selectSurveyList());
		
		logger.info("실행");
		
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
	public String setSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result, HttpSession session, RedirectAttributes redirectAttrs) {
		logger.info("모달창을 통해 설문 등록하는 컨트롤러 진입");
		//SLD.setSurveyId(surveyService.selectMaxSurveyId()+1);
		surveyService.setSurvey(SLD);
		session.setAttribute("SLD", SLD);

		return "redirect:/survey/surveyinsert";

	}


	// 설문 설정 변경
	@RequestMapping(value="/surveyupdate.do")
	@ResponseBody
	public SurveyListDTO updateSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		//public String updateSurvey(SurveyListDTO SLD, Model model) {
		logger.info("모달창을 통해 설문 등록 페이지 진입");
		logger.info(SLD.toString());
		surveyService.setSurveyUpdate(SLD);

		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("decideCheck", SLD.getDecideCheck());

		String json = jsonObject.toString();*/
		return SLD;

	}


	
	// 문항 수정
	@RequestMapping(value="/itemupdate.do")
	@ResponseBody
	public SurveyQuestionDTO updateitem(@ModelAttribute ("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,Model model, RedirectAttributes redirectAttrs) {
		logger.info("itemupdate.do");
		logger.info(SQD.toString());
		
		


		String checkCode = SQD.getQuestionTypeCode();
		try {
			if(checkCode.equals("10001")) {
//				surveyService.setItemDelete(SQD);
				// 문제 id, 점수, 문항내용, itemid, 각 각 받아야 한다
				// questionId, itemScore, itemContent, itemId

				// 다중 값들 문자열로 표현
				String itemcontents = SQD.getItemContent();
				String itemscores = SQD.getItemScore();

				// 문항 개수 
				int cntcontent = itemcontents.length()-itemcontents.replace(",", "").length();

				// 다중 값들을 배열로 변환
				String  [] itmencontent = itemcontents.split(",");
				String  [] itemscore = itemscores.split(",");
				// 문항 개수만큼 for문 실행하여 문항 등록
				for(int i = 0 ; i<=cntcontent;i++) {
					SQD.setItemContent(itmencontent[i]);
					SQD.setItemScore(itemscore[i]);	
					surveyService.setItemUpdate(SQD);
				}
			}else if(checkCode.equals("10002")) {
//				surveyService.setItemDelete(SQD);
				surveyService.setItemUpdate(SQD);

			}else if(checkCode.equals("10003")) {
//				surveyService.setItemDelete(SQD);
				// 문제 id, 점수, 문항내용, itemid, 각 각 받아야 한다
				// questionId, itemScore, itemContent, itemId

				// 다중 값들 문자열로 표현
				String itemcontents = SQD.getItemContent();
				String itemscores = SQD.getItemScore();

				// 문항 개수 
				int cntcontent = itemcontents.length()-itemcontents.replace(",", "").length();

				// 다중 값들을 배열로 변환
				String  [] itmencontent = itemcontents.split(",");
				String  [] itemscore = itemscores.split(",");

				// 문항 개수만큼 for문 실행하여 문항 등록
				for(int i = 0 ; i<=cntcontent;i++) {
					SQD.setItemContent(itmencontent[i]);
					SQD.setItemScore(itemscore[i]);	
					surveyService.setItemUpdate(SQD);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}



		return SQD;
	}

	// 문제 비동기식으로 출력 진택
	@RequestMapping(value="/selectquestion.do/{surveySeq}")
	@ResponseBody
	public  List<Map<String, Object>> selectquestion(@PathVariable int surveySeq,Model model) {
		logger.info("뿌리기 컨트롤 ");
		
		
		System.out.println(surveyService.selectQuestion(surveySeq));
		return surveyService.selectQuestion(surveySeq) ;
	}	




	/*
	@RequestMapping(value="survey/questioninsert.do/{surveyListDTO}", method=RequestMethod.GET)
	public String getSurveyInfo(Model model){
			
			return "common/survey_insert";
		}
	*/
	//문제 등록
	@RequestMapping(value="questioninsert.do")
	@ResponseBody
	public  SurveyQuestionDTO insertSurvey(@ModelAttribute("SQD") @Valid  SurveyQuestionDTO SQD, BindingResult result ,Model model) {
			logger.info("문제 생성 진입했나?");
			System.out.println("문제 생성 컨트롤러");
			model.addAttribute("SQD",SQD);
			surveyService.setQuestInsert(SQD);
			
			return SQD;
		}	
	
	//문항 수정
	@RequestMapping(value="survey/iteminsert.do", method=RequestMethod.POST)
	public String updateItem(@ModelAttribute("SID") @Valid SurveyItemDTO SID, BindingResult result, Model model, RedirectAttributes RedirectAttrs) {
		logger.info("문항 수정 Controller 진입");
		model.addAttribute("SID", SID);
			
		return null;
		
	}
	
	
	
	
	
	//문제 비동기 조회 채우

	@RequestMapping(value="/questionList.do/{surveySeq}")
	@ResponseBody
	public List<SurveyQuestionDTO> questionList(@PathVariable int surveySeq, Model model) {
		List<SurveyQuestionDTO> sqd = surveyService.questionList(surveySeq);
		logger.info("비동기 조회 진입");
		SurveyQuestionDTO questionList = surveyService.getQuestionList(surveySeq);
		model.addAttribute("questionList", questionList);
		logger.info("제 비동기 조회 dto: ");
		
		return sqd;
	}
	
	//문제 업데이트
	@RequestMapping(value="/questionUpdate.do")
	@ResponseBody
	public SurveyQuestionDTO questionUpdate(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result, Model model) {
		logger.info("업데이트 진입");
		logger.info(SQD.toString());
		//int questionId = SQD.getQuestionId();
		surveyService.setQuestUpdate(SQD);
		System.out.println(SQD);
		logger.info(SQD.toString());
		//surveyService.getQuestionList(surveyId);
		logger.info("업데이트 성공");
		return SQD;
	}
	
}

