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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.service.IMappingService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MappingController {
	private static final Logger logger = LoggerFactory.getLogger(MappingController.class);

	@Autowired
	IMappingService mappingService;
	
	@RequestMapping(value="/mapping/set.do", method=RequestMethod.GET)
	public String setMapping(@PathVariable int surveyId, Model model) {
		logger.info("실행");
		model.addAttribute("surveyId", surveyId);
		return "surveylistpopup";
	}
	
	@RequestMapping(value="/mapping/set.do", method=RequestMethod.POST)
	public String setMapping(@ModelAttribute("map") @Valid MappingDTO map, 
			@PathVariable int surveyId, @PathVariable int year, @PathVariable int number,
			BindingResult result, RedirectAttributes redirectAttrs, Model model) {
		logger.info("실행");
		try {
			map.setSurveyId(map.getSurveyId());
			map.setRaterId(map.getRaterId());
			map.setAppraiseeId(map.getAppraiseeId());
		
			mappingService.setMapping(surveyId, year, number);
			
			List<MappingDTO> mappingList = mappingService.selectMappingData();
			model.addAttribute("mappingList", mappingList);
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/home2";
	}
	
	@RequestMapping(value="/mapping/serch-user.do", method=RequestMethod.GET)
	public String insertAppraise(@PathVariable int raterId, Model model) {
		logger.info("실행");
		try {
			List<MappingDTO> mappingList = mappingService.selectRater(raterId);
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
			int surveyId = map.getSurveyId();
			int raterId = map.getRaterId();
			int appraiseeId = map.getAppraiseeId();
		
			mappingService.insertAppraiseId(surveyId, raterId, appraiseeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mappingpopup";
	}
	
	@RequestMapping(value="mapping/deleteMapping.do", method=RequestMethod.POST)
	public String deleteAppraiseeId(MappingDTO map, BindingResult result, HttpSession session, Model model) {
		logger.info("실행");
		mappingService.deleteAppraiseId(map.getRaterId(), map.getAppraiseeId());
		return "redirect:/home2" + map.getSurveyId();
	}
}
