package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@RequestMapping(value="/mapping/set.do", method=RequestMethod.POST)
	public String setMapping(@RequestParam int surveySeq, @RequestParam int month, @RequestParam int number,
			Model model, RedirectAttributes redirectAttrs) {
		logger.info("실행");			
		try {
			if(mappingService.mappingCheck(surveySeq) == 0) {				
				mappingService.setMapping(surveySeq, month, number);
			}
			List<PopupDTO> mappingList = mappingService.selectMappingData(surveySeq);
			model.addAttribute("mappingList", mappingList);
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "/home2";
	}
	
	// 병준
	@RequestMapping(value="/popup", method=RequestMethod.GET)
	public String plusMapping(@RequestParam int surveySeq, @RequestParam String raterId, @RequestParam int month,  Model model) { 
		List<PopupDTO> getPopup = mappingService.getPopup(surveySeq, raterId, month);
		logger.info(getPopup.toString());
		model.addAttribute("getPopup", getPopup);
		logger.info("getPopup"+getPopup);
		return "popup"; 
		}
	
	
	@RequestMapping(value="/mapping/serch-user.do", method=RequestMethod.POST)
	public String insertAppraise(@ModelAttribute("map") @Valid MappingDTO map,
			BindingResult result, RedirectAttributes redirectAttrs) {
		logger.info("실행");
		try {
			int surveySeq = map.getSurveySeq();
			String raterId = map.getRaterId();
			String appraiseeId = map.getAppraiseeId();
		
			mappingService.insertAppraiseId(surveySeq, raterId, appraiseeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mappingpopup";
	}
	
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



	
