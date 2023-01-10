package com.mycompany.webapp.controller;

import java.util.List;

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
	public String setMapping(@RequestParam int surveySeq, @RequestParam int year, @RequestParam int number,
			Model model, RedirectAttributes redirectAttrs) {
		logger.info("메핑실행");			
		try {
			if(mappingService.mappingCheck(surveySeq) == 0) {				
				mappingService.setMapping(surveySeq, year, number);
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
	public String surveyName(Model model) { 
		List<PopupDTO> getPopup = mappingService.getPopup();
		logger.info(getPopup.toString());
		model.addAttribute("getPopup", getPopup);
		logger.info("getPopup"+getPopup);
		return "popup"; 
		}
	
	@RequestMapping(value="/mapping/serch-user.do", method=RequestMethod.GET)
	public String insertAppraise(@PathVariable String raterId, Model model) {
		logger.info("실행");
		try {
			List<PopupDTO> mappingList = mappingService.selectRater(raterId);
			model.addAttribute("mappingList", mappingList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mappingpopup";
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
	
	@RequestMapping(value="mapping/deleteMapping.do", method=RequestMethod.POST)
	public String deleteAppraiseeId(MappingDTO map, BindingResult result, HttpSession session, Model model) {
		logger.info("실행");
		mappingService.deleteAppraiseId(map.getRaterId(), map.getAppraiseeId());
		return "redirect:/home2" + map.getSurveySeq();
	}
	
	@RequestMapping("/mappingview")
	public String mapping_view() {
		logger.info("실행");
		//log.info("실행");
		return "home2";
	}
	

}



	
