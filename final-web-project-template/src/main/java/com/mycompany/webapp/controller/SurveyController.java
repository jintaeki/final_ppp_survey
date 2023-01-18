package com.mycompany.webapp.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyItemDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.service.ICommonCodeService;
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


	@Autowired
	ICommonCodeService commonCodeService;



	@RequestMapping("/surveydetails")
	public String surveyDetails() {
		logger.info("실행");
		//log.info("실행");
		return "survey_details";
	}
	@RequestMapping("/surveyevaluate/{surveySeq}")
	public String surveyEvaluate(@PathVariable int surveySeq) {
		logger.info("실행");
		System.out.println(surveySeq);
		//log.info("실행");
		return "survey_evaluate";
	}

	// 목록에서 설문지 이름을 누르면 설문 관리 페이지로 이동하는 컨트롤러
		@RequestMapping("/surveyinsert2")
		public String survey_insert2(@RequestParam("surveyseq") int surveySeq, Model model, HttpSession session) {
			System.out.println("이름을 통해:"+surveySeq);
			if(!String.valueOf(session.getAttribute("SLD")).equals("null")) {
				SurveyListDTO SLD = (SurveyListDTO) session.getAttribute("SLD");
				session.removeAttribute("SLD");
				model.addAttribute("SLD", SLD);
			}else {
				model.addAttribute("SLD",surveyService.selectSurvey(surveySeq));
				model.addAttribute("SQL", surveyService.getQuestionList(surveySeq));
			//	System.out.println(surveyService.getQuestionList(surveySeq));
			}

			return "survey_insert2";
		}


	@RequestMapping("/sendmessage.do/{surveyseq}/{pageno}")
	@ResponseBody
	public String sendmessage(@PathVariable int surveyseq , @PathVariable int pageno) {

		surveyService.sendMessage(surveyseq);

		return "성공";
	}



	@RequestMapping("/surveysearch")
	public String search(@RequestParam(defaultValue="") String keyword,
						 @RequestParam(defaultValue="1") int pageNo,
						 @RequestParam(defaultValue="30005") String selection,
						 @RequestParam(required=false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date surveyStartDate,
						 HttpSession session, Model model) {

		model.addAttribute("commonCodeList",commonCodeService.selectStateCode());
		logger.info("지금 가져온 선택지:"+selection);
		logger.info("페이지 수"+pageNo);
		logger.info("키워드"+keyword);
		logger.info("날짜"+surveyStartDate);
		try {

			List<SurveyListDTO> surveylist = null;
			PagingDTO pagingdto = null;
			String beforeKeyword = keyword;

				int totalRows = pagingService.getTotalBoardNum(keyword, selection, surveyStartDate);
				System.out.println("totolRows:" + totalRows);
				pagingdto = new PagingDTO(7, 7, totalRows, pageNo);
				pagingdto.setSelection(selection);
				pagingdto.setKeyword(keyword);

				pagingdto.setSurveyStartDate(surveyStartDate);
				logger.info("selection:" + pagingdto.getSelection());
				logger.info("keyword: "+pagingdto.getKeyword());
				surveylist = surveyService.searchListByKeyword(pagingdto);
				logger.info("리스트:" +surveylist.toString());
				pagingdto.setKeyword(beforeKeyword);
				logger.info(pagingdto.toString());


			model.addAttribute("surveylist", surveylist);

			logger.info(keyword);
			System.out.println(pageNo);

			model.addAttribute("pagingdto", pagingdto);
			model.addAttribute("keyword", keyword);

		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("하이?");
		return "survey_search";
	}



	@RequestMapping("/surveyresultteam")
	public String surveySuccess() {
		logger.info("실행");
		//log.info("실행");
		return "survey_result_team";
	}

	@RequestMapping("/surveyresult")
	public String surveyResult() {
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

		return "redirect:/survey/surveyinsert2?surveyseq="+SLD.getSurveySeq();

	}


	// 설문 설정 변경
	@RequestMapping(value="/updatesurvey.do")
	@ResponseBody
	public SurveyListDTO updateSurvey(@ModelAttribute ("SLD") @Valid SurveyListDTO SLD, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		//public String updateSurvey(SurveyListDTO SLD, Model model) {
		logger.info("모달창을 통해 설문 등록 페이지 진입");
		logger.info(SLD.toString());
		surveyService.updateSurvey(SLD);

		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("decideCheck", SLD.getDecideCheck());

		String json = jsonObject.toString();*/
		return SLD;

	}


	//문항 등록
			@RequestMapping(value="insertItem.do")
			@ResponseBody
			public SurveyQuestionDTO insertItem(@ModelAttribute ("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,Model model, RedirectAttributes redirectAttrs) {
				logger.info("insertItem.do");
				logger.info(SQD.toString());

				String checkCode = SQD.getQuestionTypeCode();
				try {
					if(checkCode.equals("10001")) {
						surveyService.deleteItemByQSeq(SQD);
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
							surveyService.insertItem(SQD);
						}
					}else if(checkCode.equals("10002")) {
						surveyService.deleteItemByQSeq(SQD);
						surveyService.insertItem(SQD);

					}else if(checkCode.equals("10003")) {
						surveyService.deleteItemByQSeq(SQD);
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
							surveyService.insertItem(SQD);
						}
					}
				}catch(Exception e) {
					e.printStackTrace();
					redirectAttrs.addFlashAttribute("message", e.getMessage());
				}



				return SQD;
			}



	// 문항 수정
		@RequestMapping(value="/updateitem.do")
		@ResponseBody
		public SurveyQuestionDTO updateitem(@ModelAttribute ("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,Model model, RedirectAttributes redirectAttrs) {
			logger.info("updateitem.do");
			logger.info(SQD.toString());




			String checkCode = SQD.getQuestionTypeCode();
			try {
				if(checkCode.equals("10001")) {
//					surveyService.deleteItemByQSeq(SQD);
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
						System.out.println("컨텐츠:"+SQD.getItemContent());
						System.out.println("스코어"+SQD.getItemScore());
						surveyService.updateItem(SQD);
					}
				}else if(checkCode.equals("10002")) {
					surveyService.deleteItemByQSeq(SQD);
					surveyService.updateItem(SQD);

				}else if(checkCode.equals("10003")) {
					surveyService.deleteItemByQSeq(SQD);
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
						surveyService.updateItem(SQD);
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
	public  List<Map<String, Object>> selectQuestion(@PathVariable int surveySeq,Model model) {
		logger.info("문제 뿌리기 컨트롤 ");


		System.out.println(surveyService.selectQuestion(surveySeq));
		return surveyService.selectQuestion(surveySeq) ;
	}

// 문항 비동기식으로 출력
	@RequestMapping(value="/selectitems.do/{questionseq}")
	@ResponseBody
	public  List<Map<String, Object>> selectItems(@PathVariable int questionseq, Model model) {
		logger.info("문항 뿌리기 컨트롤 ");

		logger.info(surveyService.selectItems(questionseq).toString());
		//		System.out.println(surveyService.selectQuestion(surveySeq));
		return surveyService.selectItems(questionseq) ;
	}

	//문제 등록
		@RequestMapping(value="/insertquestion.do")
		@ResponseBody
		public  SurveyQuestionDTO insertQuestion(@ModelAttribute("SQD") @Valid  SurveyQuestionDTO SQD, BindingResult result ,Model model) {
			logger.info("문제 생성 진입했나?");
			model.addAttribute("SQD",SQD);
			surveyService.insertQuestion(SQD);

			return SQD;
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
		@RequestMapping("/updatequestion.do")
		@ResponseBody
		public SurveyQuestionDTO updatequestion(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result, Model model) {
			logger.info("업데이트 진입");
			logger.info("sqd값" + SQD.toString());
			//int questionId = SQD.getQuestionId();
			surveyService.UpdateQuestion(SQD);
			System.out.println(SQD);

			logger.info(SQD.toString());
			//surveyService.getQuestionList(surveyId);
			logger.info("업데이트 성공");
			return SQD;
		}

		@RequestMapping(value="/deletequestion.do/{questionSeq}")
		@ResponseBody
		public void questionDelete(@PathVariable int questionSeq) {
			logger.info("문제 삭제 진입");
			logger.info("삭제할 문제 id: " + questionSeq);
			surveyService.DeleteQuestion(questionSeq);
		}


	//문제 선택 시 데이터 가져오기
	@RequestMapping(value="/touchandselect.do/{questionSeq}/{surveySeq}")
	@ResponseBody
	public List<Map<String, Object>> touchAndSelect(@PathVariable int questionSeq, @PathVariable int surveySeq) {
		logger.info("touchandselect 진입");
		System.out.println(surveyService.selectQuestionBySeq(questionSeq,surveySeq));
		return surveyService.selectQuestionBySeq(questionSeq,surveySeq);
	}



	//문항 등록
	public SurveyQuestionDTO itemInsert(@ModelAttribute ("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,Model model, RedirectAttributes redirectAttrs) {
		logger.info("문항생성 Controller 진입");

		return SQD;
	}





// 진택
	// 등록완료 돌아가기
	@RequestMapping("/surveyinsertcomplete.do/{surveyseq}")
	public String SurveyInsertComplete (@PathVariable int surveyseq ) {
		surveyService.surveyInsertComplete(surveyseq);

		return "redirect:/survey/surveysearch";
	}

	@RequestMapping("/deletesurvey.do/{surveyseq}/{pageno}/{date}/{keyword}/{selection}")
	public String DeleteSurvey (@PathVariable int surveyseq,
								@PathVariable int pageno,
								@PathVariable(required=false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
								@PathVariable String selection,
								@PathVariable String keyword){

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = (String)sdf.format(date);
		if(sdf.format(date).equals("1111-11-11")) {
			strDate = "";
		}
		if(keyword.equals("empty")) {
			keyword="";
		}

		logger.info("deletesurvey 컨트롤러 진입");
//		surveyService.deleteSurvey(surveyseq);
		return "redirect:/survey/surveysearch?pageNo="+pageno+"&keyword="+keyword+"&selection="+selection+"&surveyStartDate="+strDate;

	}


	}