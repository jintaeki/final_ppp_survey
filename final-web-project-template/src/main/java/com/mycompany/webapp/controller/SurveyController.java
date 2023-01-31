package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

import com.mycompany.webapp.dto.CommonDTO;
import com.mycompany.webapp.dto.OrganizationChartDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.ProjectDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyQuestionDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;

import com.mycompany.webapp.dto.SurveyResultTeamDTO;

import com.mycompany.webapp.service.ICommonCodeService;
import com.mycompany.webapp.service.IMappingService;
import com.mycompany.webapp.service.IPagingService;
import com.mycompany.webapp.service.ISurveyService;
import com.mycompany.webapp.service.SurveyService;

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




	@RequestMapping("/sendmessage.do/{surveyseq}/{pageno}")
	@ResponseBody
	public String sendmessage(@PathVariable int surveyseq, @PathVariable int pageno) {

		surveyService.sendMessage(surveyseq);
		surveyService.updateEmail(surveyseq);
		surveyService.updateSMS(surveyseq);

		return "성공";
	}

	

	

	//처음 들어왔을때 용 화면, 아무런 데이터 없이 선택지만 가동
	@RequestMapping("/surveyresultteam")
	public String surveySuccess( Model model) {
		logger.info("실행");

		List<SurveyListDTO> Sdt = surveyService.surveyList();
		JSONArray cJsonArrDP = new JSONArray();
		JSONArray cJsonArrResult = new JSONArray();

		model.addAttribute("chartJSONDp", cJsonArrDP);
		model.addAttribute("chartJSONResult", cJsonArrResult);

		model.addAttribute("Sdt", Sdt);

		return "survey_result_team";
	}


	//선택지를 통해 전송받은 파라미터로 데이터를 추출, json화하여 전송
	@RequestMapping("/surveyresultDetail")
	public String surveyResultDetail(@RequestParam(defaultValue = "") int surveySeq,
			                         @RequestParam(defaultValue = "") String departmentId, Model model) {
		logger.info("실행1");

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


	//선택한 설문지 토대로 참여한 부서 목록 불러오는 함수
	@RequestMapping(value = "/select_ajax.do")
	@ResponseBody
	public String select_ajax(@RequestBody String filterJSON,
	        HttpServletResponse response, ModelMap model ) throws Exception {
		logger.info("실행1");
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
	// 모달창을 통해 설문지 설정 데이터 입력
	@RequestMapping(value = "/set.do", method = RequestMethod.POST)
	public String setSurvey(@ModelAttribute("SLD") @Valid SurveyListDTO SLD, BindingResult result, HttpSession session,
			RedirectAttributes redirectAttrs) {
		logger.info("모달창을 통해 설문 등록하는 컨트롤러 진입");
		surveyService.setSurvey(SLD);
		session.setAttribute("SLD", SLD);

		return "redirect:/survey/surveyinsert?surveyseq=" + SLD.getSurveySeq();

	}

	// 설문 설정 변경
	@RequestMapping(value = "/updatesurvey.do")
	@ResponseBody
	public SurveyListDTO updateSurvey(@ModelAttribute("SLD") @Valid SurveyListDTO SLD, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
				logger.info("모달창을 통해 설문 등록 페이지 진입");
		logger.info(SLD.toString());
		surveyService.updateSurvey(SLD);

		return SLD;

	}

	// 목록에서 설문지 이름을 누르면 설문 관리 페이지로 이동하는 컨트롤러
	@RequestMapping("/surveyinsert")
	public String survey_insert(@RequestParam("surveyseq") int surveySeq, Model model, HttpSession session) {
		if (!String.valueOf(session.getAttribute("SLD")).equals("null")) {
			SurveyListDTO SLD = (SurveyListDTO) session.getAttribute("SLD");
			session.removeAttribute("SLD");
			model.addAttribute("SLD", SLD);
			model.addAttribute("NoQuestion","저장된 문제가 없습니다.");
		} else {
			model.addAttribute("SLD", surveyService.selectSurvey(surveySeq));
			model.addAttribute("SQL", surveyService.getQuestionListOrderByDesc(surveySeq));
			model.addAttribute("NoQuestion","저장된 문제가 없습니다.");
		}

		return "survey_insert";
	}
	
	// 문항 등록
	@RequestMapping("/insertItem.do")
	@ResponseBody
	public SurveyQuestionDTO insertItem(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
		logger.info("insertItem.do");
		logger.info("문제번호 확인:" + SQD);

		String checkCode = SQD.getQuestionTypeCode();
		try {
			if (checkCode.equals("10001")) {
				// 문제 id, 점수, 문항내용, 각 각 받아야 한다
				// questionId, itemScore, itemContent

				// 다중 값들 문자열로 표현
				String itemcontents = SQD.getItemContent();
				String itemscores = SQD.getItemScore();

				// 문항 개수
				int cntcontent = itemcontents.length() - itemcontents.replace(",", "").length();

				// 다중 값들을 배열로 변환
				String[] itemcontent = itemcontents.split(",");
				String[] itemscore = itemscores.split(",");
				
				// 기존 문항 삭제
				surveyService.deleteItemByQSeq(SQD.getQuestionSeq());

				// 문항 개수만큼 for문 실행하여 문항 등록
				for (int i = 0; i <= cntcontent; i++) {
					if(itemcontent[i].equals("")){
						System.out.println(i+"번째가 비어있음");
						continue;
					}
					SQD.setItemContent(itemcontent[i]);
					SQD.setItemScore(itemscore[i]);
					surveyService.insertItem(SQD);
				}
			} else if (checkCode.equals("10002")) {
				// 기존 문항 삭제
				surveyService.deleteItemByQSeq(SQD.getQuestionSeq());
				surveyService.insertItem(SQD);

			} else if (checkCode.equals("10003")) {
				// 문제 id, 점수, 문항내용, itemid, 각 각 받아야 한다
				// questionId, itemScore, itemContent, itemId

				// 다중 값들 문자열로 표현
				String itemcontents = SQD.getItemContent();
				String itemscores = SQD.getItemScore();

				// 문항 개수
				int cntcontent = itemcontents.length() - itemcontents.replace(",", "").length();

				// 다중 값들을 배열로 변환
				String[] itemcontent = itemcontents.split(",");
				String[] itemscore = itemscores.split(",");

				// 기존 문항 삭제
				surveyService.deleteItemByQSeq(SQD.getQuestionSeq());
				
				// 문항 개수만큼 for문 실행하여 문항 등록
				for (int i = 0; i <= cntcontent; i++) {
					if(itemcontent[i].equals("")){
						System.out.println(i+"번째가 비어있음");
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

	// 문제 등록
	@RequestMapping(value = "/insertquestion.do")
	@ResponseBody
	public SurveyQuestionDTO insertQuestion(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result, Model model) {
		logger.info("문제 생성 진입했나?");
		model.addAttribute("SQD", SQD);
		surveyService.insertQuestion(SQD);
		if(SQD.getQuestionTypeCode().equals("10002")) {
		surveyService.deleteItemByQSeq(SQD.getQuestionSeq());
		SQD.setItemContent("주관식 문제입니다.");
		surveyService.insertItem(SQD);
		}
		return SQD;
	}

	// 문제 업데이트
	@RequestMapping("/updatequestion.do")
	@ResponseBody
	public SurveyQuestionDTO updatequestion(@ModelAttribute("SQD") @Valid SurveyQuestionDTO SQD, BindingResult result,
			Model model) {
		logger.info("업데이트 진입");
		logger.info("sqd값" + SQD.toString());
		surveyService.UpdateQuestion(SQD);
		if(SQD.getQuestionTypeCode().equals("10002")) {
			SQD.setItemContent("주관식 문제입니다.");
			surveyService.insertItem(SQD);
			}
		logger.info(SQD.toString());
		logger.info("업데이트 성공");
		return SQD;
	}

	@RequestMapping(value = "/deletequestion.do/{questionSeq}")
	@ResponseBody
	public void questionDelete(@PathVariable int questionSeq) {
		logger.info("문제 삭제 진입");
		logger.info("삭제할 문제 id: " + questionSeq);
		surveyService.deleteQuestion(questionSeq);
	}

	// 문제 선택 시 데이터 가져오기
	@RequestMapping(value = "/touchandselect.do/{questionSeq}/{surveySeq}")
	@ResponseBody
	public List<Map<String, Object>> touchAndSelect(@PathVariable int questionSeq, @PathVariable int surveySeq) {
		logger.info("touchandselect 진입");
		return surveyService.selectQuestionBySeq(questionSeq, surveySeq);
	}


	// 등록완료 돌아가기
	@RequestMapping("/surveyinsertcomplete.do/{surveySeq}")
	@ResponseBody
	public String SurveyInsertComplete(@PathVariable int surveySeq) {
		logger.info(String.valueOf(surveySeq));
		int cnt = surveyService.getItemCnt(surveySeq);
		if(cnt == 0 ) {
			logger.info("0을반환");
			return "0";
		}else {
			logger.info(String.valueOf(cnt)+"을반환");
			surveyService.surveyInsertComplete(surveySeq);
			return "1";
		}



	}

	
	//survey_list.jsp
	//문제 복사를 위한 메소드
	@RequestMapping("/copysurvey.do/{surveySeq}")
	public String copySurvey(@PathVariable int surveySeq) {

		// seq로 설문 내용 불러오기
		SurveyListDTO SLD = surveyService.selectSurvey(surveySeq);
		logger.info("복사할 설문 내용: "+SLD.toString());
		// 설문 저장
		SLD.setStateCode("30001");
		surveyService.setSurvey(SLD);
		System.out.println(SLD.getSurveySeq());

		//설문지의 문제 조회
		List<SurveyQuestionDTO> SQD = surveyService.getQuestionListOrderByAsc(surveySeq);
		for(int i = 0 ; i< SQD.size();i++) {
			SQD.get(i).setSurveySeq(SLD.getSurveySeq());
		}

		surveyService.insertQuestionsAndItems(SQD);
		return "redirect:/survey/surveysearch";
	}

	@RequestMapping("/deletesurvey.do/{surveyseq}/{pageno}/{date}/{keyword}/{selection}")
	public String DeleteSurvey(@PathVariable int surveyseq, @PathVariable int pageno,
			@PathVariable(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
			@PathVariable String selection, @PathVariable String keyword) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = (String) sdf.format(date);
		if (sdf.format(date).equals("1111-11-11")) {
			strDate = "";
		}
		if (keyword.equals("empty")) {
			keyword = "";
		}

		logger.info("deletesurvey 컨트롤러 진입");
			  surveyService.deleteSurvey(surveyseq);
		      mappingService.deleteEmail(surveyseq);
		      mappingService.deleteSMS(surveyseq);
		return "redirect:/survey/surveysearch?pageNo=" + pageno + "&keyword=" + keyword + "&selection=" + selection
				+ "&surveyStartDate=" + strDate;

	}
	
	@RequestMapping("/surveysearch")
	public String search(@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(defaultValue = "30005") String selection,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date surveyStartDate,
			@RequestParam(defaultValue = "") String anonyMityCheckCode, HttpSession session, Model model) {

		model.addAttribute("commonCodeList", commonCodeService.selectStateCode());
		logger.info("지금 가져온 선택지:" + selection);
		logger.info("페이지 수" + pageNo);
		logger.info("키워드" + keyword);
		logger.info("날짜" + surveyStartDate);
		logger.info("anonyMityCheckCode" + anonyMityCheckCode);
		try {

			List<SurveyListDTO> surveylist = null;
			PagingDTO pagingdto = null;

			int totalRows = pagingService.getTotalBoardNum(keyword, selection, surveyStartDate, anonyMityCheckCode);

			pagingdto = new PagingDTO(7, 7, totalRows, pageNo);
			pagingdto.setSelection(selection);
			pagingdto.setKeyword(keyword);
			pagingdto.setSurveyStartDate(surveyStartDate);
			pagingdto.setAnonyMityCheckCode(anonyMityCheckCode);

			surveylist = surveyService.searchListByKeyword(pagingdto);


			model.addAttribute("surveylist", surveylist);

			model.addAttribute("pagingdto", pagingdto);
			model.addAttribute("keyword", keyword);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "survey_search";
	}
	
	// survey evaluate.sjp
	@RequestMapping("/evaluatesearch/{surveySeq}")
	public String searchByEvaluate(
						 @PathVariable("surveySeq") int surveySeq,
			             @RequestParam(defaultValue="") String keyword,
						 @RequestParam(defaultValue="1") int pageNo,
						 @RequestParam(defaultValue="") String selection,
						 @RequestParam(value = "searchType", required = false, defaultValue = "employeeName") String searchType,
						 @RequestParam(value="employeeName", required=false) String employeeName,
						 @RequestParam(value="departmentName", required=false) String departmentName,
						 @RequestParam(value="CompleteYn", required=false) String surveyCompleteYn,
						 @RequestParam(value="gradeName", required=false) String gradeName,
						  Model model) {
		logger.info("지금 가져온 선택지:"+selection);
		logger.info("페이지 수"+pageNo);
		logger.info("키워드"+keyword);
		logger.info("설문지 번호" + surveySeq);

		try {

			List<Map<String, Object>> evaluateList = null;
			PagingDTO pagingDto = null;
			String beforeKeyword = keyword;

			 	model.addAttribute("selecton", selection);

			    logger.info("모델 :" + model);
				int totalRows = pagingService.getEvaluateSearchBoardNum(keyword, selection, surveySeq);

				System.out.println("totolRows:" + totalRows);
			    pagingDto = new PagingDTO(7, 7, totalRows, pageNo);

				pagingDto.setSelection(selection);
				pagingDto.setKeyword(keyword);
				pagingDto.setSurveySeq(surveySeq);

				logger.info("selection:" + pagingDto.getSelection());
				logger.info("keyword: "+pagingDto.getKeyword());
				logger.info("paigingdto:" + pagingDto);
				evaluateList = surveyService.searchByEvaluate(pagingDto);
				logger.info("스타트, 엔드로우 체크: " + pagingDto);
				logger.info("리스트:" +evaluateList.toString());
				pagingDto.setKeyword(beforeKeyword);
				logger.info(pagingDto.toString());
				logger.info("evaluateList: " + evaluateList);

			model.addAttribute("evaluateList", evaluateList);

			logger.info(keyword);
			System.out.println(pageNo);
			model.addAttribute("pagingdto", pagingDto);
			model.addAttribute("keyword", keyword);

		} catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("검색 테스트");
		return "survey_evaluate";
	}

		@RequestMapping("/surveyresult/{surveySeq}/{employeeId}")
		public String surveyResult (
				@PathVariable int surveySeq,
				@PathVariable int employeeId,
				                   HttpSession session, Model model) {
			List<Map<String, Object>> surveyResultTarget = null;
			logger.info("employeeId:" + employeeId);
			logger.info("surveySeq: " + surveySeq);
			List<SurveyResultDTO> surveyResultList = surveyService.surveyResult(employeeId, surveySeq);
			//List<SurveyResultDTO> SRL = SurveyResultList.stream().distinct().collect(Collectors.toList());
			logger.info("srl" + surveyResultList);
			model.addAttribute("surveyResultList",surveyResultList);
			surveyResultTarget = surveyService.getResultTarget(employeeId);
			model.addAttribute("surveyResultTarget",surveyResultTarget);
			List<SurveyResultDTO> personalStats = surveyService.personalStats(surveySeq, employeeId);
			model.addAttribute("personalStats", personalStats);
//			logger.info("SRT: " + surveyResultTarget.get(0).toString());
//			logger.info("Result Model: " + surveyResultList.get(0).toString());


			return "survey_result";
		}


		@RequestMapping("/surveyresultcheck/{surveySeq}/{employeeId}")
	      @ResponseBody
	      public List<SurveyResultDTO> surveyResult2 (
	            @PathVariable int surveySeq,
	            @PathVariable int employeeId,
	                               HttpSession session, Model model) {

	         List<SurveyResultDTO> surveyResultList = surveyService.surveyResult(employeeId, surveySeq);

	         return surveyResultList ;
	      }

		
		
}