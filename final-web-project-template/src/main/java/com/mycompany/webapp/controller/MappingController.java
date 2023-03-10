package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PagingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.service.ICommonCodeService;
import com.mycompany.webapp.service.IMappingService;
import com.mycompany.webapp.service.IPagingService;
import com.mycompany.webapp.service.ISurveyService;

@Controller
@RequestMapping("/mapping")
public class MappingController {
	private static final Logger logger = LoggerFactory.getLogger(MappingController.class);

	@Autowired
	IMappingService mappingService;

	@Autowired
	ICommonCodeService commonService;

	@Autowired
	IPagingService pagingService;

	@Autowired
	ISurveyService surveyService;

	// 매핑 출력
	@RequestMapping(value="/set.do")
	public String setMapping(int surveySeq, int month,
			 				 @RequestParam(defaultValue="0")int number,
							 @RequestParam(defaultValue="0")String newCheck,
							 @RequestParam(defaultValue="") String keyword,
							 @RequestParam(defaultValue="") String keyword2,
							 @RequestParam(defaultValue="1") int pageNo,
							 @RequestParam(defaultValue="60004") String selection,
							 @RequestParam(defaultValue="60004") String selection2,
							 @RequestParam(defaultValue="60004") String selectGD,
							 Model model, RedirectAttributes redirectAttrs) {
		model.addAttribute("raterDepartment", surveyService.organRaterList(surveySeq));
		model.addAttribute("appraiseeDepartment", surveyService.organAppraiseeList(surveySeq));
		model.addAttribute("completeSurvey", surveyService.surveyList());
		model.addAttribute("commonDateList", commonService.selectDateCode());
		model.addAttribute("gradeList", mappingService.selectGradeList());
		model.addAttribute("number", number);
		model.addAttribute("newCheck", newCheck);
		logger.info("지금 가져온 선택지:"+selection);
		logger.info("페이지 수"+pageNo);
		logger.info("키워드"+keyword);
		logger.info("직급"+selectGD);
		try {
			if(Integer.parseInt(mappingService.stateCheck(surveySeq)) == 30002) {
				mappingService.setMapping(surveySeq, month, number);
				mappingService.updateState(surveySeq, "30003");
				mappingService.insertEmail(surveySeq);
				mappingService.insertSMS(surveySeq);
			}else if(Integer.parseInt(mappingService.stateCheck(surveySeq)) == 30003) {
				if(Integer.parseInt(newCheck) == 1) {
					mappingService.deleteMapping(surveySeq);
					mappingService.updateState(surveySeq, "30002");
					mappingService.deleteEmail(surveySeq);
					mappingService.deleteSMS(surveySeq);
					return "redirect:/survey/surveysearch.do";
				}
			}
			List<PopupDTO> mappingList = null;
			PagingDTO pagingdto = null;
			SurveyListDTO surveyInfo = surveyService.selectSurvey(surveySeq);

			int totalRows = pagingService.getTotalMappingNum(keyword, keyword2, selection, selection2, surveySeq, selectGD);
			logger.info("줄수"+totalRows);
			pagingdto = new PagingDTO(14, 10, totalRows, pageNo);
			pagingdto.setKeyword(keyword);
			pagingdto.setKeyword2(keyword2);
			pagingdto.setSelection(selection);
			pagingdto.setSelection2(selection2);
			pagingdto.setSurveySeq(surveySeq);
			pagingdto.setSelectGD(selectGD);
			pagingdto.setMonth(month);

			logger.info("페이징:" +pagingdto.toString());

			mappingList = mappingService.selectMappingData(pagingdto);
			model.addAttribute("mappingList", mappingList);

			model.addAttribute("pagingdto", pagingdto);
			model.addAttribute("surveySeq",surveySeq);
			model.addAttribute("stateCode", mappingService.stateCheck(surveySeq));
			model.addAttribute("surveyInfo",surveyInfo);

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "/mappingview";
	}



	// 평가자 한사람에 대하여 모든 조건에 맞게 출력
	@RequestMapping(value="/popup.do", method=RequestMethod.GET)
	public String plusMapping(int surveySeq, String raterId, int month,
							@RequestParam(defaultValue="") String keyword,
							@RequestParam(defaultValue="") String keyword2,
							@RequestParam(defaultValue="1") int pageNo,
							@RequestParam(defaultValue="60004") String selection,
							@RequestParam(defaultValue="60004") String selection2,
							@RequestParam(defaultValue="60004") String selectGD, Model model) {
		model.addAttribute("raterDepartment", surveyService.organRaterList(surveySeq));
		model.addAttribute("appraiseeDepartment", surveyService.organAppraiseeList(surveySeq));
		model.addAttribute("commonDateList", commonService.selectDateCode());
		model.addAttribute("gradeList", mappingService.selectGradeList());
		logger.info("지금 가져온 선택지:"+selection);
		logger.info("지금 가져온 선택지:"+selection2);
		logger.info("페이지 수"+pageNo);
		logger.info("키워드"+keyword+"1");
		logger.info("키워드"+keyword2+"1");
		logger.info("직급"+selectGD);
		try {
			List<PopupDTO> getPopup = null;
			PagingDTO pagingdto = null;

			int totalRows = pagingService.getTotalInsertNum(keyword, keyword2, selection, selection2, surveySeq, selectGD, raterId, month);
			logger.info("줄수"+totalRows);
			pagingdto = new PagingDTO(7, 10, totalRows, pageNo);
			pagingdto.setKeyword(keyword);
			pagingdto.setKeyword2(keyword2);
			pagingdto.setSelection(selection);
			pagingdto.setSelection2(selection2);
			pagingdto.setSurveySeq(surveySeq);
			pagingdto.setSelectGD(selectGD);
			pagingdto.setRaterId(raterId);
			pagingdto.setMonth(month);

			getPopup = mappingService.getPopup(pagingdto);
			logger.info("리스트:" +getPopup.toString());
			model.addAttribute("getPopup", getPopup);

			model.addAttribute("pagingdto", pagingdto);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "popup";
	}

	// 제외된 리스트 전부 출력
	@RequestMapping(value="/another.do", method=RequestMethod.GET)
	public String anotherMapping(int surveySeq,
								@RequestParam(defaultValue="") String keyword,
								@RequestParam(defaultValue="") String keyword2,
								@RequestParam(defaultValue="60004") String selection,
								@RequestParam(defaultValue="60004") String selection2,
								@RequestParam(defaultValue="60004") String selectGD,Model model) {
		model.addAttribute("raterDepartment", surveyService.organRaterList(surveySeq));
		model.addAttribute("appraiseeDepartment", surveyService.organAppraiseeList(surveySeq));
		model.addAttribute("commonDateList", commonService.selectDateCode());
		model.addAttribute("gradeList", mappingService.selectGradeList());

		try {
			List<PopupDTO> getPopup = null;
			PagingDTO pagingdto = null;

			pagingdto = new PagingDTO(1, 1, 1, 1);
			pagingdto.setKeyword(keyword);
			pagingdto.setKeyword2(keyword2);
			pagingdto.setSelection(selection);
			pagingdto.setSelection2(selection2);
			pagingdto.setSurveySeq(surveySeq);
			pagingdto.setSelectGD(selectGD);

			getPopup = mappingService.getAnother(pagingdto);
			model.addAttribute("getPopup", getPopup);

			model.addAttribute("pagingdto", pagingdto);
			model.addAttribute("keyword", keyword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "pop_another";
	}

	//리스트 입력
	@RequestMapping(value="/popup.do", method=RequestMethod.POST)
	public void insertAppraisee(@RequestBody String filterJSON,
			HttpServletResponse response, ModelMap model) throws Exception {
		logger.info("실행");
		JSONObject resMap = new JSONObject();
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			ObjectMapper mapper = new ObjectMapper();
			List<PopupDTO> insertMap = mapper.readValue(filterJSON,new TypeReference<List<PopupDTO>>(){ });
			logger.info("실행1");

			for(int i=0; i<insertMap.size(); i++) {
				int surveySeq = insertMap.get(i).getSurveySeq();
				String raterId = insertMap.get(i).getRaterId();
				String appraiseeId = insertMap.get(i).getAppraiseeId();

				logger.info("설문조사번호:" + surveySeq);
				logger.info(raterId);
				logger.info(appraiseeId);

				// 이미 해당 조합이 현재 시행중인 설문조사에 이미 있는 경우
				if(mappingService.ovrlpCheck(raterId, appraiseeId).size() != 0) {
					resMap.put("res", "notice");
					resMap.put("msg", "현재 진행중인 설문조사에서 이미 있는 조합입니다.");
					out.print(resMap);
					return;
				}

				//해당 데이터 매핑 테이블에 입력
				mappingService.insertAppraisee(surveySeq, raterId, appraiseeId);
				mappingService.insertEmail(surveySeq);
				mappingService.insertSMS(surveySeq);

				resMap.put("res", "success");
				resMap.put("msg", "추가를 완료하였습니다.");
				logger.info("실행4");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.print(resMap);
		return;
	}


	//리스트 삭제
	@RequestMapping(value="/deleteMapping.do", method=RequestMethod.POST)
	public void deleteAppraisee(@RequestBody String filterJSON,
			HttpServletResponse response, ModelMap model) throws Exception {
		logger.info("실행");
		JSONObject resMap = new JSONObject();
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			ObjectMapper mapper = new ObjectMapper();
			MappingDTO deleteMap = (MappingDTO)mapper.readValue(filterJSON,new TypeReference<MappingDTO>(){ });

			int surveySeq = deleteMap.getSurveySeq();
			String raterId = deleteMap.getRaterId();
			String appraiseeId = deleteMap.getAppraiseeId();

			mappingService.deleteAppraisee(surveySeq, raterId, appraiseeId);
			mappingService.deleteEmail(surveySeq);
			mappingService.deleteSMS(surveySeq);
			mappingService.insertEmail(surveySeq);
			mappingService.insertSMS(surveySeq);

			resMap.put("res", "success");
		    resMap.put("msg", "삭제를 완료하였습니다.");
		} catch (Exception e) {
			resMap.put("res", "fail");
		}
		out.print(resMap);
		return;
	}
}