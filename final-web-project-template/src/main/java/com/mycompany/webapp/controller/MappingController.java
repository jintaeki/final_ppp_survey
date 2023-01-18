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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.service.IMappingService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MappingController {
	private static final Logger logger = LoggerFactory.getLogger(MappingController.class);

	@Autowired
	IMappingService mappingService;
	
	// 매핑 출력
	@RequestMapping(value="/mapping/set.do", method=RequestMethod.POST)
	public String setMapping(@RequestParam int surveySeq, @RequestParam int month, @RequestParam int number,
			@RequestParam String newCheck, Model model, RedirectAttributes redirectAttrs) {
		logger.info("실행");
		try {
			if(Integer.parseInt(mappingService.stateCheck(surveySeq)) == 30002) {
				mappingService.setMapping(surveySeq, month, number);
				mappingService.updateState(surveySeq, "30003");
			}else if(Integer.parseInt(mappingService.stateCheck(surveySeq)) == 30003) {
				if(Integer.parseInt(newCheck) == 1) {
					mappingService.deleteMapping(surveySeq);
					mappingService.updateState(surveySeq, "30002");	
					return "redirect:/survey/surveysearch";	
				}
			}
			List<PopupDTO> mappingList = mappingService.selectMappingData(surveySeq);
			model.addAttribute("mappingList", mappingList);
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "/home2";
	}

	// 평가자 한사람에 대하여 모든 조건에 맞게 출력
	@RequestMapping(value="/popup.do", method=RequestMethod.GET)
	public String plusMapping(@RequestParam int surveySeq, @RequestParam String raterId, @RequestParam int month,  Model model) {
		List<PopupDTO> getPopup = mappingService.getPopup(surveySeq, raterId, month);
		logger.info("실행");
		model.addAttribute("getPopup", getPopup);
		return "popup";
		}
	
	// 제외된 리스트 전부 출력
	@RequestMapping(value="/another.do", method=RequestMethod.GET)
	public String anotherMapping(@RequestParam int surveySeq, Model model) {
		List<PopupDTO> getPopup = mappingService.getAnother(surveySeq);
		logger.info("실행");
		model.addAttribute("getPopup", getPopup);
		return "popup";
	}
	
	//리스트 입력 
	@RequestMapping(value="/popup.do", method=RequestMethod.POST)
	public String insertAppraise(@RequestBody String filterJSON,
			HttpServletResponse response, ModelMap model) throws Exception {
		logger.info("실행");
		JSONObject resMap = new JSONObject();
		try {
			ObjectMapper mapper = new ObjectMapper();
			List<PopupDTO> insertMap = mapper.readValue(filterJSON,new TypeReference<List<PopupDTO>>(){ });
			logger.info("실행1");
			
			for(int i=0; i<insertMap.size(); i++) {
				int surveySeq = insertMap.get(i).getSurveySeq();
				String raterId = insertMap.get(i).getRaterId();
				String appraiseeId = insertMap.get(i).getAppraiseeId();
				logger.info("실행2");
				
				System.out.println(surveySeq);
				System.out.println(raterId);
				System.out.println(appraiseeId);
				
				// 이미 해당 조합이 현재 시행중인 설문조사에 이미 있는 경우 
				if(mappingService.ovrlpCheck(raterId, appraiseeId).size() != 0) {
					resMap.put("res", "notice");
					resMap.put("msg", "현재 진행중인 설문조사에서 이미 있는 조합입니다.");
					logger.info("실행3");
					return "home2";
				}
				
				//해당 데이터 매핑 테이블에 입력
				mappingService.insertAppraiseId(surveySeq, raterId, appraiseeId);
				resMap.put("res", "success");
				resMap.put("msg", "추가를 완료하였습니다.");
				logger.info("실행4");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(resMap);
		return null;
	}
	
	//리스트 삭제
	@RequestMapping(value="/mapping/deleteMapping.do", method=RequestMethod.POST)
	public @ResponseBody String deleteAppraiseeId(@RequestBody String filterJSON,
			HttpServletResponse response, ModelMap model) throws Exception {
		logger.info("실행");
		JSONObject resMap = new JSONObject();
		try {
			ObjectMapper mapper = new ObjectMapper();
			MappingDTO deleteMap = (MappingDTO)mapper.readValue(filterJSON,new TypeReference<MappingDTO>(){ });
			
			
			int surveySeq = deleteMap.getSurveySeq();
			String raterId = deleteMap.getRaterId();
			String appraiseeId = deleteMap.getAppraiseeId();

			//int cnt = ;

			mappingService.deleteAppraisee(surveySeq, raterId, appraiseeId);
			resMap.put("res", "success");
		    resMap.put("msg", "삭제를 완료하였습니다.");
		} catch (Exception e) {

		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(resMap);
		return null;
	}

	@RequestMapping("/mappingview")
	public String mapping_view() {
		logger.info("실행");
		//log.info("실행");
		return "home2";
	}
	
}