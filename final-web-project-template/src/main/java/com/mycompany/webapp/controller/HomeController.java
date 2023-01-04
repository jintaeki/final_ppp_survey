package com.mycompany.webapp.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.dto.DTO_for_json;
import com.mycompany.webapp.dto.DTO_for_json2;
import com.mycompany.webapp.service.IJsonService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	IJsonService ijr;
	

	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		
		
//		String filePathGroupinfo = "C:\\Users\\KOSA\\Desktop\\JSON 조직도.json";
//		String filePathPjhistorys = "C:\\Users\\KOSA\\Desktop\\JSON 프로젝트 투입 인원.json";
//
//		JSONObject jsonObj2 = null;
//
//		//JSON 읽어와서 쿼리에 담기위한 사전작업
//
//	    FileInputStream fis;
//	    FileInputStream fis2;
//		try {
//			DTO_for_json dfj = new DTO_for_json();
//			DTO_for_json2 dfj2 = new DTO_for_json2();
//			
//			fis = new FileInputStream(filePathGroupinfo);
//			InputStreamReader isr= new InputStreamReader(fis,"UTF-8");
//			BufferedReader br=new BufferedReader(isr);
//			fis2 = new FileInputStream(filePathPjhistorys);
//			InputStreamReader isr2= new InputStreamReader(fis2,"UTF-8");
//			BufferedReader br2 =new BufferedReader(isr2);
//			 
//			JSONParser parser = new JSONParser();
//			Object obj = parser.parse(br);
//			Object obj2 = parser.parse(br2);
//			JSONArray jsonArr = (JSONArray) obj;
//			JSONArray jsonArr2 = (JSONArray) obj2;
//			System.out.println("아"+jsonArr2.size());
//			if(jsonArr.size()>0) {
//				for(int i=0; i<jsonArr2.size(); i++) {
//					
//					jsonObj2 = (JSONObject)jsonArr2.get(i);
////					System.out.println(jsonObj.get("projectid")); // for문 안에 VO 객체 set 메소드로 값을 설정하고 mapper에 insert하는 방식
//					
//					if(i<9) {
//						JSONObject jsonObj = (JSONObject)jsonArr.get(i);
//					dfj.setHighDepartmentId((long) jsonObj.get("HIGH_DEPARTMENT_ID"));
//					dfj.setDepartmentId( (long) jsonObj.get("DEPARTMENT_ID"));
//					dfj.setDepartmentName((String) jsonObj.get("DEPARTMENT_NAME"));
//					System.out.println(dfj);
//					ijr.insert_into_groupinfo(dfj);
//					}
//					
//					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-d", Locale.KOREA);
//					
//					
//					dfj2.setParticipationEmployeeId((long) jsonObj2.get("PARTICIPATION_EMPLOYEE_ID"));
//					dfj2.setProjectId((long) jsonObj2.get("PROJECT_ID"));
//				
//					
//					LocalDate Ldate = LocalDate.parse((CharSequence) jsonObj2.get("PROJECT_START_DATE"), formatter);
//					Date date = Date.valueOf(Ldate);
//					dfj2.setProjectStartDate(date);
//					LocalDate Ldate2 = LocalDate.parse((CharSequence) jsonObj2.get("PROJECT_CLOSED_DATE"), formatter);
//					Date date2 = Date.valueOf(Ldate2);
//					dfj2.setProjectClosedDate(date2);
//					System.out.println(dfj2);
//
//					ijr.insert_into_pjhistorys(dfj2);
//					
//
//					logger.info("입력 성공");
//				}
//		 }	
//			
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch(UnsupportedEncodingException c) {
//			c.printStackTrace();
//		}catch (IOException b) {
//			// TODO Auto-generated catch block
//			b.printStackTrace();
//		} catch (ParseException d) {
//			// TODO Auto-generated catch block
//			d.printStackTrace();
//		}
        
		return "home";
		
	
	}
	
	
	
//	@RequestMapping("/")
//	public String home() {
//		logger.info("실행");
//		//log.info("실행");
//		return "home";
//	}
	
	@RequestMapping("/home2")
	public String home2() {
		logger.info("실행");
		//log.info("실행");
		return "home2";
	}
	
	@RequestMapping("/loginafter")
	public String login_after() {
		logger.info("실행");
		//log.info("실행");
		return "login_after_user";
	}
	
	@RequestMapping("/login")
	public String login() {
		logger.info("실행");
		//log.info("실행");
		return "login";
	}
	
	/*
	@RequestMapping("/surveydetails")
	public String survey_details() {
		logger.info("실행");
		//log.info("실행");
		return "survey_details";
	}
	@RequestMapping("/surveyevaluate")
	public String survey_evaluate() {
		logger.info("실행");
		//log.info("실행");
		return "survey_evaluate";
	}
	@RequestMapping("/surveyinsert")
	public String survey_insert() {
		logger.info("실행");
		//log.info("실행");
		return "survey_insert";
	}
	@RequestMapping("/surveylist")
	public String survey_list() {
		logger.info("실행");
		//log.info("실행");
		return "survey_list";
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
	
	@RequestMapping("/survey")
	public String survey() {
		logger.info("실행");
		//log.info("실행");
		return "survey";
	}
	@RequestMapping("/mappingview")
	public String mapping_view() {
		logger.info("실행");
		//log.info("실행");
		return "home2";
	}

	*/
	
	
}

