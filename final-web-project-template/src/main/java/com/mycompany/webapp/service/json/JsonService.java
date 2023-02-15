package com.mycompany.webapp.service.json;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.ExcelRead;
import com.mycompany.webapp.controller.ExcelReadOption;
import com.mycompany.webapp.dao.IJsonRepository;
import com.mycompany.webapp.dto.DTO_for_json;
import com.mycompany.webapp.dto.DTO_for_json2;
import com.mycompany.webapp.dto.OrganizationChartDTO;
import com.mycompany.webapp.dto.ProjectHistoryDTO;

@Service
public class JsonService implements IJsonService{

	@Autowired
	IJsonRepository ijr;
	
	
	@Override
	public void insert_into_groupinfo(DTO_for_json dto) {
		ijr.insert_into_groupinfo(dto);
	}


	@Override
	public void insert_into_pjhistorys(DTO_for_json2 dto2) {
		ijr.insert_into_pjhistorys(dto2);		
	}


	@Override
	public void insert_into_mappingtable() {
		ijr.insert_into_mappingtable();
		
	}


	@Override
	public List<ProjectHistoryDTO> getHistoryList() {
		return ijr.getHistoryList();
	}


	@Override
	public List<OrganizationChartDTO> getOCList() {
		return ijr.getOCList();
	}
	
    // 엑셀 업로드
    @Override
    public void excelUpload_project(File destFile) throws Exception {
        System.out.println("서비스 도착0");

        ExcelReadOption excelReadOption = new ExcelReadOption();
        //파일경로 추가
        System.out.println("서비스 도착1");

        excelReadOption.setFilePath(destFile.getAbsolutePath());
        System.out.println("서비스 도착2");

        excelReadOption.setOutputColumns("A", "B"); //추출할 컬럼명 추가
        System.out.println("서비스 도착3");

        excelReadOption.setStartRow(2); //시작행(헤더부분 제외)
        System.out.println("서비스 도착4");
        List<Map<String, String>>excelContent  = ExcelRead.read(excelReadOption);
        
        // 첫번쨰 엑셀 cell값(날짜 데이터)을 가지고 전체 변경하기 
//        String pDate = excelContent.get(0).get("A").toString();
//        for(int i=0; i<excelContent.size(); i++) {
//        	if(!excelContent.get(i).get("A").contains(pDate)) {
//            	// 첫번째 cell값(날짜 데이터)이 포함되지 않은 cell의 경우에 데이터를 put 시킨다.
//        		excelContent.get(i).put("A", pDate); 
//            }
//        }
        DTO_for_json2 dfj = new DTO_for_json2();
        for(Map<String, String> article: excelContent){
             System.out.println("A:"+article.get("A"));
             System.out.println("B:"+article.get("B"));
             dfj.setParticipationEmployeeId(article.get("A"));
             dfj.setProjectId(article.get("B"));
             ijr.excelUpload_PROJECT(dfj); 
        }
       
    }
    
    
    
    @Override
    public void excelUpload_OC(File destFile) throws Exception {
        System.out.println("서비스 도착0");

        ExcelReadOption excelReadOption = new ExcelReadOption();
        //파일경로 추가
        System.out.println("서비스 도착1");

        excelReadOption.setFilePath(destFile.getAbsolutePath());
        System.out.println("서비스 도착2");

        excelReadOption.setOutputColumns("A", "B","C"); //추출할 컬럼명 추가
        System.out.println("서비스 도착3");

        excelReadOption.setStartRow(2); //시작행(헤더부분 제외)
        System.out.println("서비스 도착4");
        List<Map<String, String>>excelContent  = ExcelRead.read(excelReadOption);
        
        // 첫번쨰 엑셀 cell값(날짜 데이터)을 가지고 전체 변경하기 
//        String pDate = excelContent.get(0).get("A").toString();
//        for(int i=0; i<excelContent.size(); i++) {
//        	if(!excelContent.get(i).get("A").contains(pDate)) {
//            	// 첫번째 cell값(날짜 데이터)이 포함되지 않은 cell의 경우에 데이터를 put 시킨다.
//        		excelContent.get(i).put("A", pDate); 
//            }
//        }
        DTO_for_json dfj = new DTO_for_json();
        for(Map<String, String> article: excelContent){
        	if(article.get("A") == "" || article.get("B") == "" || article.get("C")=="") {
        		break;
        	}
        	System.out.println(article.get("A"));
        	System.out.println(article.get("B"));
        	System.out.println(article.get("C"));
             dfj.setDepartmentId(article.get("B"));
             dfj.setDepartmentName(article.get("C"));
             dfj.setHighDepartmentId(article.get("A"));
             ijr.excelUpload_OC(dfj); 
        }
       
    }
}
