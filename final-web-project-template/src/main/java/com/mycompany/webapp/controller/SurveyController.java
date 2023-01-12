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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.service.IPagingService;
import com.mycompany.webapp.service.ISurveyService;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);

	@Autowired
	ISurveyService surveyService;

	@Autowired
	IPagingService pagingService;
	

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
	@RequestMapping("/surveyevaluate/{surveySeq}")
	public String survey_evaluate(@PathVariable int surveySeq) { 
		logger.info("실행");
		System.out.println(surveySeq);
		//log.info("실행");
		return "survey_evaluate";
	}
	// 설문 작성 페이지로 이동을 위한 컨트롤러
		@RequestMapping("/surveyinsert")
	public String survey_insert(@RequestParam(defaultValue="1") int pageNo,Model model, HttpSession session) {
		logger.info("실행");

		if(String.valueOf(session.getAttribute("SLD")).equals("null")){
			int totalRows= pagingService.getTotalBoardNum();

			PagingDTO pagingdto = new PagingDTO(5, 5, totalRows, pageNo);

			model.addAttribute("surveylist", surveyService.selectSurveyList(pagingdto));
			return "survey_list";
		}else {
			SurveyListDTO SLD = (SurveyListDTO) session.getAttribute("SLD");
			session.removeAttribute("SLD");
			model.addAttribute("SLD", SLD);	
			return "survey_insert";
		}


		}
			// 목록에서 설문지 이름을 누르면 설문 관리 페이지로 이동하는 컨트롤러
	@RequestMapping("/surveyinsert2")
	public String survey_insert(@RequestParam("surveyseq") int surveySeq, Model model) {
		model.addAttribute("SLD",surveyService.selectSurvey(surveySeq));
		model.addAttribute("SQL", surveyService.getQuestionList(surveySeq));
		System.out.println(surveyService.getQuestionList(surveySeq));
		return "survey_insert2";
	}

	@RequestMapping("/sendmessage.do/{surveyseq}/{pageno}")
	@ResponseBody
	public String sendmessage(@PathVariable int surveyseq , @PathVariable int pageno) {

		surveyService.sendMessage(surveyseq);

		return "성공";
	}
	
	// 설문지 목록으로 이동을 위한 컨트롤러
			@RequestMapping(value="/surveylist")
	public String survey_list(@RequestParam(defaultValue="1") int pageNo, Model model) {
		int totalRows= pagingService.getTotalBoardNum(); 

		PagingDTO pagingdto = new PagingDTO(5, 5, totalRows, pageNo);
		logger.info(surveyService.selectSurveyList(pagingdto).toString());

		model.addAttribute("surveylist", surveyService.selectSurveyList(pagingdto));
		model.addAttribute("pagingdto",pagingdto);
		logger.info("실행");

		return "survey_list";
	}
	
	@RequestMapping("/surveysearch")
	public String search(@RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int pageNo, 
			@RequestParam(defaultValue="") String selection, HttpSession session, Model model) {
		try {

			List<SurveyListDTO> surveylist = null; 
			PagingDTO pagingdto = null;
			String beforeKeyword = keyword;
			if (selection.equals("")) {
				logger.info("빈 키워드만 받음");
				int totalRows = pagingService.getTotalListNumByKeyword(keyword, selection);
				System.out.println("totolRows:" + totalRows);
				pagingdto = new PagingDTO(5, 5, totalRows, pageNo);
				pagingdto.setSelection(selection);
				pagingdto.setKeyword(keyword);
				logger.info("selection:" + pagingdto.getSelection());
				logger.info("keyword: "+pagingdto.getKeyword());
				surveylist = surveyService.searchListByKeyword(pagingdto);
				logger.info("리스트:" +surveylist.toString());
				pagingdto.setKeyword(beforeKeyword);
				logger.info(pagingdto.toString());
			}else if(selection.equals("Y") || selection.equals("N")) {
				logger.info("키워드와 발송여부 Y 받음");
				int totalRows = pagingService.getTotalListNumByKeywordAndDecideYN(keyword, selection);
				pagingdto = new PagingDTO(5, 5, totalRows, pageNo);
				pagingdto.setSelection(selection);
				pagingdto.setKeyword(keyword);
				logger.info(pagingdto.getSelection());
				logger.info(pagingdto.getKeyword());
				surveylist = surveyService.searchListByKeywordAndDicideYN(pagingdto);
				pagingdto.setKeyword(beforeKeyword);
			}else if (selection.equals("date")) {
				logger.info("키워드와 날짜기준 받음");
				int totalRows = pagingService.getTotalListNumByKeywordAndDate(keyword, selection);
				pagingdto = new PagingDTO(5, 5, totalRows, pageNo);
				pagingdto.setSelection(selection);
				pagingdto.setKeyword(keyword);	
				logger.info(pagingdto.getSelection());
				logger.info(pagingdto.getKeyword());
				surveylist = surveyService.searchListByKeywordAndDate(pagingdto);
				pagingdto.setKeyword(beforeKeyword);

			}

			model.addAttribute("surveylist", surveylist);

			logger.info(keyword);
			System.out.println(pageNo);
			model.addAttribute("pagingdto", pagingdto);
			model.addAttribute("keyword", keyword);

		} catch(Exception e) {
			e.printStackTrace();
		}
		return "survey_search";
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
				surveyService.setItemDelete(SQD);
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
				surveyService.setItemDelete(SQD);
				surveyService.setItemUpdate(SQD);

			}else if(checkCode.equals("10003")) {
				surveyService.setItemDelete(SQD);
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

	// 문제 비동기식으로 출력
	@RequestMapping(value="/selectquestion.do/{surveySeq}")
	@ResponseBody
	public  List<Map<String, Object>> selectquestion(@PathVariable int surveySeq,Model model) {
		logger.info("뿌리기 컨트롤 ");
		
		
		// System.out.println(surveyService.selectQuestion(surveySeq));
		return surveyService.selectQuestion(surveySeq) ;
	}	

// 문항 비동기식으로 출력 
	@RequestMapping(value="/selectitems.do/{questionseq}")
	@ResponseBody
	public  List<Map<String, Object>> selectitems(@PathVariable int questionseq, Model model) {
		logger.info("뿌리기 컨트롤 ");

		logger.info(surveyService.selectItems(questionseq).toString());
		//		System.out.println(surveyService.selectQuestion(surveySeq));
		return surveyService.selectItems(questionseq) ;
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
	public String updateItem(@ModelAttribute("SID") @Valid SurveyItemDTO SID, BindingResult result, Model model, RedirectAttributes RedirectAttrs) {
		logger.info("문항 수정 Controller 진입");
		model.addAttribute("SID", SID);

		return null;

	}
	
	
	//문제 비동기 조회 채우
	@RequestMapping(value="/questionList.do")
	@ResponseBody
	public List<SurveyQuestionDTO> questionList(@RequestParam("surveySeq") int surveySeq) {
		System.out.println("비동기 조회 컨트롤러 진입");
		List<SurveyQuestionDTO> ql = surveyService.getQuestionList(surveySeq);
		logger.info("비동기 조회 진입");
		logger.info("조회 seq:" + surveySeq);
		logger.info("문제 비동기 조회 dto: " + ql);
	
		
		return ql;
	}
	
	//문제 업데이트
	@RequestMapping(value="/questionUpdate.do")
	@ResponseBody
	public SurveyQuestionDTO questionUpdate(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result, Model model) {
		logger.info("업데이트 진입");
		logger.info("sqd값" + SQD.toString());
		//int questionId = SQD.getQuestionId();
		surveyService.setQuestUpdate(SQD);
		System.out.println(SQD);
		logger.info(SQD.toString());
		//surveyService.getQuestionList(surveyId);
		logger.info("업데이트 성공");
		return SQD;
	}
	
	@RequestMapping(value="/questionDelete.do/{questionSeq}")
	@ResponseBody
	public void questionDelete(@PathVariable int questionSeq) {
		logger.info("문제 삭제 진입");
		logger.info("삭제할 문제 id: " + questionSeq);
		surveyService.setQuestionDelete(questionSeq);
	}	

	@RequestMapping(value="/touchandselect.do/{questionSeq}")
	@ResponseBody
	public List<Map<String, Object>> touchandselect(@PathVariable int questionSeq) {
		logger.info("touchandselect 진입");
		System.out.println(questionSeq);


		System.out.println(surveyService.selectQuestionBySeq(questionSeq));
		return surveyService.selectQuestionBySeq(questionSeq);
	}
	
	}