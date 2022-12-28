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
		
		
		
		String filePathGroupinfo = "C:\\Users\\ljt94\\OneDrive\\바탕 화면\\ekekeke\\JSON 조직도.json";
		String filePathPjhistorys = "C:\\Users\\ljt94\\OneDrive\\바탕 화면\\ekekeke\\JSON 프젝 투입이력.json";
		JSONObject jsonObj = null;
		JSONObject jsonObj2 = null;

		//JSON 읽어와서 쿼리에 담기위한 사전작업
//		Reader reader = new FileReader(filePath);
	    FileInputStream fis;
	    FileInputStream fis2;
		try {
			DTO_for_json dfj = new DTO_for_json();
			DTO_for_json2 dfj2 = new DTO_for_json2();
			
			fis = new FileInputStream(filePathGroupinfo);
			InputStreamReader isr= new InputStreamReader(fis,"UTF-8");
			BufferedReader br=new BufferedReader(isr);
			fis2 = new FileInputStream(filePathPjhistorys);
			InputStreamReader isr2= new InputStreamReader(fis2,"UTF-8");
			BufferedReader br2 =new BufferedReader(isr2);
			 
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(br);
			Object obj2 = parser.parse(br2);
			JSONArray jsonArr = (JSONArray) obj;
			JSONArray jsonArr2 = (JSONArray) obj2;
			if(jsonArr.size()>0) {
				for(int i=0; i<jsonArr.size(); i++) {
					jsonObj = (JSONObject)jsonArr.get(i);
					jsonObj2 = (JSONObject)jsonArr2.get(i);
					System.out.println(jsonObj.get("projectid")); // for문 안에 VO 객체 set 메소드로 값을 설정하고 mapper에 insert하는 방식
					
					dfj.setClasses((String) jsonObj.get("class"));
					dfj.setDepartmentid((long) jsonObj.get("departmentid"));
					dfj.setEmail((String) jsonObj.get("email"));
					dfj.setManagerid((long) jsonObj.get("managerid"));
					dfj.setName((String) jsonObj.get("name"));
					dfj.setPhone((String) jsonObj.get("phone"));
					dfj.setRatioid((String) jsonObj.get("ratioid"));
					ijr.insert_into_groupinfo(dfj);
					
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.M.d", Locale.KOREA);
					
					
					dfj2.setProjectid((long) jsonObj2.get("projectid"));
					dfj2.setProjectname((String) jsonObj2.get("projectname"));
					dfj2.setEvaluatedid(String.valueOf(jsonObj2.get("evaluateid")));
					
					LocalDate Ldate = LocalDate.parse((CharSequence) jsonObj2.get("startdate"), formatter);
					Date date = Date.valueOf(Ldate);
					dfj2.setStartdate(date);
					LocalDate Ldate2 = LocalDate.parse((CharSequence) jsonObj2.get("enddate"), formatter);
					Date date2 = Date.valueOf(Ldate2);
					dfj2.setEnddate(date2);
					ijr.insert_into_pjhistorys(dfj2);
					
					ijr.insert_into_mappingtable();
					logger.info("입력 성공");
				}
		 }	
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(UnsupportedEncodingException c) {
			c.printStackTrace();
		}catch (IOException b) {
			// TODO Auto-generated catch block
			b.printStackTrace();
		} catch (ParseException d) {
			// TODO Auto-generated catch block
			d.printStackTrace();
		}
        
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

	
	
	
}

