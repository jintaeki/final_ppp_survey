package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.webapp.dto.OrganizationChartDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;

import com.mycompany.webapp.dto.SurveyResultTeamDTO;
import com.mycompany.webapp.service.ICommonCodeService;
import com.mycompany.webapp.service.IMappingService;
import com.mycompany.webapp.service.IPagingService;
import com.mycompany.webapp.service.ISurveyService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);

	@Autowired
	ISurveyService surveyService;

	@Autowired
	IPagingService pagingService;

	@Autowired
	IMappingService mappingService;

	@Autowired
	ICommonCodeService commonCodeService;


	 Map<String, String> errors = new HashMap<>();

    @RequestMapping("/evaluateStart.do/{surveySeq}")
	@ResponseBody
	public String evaluateStart(@PathVariable int surveySeq) {
		mappingService.updateState(surveySeq, "30004");

		return "??????";
	}

	@RequestMapping("/sendmessage.do/{surveyseq}")
	@ResponseBody
	public String sendmessage(@PathVariable int surveyseq,
			                  @RequestParam("deliveryContent") String deliveryContent) {

		logger.info(deliveryContent);
		surveyService.updateEmail(surveyseq, deliveryContent);
		surveyService.updateSMS(surveyseq, deliveryContent);

		return "??????";
	}

	//?????? ??????????????? ??? ??????, ????????? ????????? ?????? ???????????? ??????
	@RequestMapping("/surveyresultteam.do")
	public String surveySuccess( Model model) {
		logger.info("??????");

		List<SurveyListDTO> Sdt = surveyService.surveyList();
		model.addAttribute("completeSurvey", surveyService.surveyList());
		JSONArray cJsonArrDP = new JSONArray();
		JSONArray cJsonArrResult = new JSONArray();

		model.addAttribute("chartJSONDp", cJsonArrDP);
		model.addAttribute("chartJSONResult", cJsonArrResult);
		model.addAttribute("Sdt", Sdt);
		return "survey_result_team";
	}


	//???????????? ?????? ???????????? ??????????????? ???????????? ??????, json????????? ??????
	@RequestMapping("/surveyresultDetail.do")
	public String surveyResultDetail(@RequestParam(defaultValue = "") int surveySeq,
			                         @RequestParam(defaultValue = "") String departmentId, Model model) {
		logger.info("??????1");

		List<SurveyListDTO> Sdt = surveyService.surveyList();
		List<SurveyResultTeamDTO> resultList = surveyService.resultList(surveySeq);
		List<SurveyResultTeamDTO> resultDPList = surveyService.resultDPList(surveySeq, departmentId);
		List<OrganizationChartDTO> OList = surveyService.organList(surveySeq);

		String surveyName = null;
		for(int i=0; i<Sdt.size(); i++) {
			if(surveySeq == Sdt.get(i).getSurveySeq()) {
			surveyName = Sdt.get(i).getSurveyName();
			}
		}

		String departmentName = null;
		for(int i=0; i<OList.size(); i++) {
			if(departmentId.equals(OList.get(i).getDepartmentId())) {
			   departmentName = OList.get(i).getDepartmentName();
			}
		}

		model.addAttribute("surveySeq", surveySeq);
		model.addAttribute("Sdt", Sdt);
		model.addAttribute("surveyName", surveyName);
		model.addAttribute("departmentName", departmentName);
		model.addAttribute("completeSurvey", surveyService.surveyList());

		JSONArray cJsonArrResult = new JSONArray();
		JSONObject cJsonObjResult = new JSONObject();
		for(SurveyResultTeamDTO vo : resultList) {
		        cJsonObjResult.put("s", vo.getScore());
		        cJsonObjResult.put("d", vo.getDepartmentName());
		        cJsonArrResult.add(cJsonObjResult);
		}

		JSONArray cJsonArrDP = new JSONArray();
		JSONObject cJsonObjDP = new JSONObject();
		for(SurveyResultTeamDTO vo : resultDPList) {
		        cJsonObjDP.put("s", vo.getScore());
		        cJsonObjDP.put("e", vo.getEmployeeName());
		        cJsonArrDP.add(cJsonObjDP);
		}

		model.addAttribute("chartJSONDp", cJsonArrDP);
		model.addAttribute("chartJSONResult", cJsonArrResult);

		return "survey_result_team";
	}


	//????????? ????????? ????????? ????????? ?????? ?????? ???????????? ??????
	@RequestMapping(value = "/select_ajax.do")
	@ResponseBody
	public String select_ajax(@RequestBody String filterJSON,
	        HttpServletResponse response, ModelMap model ) throws Exception {
		logger.info("??????1");
		JSONObject obj = new JSONObject();
		List<OrganizationChartDTO> Odt  = null;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		try{
			ObjectMapper mapper = new ObjectMapper();
			SurveyListDTO searchVO = (SurveyListDTO)mapper.readValue(filterJSON,new TypeReference<SurveyListDTO>(){ });

			int surveySeq = searchVO.getSurveySeq();

			Odt = surveyService.organList(surveySeq);

			obj.put("Odt", Odt);

		}catch(Exception e){
			logger.info(e.toString());
			obj.put("res", "error");
		}
		out.print(obj);
		return null;
	}


	// survey_insert jsp
	// ???????????? ?????? ????????? ?????? ????????? ??????
	@RequestMapping(value = "/set.do", method = RequestMethod.POST)
	@ResponseBody
	public String setSurvey(@ModelAttribute("SLD") SurveyListDTO SLD, BindingResult bindingresult, HttpSession session,
			RedirectAttributes redirectAttrs) {

		logger.info(SLD.toString());
		if(SLD.getSurveyName()==null || SLD.getSurveyName().isEmpty()) {
			return "nameEmpty" ;
		}else if(SLD.getSurveyName().getBytes().length>50) {
			return "nameLarge" ;
		}else if(SLD.getAnonymityCheckCode() == null) {
			return "noCode";
		}else if(SLD.getSurveyContent().getBytes().length>500) {
			return "contentLarge";
		}else if(SLD.getSurveyStartDate() ==null || SLD.getSurveyClosedDate()==null) {
			return "dateEmpty";
		}else if(SLD.getSurveySeq() != 0) {
			List<SurveyQuestionDTO> SQD = surveyService.getQuestionListOrderByAsc(SLD.getSurveySeq());
			surveyService.setSurvey(SLD);
			for(int i = 0 ; i< SQD.size();i++) {
				SQD.get(i).setSurveySeq(SLD.getSurveySeq());
			}

			surveyService.insertQuestionsAndItems(SQD);
			session.setAttribute("SLD", SLD);
		}else if(SLD.getSurveyStartDate().compareTo(SLD.getSurveyClosedDate())>0){
			return "datemissmatch";
		}else {
			surveyService.setSurvey(SLD);
			session.setAttribute("SLD", SLD);
		}

		return String.valueOf(SLD.getSurveySeq());

	}

	// ?????? ?????? ??????
	@RequestMapping(value = "/updatesurvey.do")
	@ResponseBody
	public String updateSurvey(@ModelAttribute("SLD") @Valid SurveyListDTO SLD, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
		if(SLD.getSurveyStartDate().compareTo(SLD.getSurveyClosedDate())>0){
			return "datemissmatch";
		}if(SLD.getSurveyName()==null || SLD.getSurveyName().isEmpty()) {
			return "nameEmpty" ;
		}else {
			surveyService.updateSurvey(SLD);
			return "success";
		}





	}

	// ???????????? ????????? ????????? ????????? ?????? ?????? ???????????? ???????????? ????????????
	@RequestMapping("/surveyinsert.do")
	public String surveyInsert(@RequestParam("surveyseq") int surveySeq, Model model, HttpSession session) {
		if (!String.valueOf(session.getAttribute("SLD")).equals("null")) {
			SurveyListDTO SLD = (SurveyListDTO) session.getAttribute("SLD");
			model.addAttribute("SLD", SLD);
			session.removeAttribute("SLD");
			model.addAttribute("SQL", surveyService.getQuestionListOrderByDesc(SLD.getSurveySeq()));
			model.addAttribute("NoQuestion","????????? ????????? ????????????.");
		} else {
			model.addAttribute("SLD", surveyService.selectSurvey(surveySeq));
			model.addAttribute("SQL", surveyService.getQuestionListOrderByDesc(surveySeq));
			model.addAttribute("NoQuestion","????????? ????????? ????????????.");
		}
		model.addAttribute("completeSurvey", surveyService.surveyList());
		return "survey_insert";
	}
	
	@ResponseBody
	@RequestMapping("/getallquestion.do/{surveySeq}")
	public List<Map<String,Object>> getQ(@PathVariable int surveySeq) {
		List<Map<String,Object>> list = surveyService.getQuestions(surveySeq);
		
		
		return list;
	}
	
	// ?????? ??????
	@RequestMapping("/insertItem.do")
	@ResponseBody
	public SurveyQuestionDTO insertItem(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
		logger.info("insertItem.do");
		logger.info("???????????? ??????:" + SQD);

		String checkCode = SQD.getQuestionTypeCode();
		try {
			if (checkCode.equals("10001")) {
				// ?????? id, ??????, ????????????, ??? ??? ????????? ??????
				// questionId, itemScore, itemContent

				// ?????? ?????? ???????????? ??????
				String itemcontents = SQD.getItemContent();
				String itemscores = SQD.getItemScore();

				// ?????? ??????
				int cntcontent = itemcontents.length() - itemcontents.replace(",", "").length();

				// ?????? ????????? ????????? ??????
				String[] itemcontent = itemcontents.split(",");
				String[] itemscore = itemscores.split(",");

				// ?????? ?????? ??????
				surveyService.deleteItemByQSeq(SQD.getQuestionSeq());

				// ?????? ???????????? for??? ???????????? ?????? ??????
				for (int i = 0; i <= cntcontent; i++) {
					if(itemcontent[i].equals("")){
						continue;
					}
					SQD.setItemContent(itemcontent[i]);
					SQD.setItemScore(itemscore[i]);
					surveyService.insertItem(SQD);
				}
			} else if (checkCode.equals("10002")) {
				// ?????? ?????? ??????
				surveyService.deleteItemByQSeq(SQD.getQuestionSeq());
				surveyService.insertItem(SQD);

			} else if (checkCode.equals("10003")) {
				// ?????? id, ??????, ????????????, itemid, ??? ??? ????????? ??????
				// questionId, itemScore, itemContent, itemId

				// ?????? ?????? ???????????? ??????
				String itemcontents = SQD.getItemContent();
				String itemscores = SQD.getItemScore();

				// ?????? ??????
				int cntcontent = itemcontents.length() - itemcontents.replace(",", "").length();

				// ?????? ????????? ????????? ??????
				String[] itemcontent = itemcontents.split(",");
				String[] itemscore = itemscores.split(",");

				// ?????? ?????? ??????
				surveyService.deleteItemByQSeq(SQD.getQuestionSeq());

				// ?????? ???????????? for??? ???????????? ?????? ??????
				for (int i = 0; i <= cntcontent; i++) {
					if(itemcontent[i].equals("")){
						continue;
					}

					SQD.setItemContent(itemcontent[i]);
					SQD.setItemScore(itemscore[i]);
					surveyService.insertItem(SQD);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}

		return SQD;
	}

	@RequestMapping(value="/deleteItem.do/{questionSeq}")
	public void deleteItemByQSeq(@PathVariable int questionSeq) {
		surveyService.deleteItemByQSeq(questionSeq);

	}

	@RequestMapping(value="/deleteItem.do/{questionSeq}/{itemSeq}")
	@ResponseBody
	public void deleteItem(@PathVariable int questionSeq, @PathVariable int itemSeq) {
		surveyService.deleteItem(questionSeq, itemSeq);

	}

	// ?????? ??????
	@RequestMapping(value = "/insertquestion.do")
	@ResponseBody
	public List<SurveyQuestionDTO> insertQuestion(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result, Model model) {
		logger.info("?????? ?????? ?????????????");
		logger.info(SQD.getQuestionTypeCode());
		System.out.println("????????????:"+SQD.toString());
		surveyService.insertQuestion(SQD);
		List<SurveyQuestionDTO> LSQD = new ArrayList<>();
		System.out.println("????????????:"+SQD);

		if(SQD.getQuestionContent()==null || SQD.getQuestionContent().equals("")) {
			return LSQD;
		}


		if(SQD.getQuestionTypeCode().equals("10002")) {

		SQD.setItemScore("0");
		surveyService.deleteItemByQSeq(SQD.getQuestionSeq());
		SQD.setItemContent("????????? ???????????????.");
		surveyService.insertItem(SQD);
		LSQD.add(SQD);
		}
		LSQD.add(SQD);
		return LSQD;
	}

	// ?????? ????????????
	@RequestMapping("/updatequestion.do")
	@ResponseBody
	public String updatequestion(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,
			Model model) {
		logger.info("?????? ???????????? ??????");
		logger.info("sqd???" + SQD.toString());
		String questionContent = SQD.getQuestionContent();
		int questionSeq = SQD.getQuestionSeq();
		String questionTypeCode = SQD.getQuestionTypeCode();
		if(questionContent==null || questionContent.equals("")) {
			return "0";
		}else if (questionContent.equals("!@#")) {
			questionContent = null;
		}
		surveyService.UpdateQuestion(questionContent,questionSeq,questionTypeCode);
		if(SQD.getQuestionTypeCode().equals("10002")) {
			surveyService.deleteItemByQSeq(SQD.getQuestionSeq());
			SQD.setItemScore("0");
			SQD.setItemContent("????????? ???????????????.");
			surveyService.insertItem(SQD);
			}
		logger.info(SQD.toString());
		logger.info("???????????? ??????");
		return "1";
	}

	@RequestMapping(value = "/deletequestion.do/{questionSeq}")
	@ResponseBody
	public void questionDelete(@PathVariable int questionSeq) {
		logger.info("?????? ?????? ??????");
		logger.info("????????? ?????? id: " + questionSeq);
		surveyService.deleteQuestion(questionSeq);
	}

	// ?????? ?????? ??? ????????? ????????????
	@RequestMapping(value = "/touchandselect.do/{questionSeq}/{surveySeq}")
	@ResponseBody
	public List<Map<String, Object>> touchAndSelect(@PathVariable int questionSeq, @PathVariable int surveySeq) {
		logger.info("touchandselect ??????");
		return surveyService.selectQuestionBySeq(questionSeq, surveySeq);
	}


	// ???????????? ????????????
	@RequestMapping("/surveyinsertcomplete.do/{surveySeq}")
	@ResponseBody
	public String SurveyInsertComplete(@PathVariable int surveySeq) {
		logger.info(String.valueOf(surveySeq));
		int cnt = surveyService.getItemCnt(surveySeq);
		if(cnt == 0 ) {
			logger.info("0?????????");
			return "0";
		}else {
			logger.info(String.valueOf(cnt)+"?????????");
			surveyService.surveyInsertComplete(surveySeq);
			return "1";
		}



	}

//	//survey_list.jsp
//	//?????? ????????? ?????? ?????????
//	@RequestMapping("/copysurvey.do/{surveySeq}")
//	public String copySurvey(@PathVariable int surveySeq) {
//
//		// seq??? ?????? ?????? ????????????
//		SurveyListDTO SLD = surveyService.selectSurvey(surveySeq);
//		logger.info("????????? ?????? ??????: "+SLD.toString());
//		// ?????? ??????
//		SLD.setStateCode("30001");
//		surveyService.setSurvey(SLD);
//		System.out.println(SLD.getSurveySeq());
//
//		//???????????? ?????? ??????
//		List<SurveyQuestionDTO> SQD = surveyService.getQuestionListOrderByAsc(surveySeq);
//		for(int i = 0 ; i< SQD.size();i++) {
//			SQD.get(i).setSurveySeq(SLD.getSurveySeq());
//		}
//
//		surveyService.insertQuestionsAndItems(SQD);
//		return "redirect:/survey/surveysearch";
//	}


	@RequestMapping("/deletesurvey.do/{surveyseq}")
	@ResponseBody
	public String DeleteSurvey(@PathVariable int surveyseq) {



		logger.info("deletesurvey ???????????? ??????");
			  surveyService.deleteSurvey(surveyseq);
		      mappingService.deleteEmail(surveyseq);
		      mappingService.deleteSMS(surveyseq);
		return "";

	}

	@RequestMapping("/surveysearch.do")
	public String search(@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(defaultValue = "30005") String selection, @RequestParam(defaultValue="30005") String anonyMityCheckCode,
			@RequestParam(defaultValue="") @DateTimeFormat(pattern = "yyyy-MM-dd") Date surveyStartDateLeft,@RequestParam(defaultValue="") @DateTimeFormat(pattern = "yyyy-MM-dd") Date surveyStartDateRight,
			 HttpSession session, Model model) {

		model.addAttribute("commonCodeList", commonCodeService.selectStateCode());
		model.addAttribute("commonDateList", commonCodeService.selectDateCode());
		model.addAttribute("completeSurvey", surveyService.surveyList());
		try {

			List<SurveyListDTO> surveylist = null;
			PagingDTO pagingdto = null;

			int totalRows = pagingService.getTotalBoardNum(keyword, selection, surveyStartDateLeft,surveyStartDateRight, anonyMityCheckCode);
			logger.info(String.valueOf(totalRows));
			pagingdto = new PagingDTO(12, 10, totalRows, pageNo);
			pagingdto.setSelection(selection);
			pagingdto.setKeyword(keyword);
			pagingdto.setSurveyStartDateLeft(surveyStartDateLeft);
			pagingdto.setSurveyStartDateRight(surveyStartDateRight);
			pagingdto.setAnonyMityCheckCode(anonyMityCheckCode);

			surveylist = surveyService.searchListByKeyword(pagingdto);
			List<SurveyListDTO>surveyAllList = surveyService.getAllSurvey(); 

			model.addAttribute("surveylist", surveylist);
			model.addAttribute("surveyAllList",surveyAllList);
			model.addAttribute("pagingdto", pagingdto);
			model.addAttribute("keyword", keyword);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "survey_search";
	}

	// survey evaluate.sjp
	@RequestMapping("/evaluatesearch.do/{surveySeq}")
	public String searchByEvaluate(
						 @PathVariable("surveySeq") int surveySeq,
			             @RequestParam(defaultValue="") String keyword,
						 @RequestParam(defaultValue="1") int pageNo,
						 @RequestParam(defaultValue="50005") String selection,
						 @RequestParam(defaultValue= "" ) String selection2,

						  Model model) {
		logger.info("?????? ????????? ?????????:"+selection);
		logger.info("??? ?????????:" + selection2);
		logger.info("????????? ???"+pageNo);
		logger.info("?????????:" + keyword);
		logger.info("????????? ??????" + surveySeq);

		try {
			SurveyListDTO surveyInfo = surveyService.selectSurvey(surveySeq);
			model.addAttribute("CommonEvaluteList", commonCodeService.selectEvaluateCode());
			model.addAttribute("completeSurvey", surveyService.surveyList());
			model.addAttribute("surveyInfo", surveyInfo);
			List<Map<String, Object>> evaluateList = null;
			PagingDTO pagingDto = null;
			String beforeKeyword = keyword;

			 	model.addAttribute("selection", selection);

			    logger.info("?????? :" + model);
				int totalRows = pagingService.getEvaluateSearchBoardNum(keyword, selection, selection2,  surveySeq);

				System.out.println("totolRows:" + totalRows);
			    pagingDto = new PagingDTO(14, 10, totalRows, pageNo);

				pagingDto.setSelection(selection);
				pagingDto.setSelection2(selection2);
				pagingDto.setKeyword(keyword);
				pagingDto.setSurveySeq(surveySeq);

				logger.info("selection:" + pagingDto.getSelection());
				logger.info("selection2: " + pagingDto.getSelection2());
				logger.info("keyword: "+pagingDto.getKeyword());
				logger.info("paigingdto:" + pagingDto);
				evaluateList = surveyService.searchByEvaluate(pagingDto);
				logger.info("?????????, ???????????? ??????: " + pagingDto);
				logger.info("?????????:" +evaluateList.toString());
				pagingDto.setKeyword(beforeKeyword);
				logger.info(pagingDto.toString());
				logger.info("evaluateList: " + evaluateList);
				//logger.info("evaluateList: " + evaluateList.get(0).toString());
			model.addAttribute("evaluateList", evaluateList);

			logger.info(keyword);
			model.addAttribute("pagingdto", pagingDto);
			model.addAttribute("keyword", keyword);
			model.addAttribute("surveySeq", surveySeq);

		} catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("?????? ?????????");
		logger.info("selection2: " + selection2);
		return "survey_evaluate";
	}


	@RequestMapping("/evaluateMessage.do/{surveySeq}")
	public String searchByMessage(
						 @PathVariable("surveySeq") int surveySeq,
			             @RequestParam(defaultValue="") String keyword,
						 @RequestParam(defaultValue="1") int pageNo,
						 @RequestParam(defaultValue="60004") String selection,
						 @RequestParam(defaultValue="60004") String selection2,
						 @RequestParam(defaultValue="60004") String selectGD,
						 Model model) {
		logger.info("?????? ????????? ?????????:"+selection);
		logger.info("????????? ???"+pageNo);
		logger.info("?????????"+keyword);
		logger.info("????????? ??????" + surveySeq);

		try {
			model.addAttribute("completeSurvey", surveyService.surveyList());
			model.addAttribute("raterDepartment", surveyService.organRaterList(surveySeq));
			model.addAttribute("appraiseeDepartment", surveyService.organAppraiseeList(surveySeq));
			model.addAttribute("gradeList", mappingService.selectGradeList());
			model.addAttribute("checkList", surveyService.checkList());
			SurveyListDTO surveyInfo = surveyService.selectSurvey(surveySeq);
			List<Map<String, Object>> evaluateList = null;
			PagingDTO pagingDto = null;
			String beforeKeyword = keyword;
				
				model.addAttribute("surveyInfo", surveyInfo);
			 	model.addAttribute("selecton", selection);

			    logger.info("?????? :" + model);
				int totalRows = pagingService.getEvaluateMessageBoardNum(beforeKeyword, selection, selection2, surveySeq, selectGD);

			    pagingDto = new PagingDTO(14, 10, totalRows, pageNo);

				pagingDto.setSelection(selection);
				pagingDto.setSelection2(selection2);
				pagingDto.setKeyword(keyword);
				pagingDto.setSurveySeq(surveySeq);
				pagingDto.setSelectGD(selectGD);

				logger.info("selection:" + pagingDto.getSelection());
				logger.info("keyword: "+pagingDto.getKeyword());
				logger.info("paigingdto:" + pagingDto);
				evaluateList = surveyService.searchByMessage(pagingDto);
				logger.info("?????????, ???????????? ??????: " + pagingDto);
				logger.info("?????????:" +evaluateList.toString());
				pagingDto.setKeyword(beforeKeyword);
				logger.info(pagingDto.toString());
				logger.info("evaluateList: " + evaluateList);

			model.addAttribute("evaluateList", evaluateList);

			logger.info(keyword);
			model.addAttribute("pagingdto", pagingDto);
			model.addAttribute("surveySeq", surveySeq);
		} catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("?????? ?????????");
		return "survey_message";
	}






	@RequestMapping("/remessage.do")
	public String remessage(@RequestParam int surveySeq, @RequestParam String deliveryContent) {
		surveyService.sendReEmail(surveySeq, deliveryContent);
		surveyService.sendReSMS(surveySeq, deliveryContent);;

		return "redirect:/survey/evaluatesearch.do/"+surveySeq;
	}


		@RequestMapping("/surveyresult.do/{surveySeq}/{employeeId}")
		public String surveyResult (
				@PathVariable int surveySeq,
				@PathVariable int employeeId,
				                   HttpSession session, Model model) {
			model.addAttribute("completeSurvey", surveyService.surveyList());
			List<Map<String, Object>> surveyResultTarget = null;
			logger.info("employeeId:" + employeeId);
			logger.info("surveySeq: " + surveySeq);
			List<SurveyResultDTO> objectiveResultList = surveyService.objectiveResult(employeeId, surveySeq);
			List<SurveyResultDTO> subjectiveResultList = surveyService.subjectiveResult(employeeId, surveySeq);
			List<SurveyResultDTO> mixResultList = surveyService.mixResult(employeeId, surveySeq);
			//List<SurveyResultDTO> SRL = SurveyResultList.stream().distinct().collect(Collectors.toList());
			model.addAttribute("objectiveResultList",objectiveResultList);
			model.addAttribute("subjectiveResultList",subjectiveResultList);
			model.addAttribute("mixResultList",mixResultList);
			logger.info("SRT ??????");
			System.out.println("SRT ??????");
			surveyResultTarget = surveyService.getResultTarget(employeeId);
			model.addAttribute("surveyResultTarget",surveyResultTarget);
			logger.info("employeeId:" + employeeId);
			logger.info("surveySeq: " + surveySeq);
			List<SurveyResultDTO> personalStats = surveyService.personalStats(surveySeq, employeeId);
		model.addAttribute("personalStats", personalStats);
			logger.info("SRT: " + surveyResultTarget.get(0).toString());
//			logger.info("Result Model: " + surveyResultList.get(0).toString());
		logger.info("subjectiveResultList: " + subjectiveResultList);
		logger.info("MRL: " + mixResultList);

			return "survey_result";
		}



		@RequestMapping("/surveyresultcheck.do/{surveySeq}/{employeeId}")
	      @ResponseBody
	      public List<SurveyResultDTO> surveyResult2 (
	            @PathVariable int surveySeq,
	            @PathVariable int employeeId,
	                               HttpSession session, Model model) {
			List<SurveyResultDTO> objectiveResultList = surveyService.objectiveResult(employeeId, surveySeq);
			List<SurveyResultDTO> subjectiveResult = surveyService.objectiveResult(employeeId, surveySeq);
			List<SurveyResultDTO> mixResult = surveyService.objectiveResult(employeeId, surveySeq);
	        List<SurveyResultDTO> surveyResultList =  new ArrayList<SurveyResultDTO>();
	        surveyResultList.addAll(objectiveResultList);
	        surveyResultList.addAll(subjectiveResult);
	        surveyResultList.addAll(mixResult);
	        logger.info("surveyResultList" + surveyResultList);

	         return surveyResultList ;
	      }

}