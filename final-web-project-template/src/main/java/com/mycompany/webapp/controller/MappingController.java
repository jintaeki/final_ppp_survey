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

	// 병준
	@RequestMapping(value="/popup", method=RequestMethod.GET)
	public String surveyName(Model model) { 
		List<PopupDTO> getPopup = mappingService.getPopup();
	 logger.info(getPopup.toString());
		model.addAttribute("getPopup", getPopup);
		logger.info("getPopup"+getPopup);
		return "popup"; 
	}

	//	@RequestMapping(value="/popup", method=RequestMethod.GET)
	//	public String employee_id() {
	//		return "/popup";
}
