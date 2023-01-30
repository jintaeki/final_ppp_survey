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
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;
import com.mycompany.webapp.dto.UserCheckDTO;
import com.mycompany.webapp.service.ISurveyService;

import com.mycompany.webapp.dto.MappingDTO;
import com.mycompany.webapp.dto.PopupDTO;
import com.mycompany.webapp.service.ILoginCheckService;
import com.mycompany.webapp.service.IMappingService;

import lombok.extern.log4j.Log4j2;


@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	int nansu;


	@Autowired
	ILoginCheckService loginCheckService;
	
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
//					System.out.println(jsonObj.get("projectid")); // for문 안에 VO 객체 set 메소드로 값을 설정하고 mapper에 insert하는 방식
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
        
		UserCheckDTO UCD = new UserCheckDTO();
		model.addAttribute("UCD",UCD);
		return "login";
	}
	
	@RequestMapping("/logincheck")
	public String loginAfter(@ModelAttribute("UCD")  @Valid UserCheckDTO UCD, 
							  BindingResult result,
							  HttpSession session, Model model) {
		logger.info("실행");
		logger.info(UCD.toString());
		if(loginCheckService.checkUser(UCD)==1) {
			logger.info("로그인 가능");
			UserCheckDTO check =  loginCheckService.getUserManagerYN(UCD);
			
			
			if(check.getManagerYN().equals("N")) {
				logger.info("평가자 진입");
				// 평가자가 평가해야할 설문지 조회
				List<Map<String,Object>> surveySeqAndName = loginCheckService.getSurveySeqAndName(UCD.getRaterId());
				model.addAttribute("raterId",UCD.getRaterId());
				model.addAttribute("surveySeqAndName",surveySeqAndName);
				model.addAttribute("surveyResult", new SurveyResultDTO());
				session.setAttribute("checked", check);

				return "survey";
			}else {
				logger.info("관리자 진입");
				session.setAttribute("checked", UCD.getRaterId());
				return "redirect:/survey/surveysearch";
			}
			
		}else {
			logger.info("로그인 불가");
			return "login";
		}
		
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	
	@RequestMapping("/getAppraisee.do/{raterId}/{surveySeq}")
	@ResponseBody
	public List<UserCheckDTO> getAppraisee (@PathVariable String raterId,@PathVariable int surveySeq, Model model){
		logger.info(raterId);
		// surveySeq 필요
		List<UserCheckDTO> UCDList = loginCheckService.getUserInfo(raterId, surveySeq);
		logger.info(UCDList.toString());
		
		return UCDList;
	}
	
	@RequestMapping("/getquestionforsurvey.do/{surveySeq}")
	@ResponseBody
	public List<Map<String, Object>> getQuestionForSurvey(@PathVariable int surveySeq) {
		logger.info("실행");
		logger.info(String.valueOf(surveySeq));
		List<Map<String, Object>> QuestionForSurvey = loginCheckService.getQuestion(surveySeq);
		
		return QuestionForSurvey;
	}
	
	
	@RequestMapping("/insertSurveyResult.do")
	@ResponseBody
	public String insertSurveyResult(@ModelAttribute ("surveyResult") SurveyResultDTO surveyResult ) {
		logger.info(surveyResult.toString());
		
		String surveySeqs = surveyResult.getSurveySeq();
		int cntcontent = (surveySeqs.length() - surveySeqs.replace(",", "").length())+1;
		
		String anonymityCodes = surveyResult.getAnonymityCode();	
		String raterIds = surveyResult.getRaterId();
		String appraiseeIds = surveyResult.getAppraiseeId();
		String questionSeqs = surveyResult.getQuestionSeq();
		String itemSeqs = surveyResult.getItemSeq();
		String answerContents =surveyResult.getAnswerContent();
		String anonymitySeqs = surveyResult.getAnonymitySeq();
		
		String[] anonymityCode = anonymityCodes.split(",");
		String[] surveySeq = surveySeqs.split(",");
		String[] raterId = raterIds.split(",");
		String[] appraiseeId = appraiseeIds.split(",");
		String[] questionSeq = questionSeqs.split(",");
		String[] itemSeq = itemSeqs.split(",");
		String[] answerContent = answerContents.split(",");
		String[] anonymitySeq  = anonymitySeqs.split(",");
		
		surveyResult.setSurveySeq(surveySeq[0]);
		surveyResult.setAppraiseeId(appraiseeId[0]);
		surveyResult.setRaterId(raterId[0]);

		//
		if(anonymityCode[0].equals("20001")) {
			surveyResult.setAnonymitySeq(anonymitySeq[0]);
//			surveyResult.setRaterId("null");

			for(int i =0; i<cntcontent;i++) {
				surveyResult.setQuestionSeq(questionSeq[i]);
				surveyResult.setItemSeq(itemSeq[i]);
				surveyResult.setAnswerContent(answerContent[i]);
				
				loginCheckService.insertResult(surveyResult);
				loginCheckService.completeSurvey(surveyResult.getSurveySeq(),surveyResult.getAppraiseeId(),surveyResult.getRaterId());
			}
		}else {
			for(int i =0; i<cntcontent;i++) {
				surveyResult.setAnonymitySeq("0");
//				surveyResult.setRaterId(raterId[i]);
				surveyResult.setQuestionSeq(questionSeq[i]);
				surveyResult.setItemSeq(itemSeq[i]);
				surveyResult.setAnswerContent(answerContent[i]);
				
				loginCheckService.insertResult(surveyResult);
				loginCheckService.completeSurvey(surveyResult.getSurveySeq(),surveyResult.getAppraiseeId(),surveyResult.getRaterId());

			}
		}
		

		
		
		return "성공";
	}
	
	@RequestMapping("/getAnonymityCode.do/{surveySeq}")
	@ResponseBody
	public SurveyListDTO getAnonimityCode(@PathVariable int surveySeq) {
		
		
		
		return loginCheckService.getAnonimityCode(surveySeq);
		
	}
	
	
	@RequestMapping("/getAnonySeq.do")
	@ResponseBody
	public String getAnonySeq() {
		
		return checknansu();
	}
	
	// 일련번호 발급 및 중복 확인 메소드, 재귀함수
	public String checknansu() {
		nansu = loginCheckService.getNansu();
		System.out.println(loginCheckService.checkNansu(nansu));
		if(loginCheckService.checkNansu(nansu)==0) {
			
		}else {
			checknansu();
		}
		return String.valueOf(nansu);
			
		}
	
}
	

