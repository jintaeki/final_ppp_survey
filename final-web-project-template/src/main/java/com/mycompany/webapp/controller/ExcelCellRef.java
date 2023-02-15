package com.mycompany.webapp.controller;

import java.text.SimpleDateFormat;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


import org.apache.poi.poifs.filesystem.POIFSFileSystem;



/* xlsx 파일 출력시 선언 */
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

 
public class ExcelCellRef {
    /**
     * Cell에 해당하는 Column Name을 가젼온다(A,B,C..)
     * 만약 Cell이 Null이라면 int cellIndex의 값으로
     * Column Name을 가져온다.
     * @param cell
     * @param cellIndex
     * @return
     */
	static FormulaEvaluator evaluator;
    public static String getName(Cell cell, int cellIndex) {
        int cellNum = 0;
        if(cell != null) {
            cellNum = cell.getColumnIndex();
        }
        else {
            cellNum = cellIndex;
        }
        
        return CellReference.convertNumToColString(cellNum);
    }
    
    public static String getValue(Cell cell, Workbook wb) {
        String value = "";
        
        if(cell == null) {
            value = "";
        }
        if(cell != null) {
            switch(cell.getCellType()) {
            case Cell.CELL_TYPE_FORMULA :
               if(evaluator.evaluateFormulaCell(cell)==Cell.CELL_TYPE_NUMERIC) {
                    value = (float)cell.getNumericCellValue() + ""; // 계산된 수식의 값을 가져옴
                }
                else if(evaluator.evaluateFormulaCell(cell)==Cell.CELL_TYPE_STRING) {
                    value = cell.getStringCellValue(); // 계산된 수식의 문자값을 가져옴
                }
                break;
          
                
            case Cell.CELL_TYPE_STRING :
            	value = cell.getStringCellValue();
                break;
                
                
            case Cell.CELL_TYPE_BLANK : 
            	value = "";
                break;
                
            case Cell.CELL_TYPE_ERROR :
            	value = cell.getErrorCellValue() + "";
                break;
                
            default : 
            	value = cell.getStringCellValue();
            }
        }
        return value;
    }
}