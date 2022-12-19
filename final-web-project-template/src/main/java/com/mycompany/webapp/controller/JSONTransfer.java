package com.mycompany.webapp.controller;


import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;





public class JSONTransfer {

	public static <E> void main(String[] args) throws IOException, ParseException {
		String filePath = "C:\\Users\\KOSA\\Desktop\\ekekeke\\JSON 조직도.json";
		JSONObject jsonObj = null;
		
		List<Map<String, String>> jsonmapper = new ArrayList<>();
		Map<Set<E>, Object> mapper = new HashMap<>();
		//JSON 읽어와서 쿼리에 담기위한 사전작업
		Reader reader = new FileReader(filePath);
	    
	    JSONParser parser = new JSONParser();
	    
	    Object obj = parser.parse(reader);
	    JSONArray jsonArr = (JSONArray) obj;
		
	    if(jsonArr.size()>0) {
			for(int i=0; i<jsonArr.size(); i++) {
				jsonObj = (JSONObject)jsonArr.get(i);
				System.out.println(jsonObj);
				jsonmapper.add(jsonObj);
//				System.out.println(jsonObj);
				mapper.put(jsonObj.keySet(), jsonObj.get(jsonObj.keySet()));
			}
	 }	
//	    System.out.println(jsonArr.size());
//	    System.out.println(jsonObj);
//	    System.out.println(jsonmapper);
//	    System.out.println(mapper);
	}

}
