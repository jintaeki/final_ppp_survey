package com.mycompany.webapp.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.mycompany.webapp.dto.SurveyListDTO;
import com.mycompany.webapp.dto.SurveyResultDTO;
import com.mycompany.webapp.dto.UserCheckDTO;
import com.mycompany.webapp.service.ISurveyService;
import com.mycompany.webapp.dao.IJsonRepository;
import com.mycompany.webapp.dto.DTO_for_json;
import com.mycompany.webapp.dto.DTO_for_json2;
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
	
	@Autowired
	IJsonRepository ijr;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {

		UserCheckDTO UCD = new UserCheckDTO();
		model.addAttribute("UCD",UCD);
		return "login";
	}


	
	@RequestMapping("/survey/fileuploadprojecthistory.do")	
	@ResponseBody
	public String jsonFileUploadProjectHistory (@RequestParam(value="projecthistoryjson") MultipartFile jsonFile ) {
		JSONObject jsonObj = null;
		byte[] jsonData= null ;
		DTO_for_json2 dfj = new DTO_for_json2();
		JSONParser parser = new JSONParser();
		Object obj  ;
		JSONArray jsonArr = new JSONArray();
		String jsonstr;
		
		
		if(jsonFile.getContentType().equals("application/json")) {
		
			try {
				jsonData = jsonFile.getBytes();
				jsonstr = new String(jsonData);
				obj = parser.parse(jsonstr);
				jsonArr = (JSONArray) obj;
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
		
			//JSON 읽어와서 쿼리에 담기위한 사전작업
			
			JSONObject checkKey=(JSONObject)jsonArr.get(0);
			if(checkKey.containsKey("PROJECT_ID")&&checkKey.containsKey("PARTICIPATION_EMPLOYEE_ID")){
				if(jsonArr.size()>0) {
					for(int i=0; i<jsonArr.size(); i++) {
						jsonObj = (JSONObject)jsonArr.get(i);
						//jsonObj.get("projectid") for문 안에 VO 객체 set 메소드로 값을 설정하고 mapper에 insert하는 방식				
						dfj.setParticipationEmployeeId((long) jsonObj.get("PARTICIPATION_EMPLOYEE_ID"));
						dfj.setProjectId((long) jsonObj.get("PROJECT_ID"));
						//ijr.insert_into_pjhistorys(dfj);
					logger.info("입력 성공");
					}
				}
			
				return "2";
			}else {
				return "1";
			}
	
		}
		else {
			return "0";
		}

	}

	
	@RequestMapping("/survey/fileUploadOrganization.do")
	@ResponseBody
	public String jsonFileUploadOrganization (@RequestParam(value="organizationjson") MultipartFile jsonFile ) {
		if(jsonFile.getContentType().equals("application/json")) {
			JSONObject jsonObj = null;
			byte[] jsonData= null ;
			DTO_for_json dfj = new DTO_for_json();
			JSONParser parser = new JSONParser();
			Object obj  ;
			JSONArray jsonArr = new JSONArray();
			String jsonstr;
			try {
				jsonData = jsonFile.getBytes();
				jsonstr = new String(jsonData);
				obj = parser.parse(jsonstr);
				jsonArr = (JSONArray) obj;
			} catch (Exception e) {
				e.printStackTrace();
			}
				
			//JSON 읽어와서 쿼리에 담기위한 사전작업
			JSONObject checkKey=(JSONObject)jsonArr.get(0);
			if(checkKey.containsKey("HIGH_DEPARTMENT_ID")&&checkKey.containsKey("DEPARTMENT_ID")&&checkKey.containsKey("DEPARTMENT_NAME")){
				if(jsonArr.size()>0) {
					for(int i=0; i<jsonArr.size(); i++) {				
						jsonObj = (JSONObject)jsonArr.get(i);		
						dfj.setHighDepartmentId((long) jsonObj.get("HIGH_DEPARTMENT_ID"));
						dfj.setDepartmentId((long) jsonObj.get("DEPARTMENT_ID"));
						dfj.setDepartmentName((String) jsonObj.get("DEPARTMENT_NAME"));
						ijr.insert_into_groupinfo(dfj);
					}
				}
				return "2";
			}else {
				return "1";

			}
		}else {
			return "0";
			
		}
	}

	@RequestMapping("/survey.do")
	public String tosurvey() {
		
		return "survey";
	}
	
	
	
	@RequestMapping("/logincheck.do")
	@ResponseBody
	public String loginAfter(@ModelAttribute("UCD")  @Valid UserCheckDTO UCD,

							  
							  HttpSession session, Model model) {
		if(UCD.getPassword().equals("")) {
			return "noPassword";
		}if(UCD.getRaterId().equals("")) {
			return "noId";
		}
		
		if(SHA256(UCD.getPassword()) != "") {
			UCD.setPassword(SHA256(UCD.getPassword()));
		}
		
		logger.info("실행");
		logger.info(UCD.toString());
		if(loginCheckService.checkUser(UCD)==1) {
			logger.info("로그인 가능");
			session.setAttribute("signIn", UCD);
			UserCheckDTO check =  loginCheckService.getUserManagerYN(UCD);

			if(check.getManagerYN().equals("N")) {
				logger.info("평가자 진입");
				// 평가자가 평가해야할 설문지 조회
				List<Map<String,Object>> surveySeqAndName = loginCheckService.getSurveySeqAndName(UCD.getRaterId());
				session.setAttribute("raterId",UCD.getRaterId());
				session.setAttribute("surveySeqAndName",surveySeqAndName);
				session.setAttribute("surveyResult", new SurveyResultDTO());
				session.setAttribute("checked", check);
				int nosurveySeqForGetAllUser = 0;

				List<UserCheckDTO> allUser = loginCheckService.getUserInfo(UCD.getRaterId(), nosurveySeqForGetAllUser);
				
				session.setAttribute("allUser",allUser);

				return "successRater";
			}else {
				logger.info("관리자 진입");
				session.setAttribute("checked", check);
				return "successManager";
			}

		}else {
			logger.info("로그인 불가");
			session.setAttribute("signIn", null);
			return "loginFail";
		}


	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}


	@RequestMapping("/getAppraisee.do/{raterId}/{surveySeq}")
	@ResponseBody
	public List<UserCheckDTO> getAppraisee (@PathVariable String raterId,@PathVariable int surveySeq){
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
		if(loginCheckService.checkNansu(nansu)==0) {

		}else {
			checknansu();
		}
		return String.valueOf(nansu);

		}

	public String SHA256(String password){
		 MessageDigest md;
		 String result="";
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
//		     MessageDigest tc1 = md.clone();
		     byte[] toSHA256 = md.digest();
		     result = new BigInteger(1, toSHA256).toString(16).toUpperCase(); 
		     System.out.println(result);
		     return result;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(result);
			return result;
		}

		
		

			
		
	}
	
}


