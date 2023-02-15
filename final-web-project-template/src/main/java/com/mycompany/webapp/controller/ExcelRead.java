package com.mycompany.webapp.controller;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelRead {
     public static List<Map<String, String>> read(ExcelReadOption excelReadOption) {
     	if(excelReadOption != null) { 
            /*
             * 엑셀파일을 읽어 들인다.
             * FileType.getWorkbook() <-- 파일의 확장자에 따라서 적절하게 가져온다.
             */
System.out.println(excelReadOption.getFilePath());
     		
            Workbook wb = ExcelFileType.getWorkbook(excelReadOption.getFilePath());

            int sheetNum = wb.getNumberOfSheets();

            Row row = null;        // row
           Cell cell;      // cell
            String cellName = "";  // cell name
            int numOfCells = 0;    // cell number 
            
            /*
             * 각 row마다의 값을 저장할 맵 객체
             * 저장되는 형식은 다음과 같다.
             * put("A", "이름");
             * put("B", "게임명");
             */
            Map<String, String> map = null;
            
            /*
             * 각 Row를 리스트에 담는다.
             * 하나의 Row를 하나의 Map으로 표현되며, List에는 모든 Row가 포함될 것이다.
             */
            List<Map<String, String>> result = new ArrayList<Map<String, String>>(); 
            
            /* 엑셀 시트가 1개가 아닌 여러개의 경우 for문을 통해 처리 */
            for(int k=0; k<sheetNum; k++) {
            	System.out.println("Sheet Name : " + wb.getSheetName(k));
            	Sheet sheet = wb.getSheetAt(k);
            	
                /* sheet에서 유효한 행의 개수를 가져온다. */
                int numOfRows = sheet.getLastRowNum() + 1; 
                // System.out.println("numOfRows 전체 행의 개수 : " + numOfRows);
                
                /* 엑셀 파일의 numOfRows가 1이 반환될 경우 예외처리 */
                if(numOfRows <= 1) {
                    map = new HashMap<String, String>();
                    map.put("errorMessage", "numOfRows 1이 반환되는 오류 발생");
                    result.add(map);
                    return result;
                }
            
                /* 각 Row만큼 반복을 한다. */
                for(int rowIndex = excelReadOption.getStartRow() - 1; rowIndex < numOfRows; rowIndex++) {
                    /*
                     * 워크북에서 가져온 시트에서 rowIndex에 해당하는 Row를 가져온다.
                     * 하나의 Row는 여러개의 Cell을 가진다.
                     */
                    row = sheet.getRow(rowIndex);
					
                    // sheet.getRow(rowIndex).getCell(2) : cell(2) (= 3번쨰 컬럼값)이 null인 경우에는 if문을 빠져나가도록 설정
                    if(sheet.getRow(rowIndex).getCell(2) != null && row != null) {
                    
                        /* 가져온 Row의 Cell의 개수를 구한다.*/
                        // numOfCells = row.getPhysicalNumberOfCells();
                        numOfCells = row.getLastCellNum();
                        
                        /* 데이터를 담을 맵 객체 초기화 */
                        map = new HashMap<String, String>();
                        
                        /* cell의 수 만큼 반복한다. */
                        for(int cellIndex = 0; cellIndex < numOfCells; cellIndex++) {
                        
                            /* Row에서 CellIndex에 해당하는 Cell을 가져온다. */
                            cell = row.getCell(cellIndex);
                            
                            /* 
                             * 엑셀 파일로 넘어오는 값이 함수 타입이거나 숫자 타입일 경우, '6.0616xxxxx...'와 같이 표기되는 오류 발생
                             * 함수 타입과 숫자 타입의 경우 String으로 cell타입을 변환 후에 cell값을 가져오는 코드를 추가하였다.
                             */
                            if(cell == null) {
                            	continue;
                            }else {
                            	switch(cell.getCellType()) {
                                    case Cell.CELL_TYPE_NUMERIC :
                                    	if(HSSFDateUtil.isCellDateFormatted(cell)) {
                                        	SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd");
                                        	cell.setCellValue(formatter.format(cell.getDateCellValue()));
                                        }else {
                                            if((cell.getNumericCellValue() + "").contains(".0")){
                                            	cell.setCellValue((int)cell.getNumericCellValue() + "");
                                            }else {
                                               	cell.setCellValue((float)cell.getNumericCellValue() + "");
                                            }
                                         }
                                         break;
                                    case Cell.CELL_TYPE_STRING :
                                        cell.setCellType(Cell.CELL_TYPE_STRING);
                                        cell.setCellValue(cell.getStringCellValue().toString());
                                        break;
                                    case Cell.CELL_TYPE_FORMULA :
                                    	cell.setCellType(Cell.CELL_TYPE_STRING);
                                        String temp_value = cell.getStringCellValue();
                                        if(temp_value.indexOf(".") > 0) {
                                            Double value = Double.parseDouble(String.format("%.1f", Double.parseDouble(cell.getRichStringCellValue().toString())));
                                            cell.setCellValue(value);
                                        }else {
                                            cell.setCellValue(cell.getStringCellValue());
                                        }
                                        break;
                                }
                             }

                            /*
                             * 현재 Cell의 이름을 가져온다
                             * 이름의 예 : A,B,C,D,......
                             */
                            cellName = ExcelCellRef.getName(cell, cellIndex);
                            
                            /*
                             * 추출 대상 컬럼인지 확인한다
                             * 추출 대상 컬럼이 아니라면, 
                             * for로 다시 올라간다
                             */
                            if( !excelReadOption.getOutputColumns().contains(cellName) ) {
                                continue;
                            }
                            
                            /* map객체의 Cell의 이름을 키(Key)로 데이터를 담는다. */
                             map.put(cellName, ExcelCellRef.getValue(cell, wb));
                        }
                        /* 만들어진 Map객체를 List로 넣는다. */
                         map.put("successMessage", "불러오기 성공");
                         result.add(map);
                        }else { /* Column(행) 값이 null이거나 row(열)이 null인 경우 break; */
                            break;
                        }
                    } /* 행의 개수가 끝날 떄까지 */
                } /* 시트 개수가 끝날 떄까지 */
                return result; 
            }
            return null; 
        }
        
/*     
        public static void main(String[] args) {
            
            ExcelReadOption ro = new ExcelReadOption();
            ro.setFilePath("D:/game.xlsx");
            ro.setOutputColumns("A", "B");
            ro.setStartRow(1);
            
            List<Map<String, String>> result = ExcelRead.read(ro);
            
            for(Map<String, String> map : result) {
                System.out.println(map.get("A"));
            }
        }
*/
}