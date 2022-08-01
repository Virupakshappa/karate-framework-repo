package com.janadri.classFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.aspose.cells.JsonLayoutOptions;
import com.aspose.cells.JsonUtility;
import com.aspose.cells.SaveFormat;
import com.aspose.cells.Workbook;
import com.aspose.cells.Worksheet;
import com.intuit.karate.graal.JsMap;

public class JsonToExcelConverter{
	

	public static void main(String[] args) throws Exception {
		
		
	}
	public int getRow(XSSFSheet worksheet) {
		int rowTotal = worksheet.getLastRowNum();



		if ((rowTotal > 0) || (worksheet.getPhysicalNumberOfRows() > 0)) {
		rowTotal++;
		}
		return rowTotal;
		}
	
	public String createXlsx(String jsonPath, String excelPath) throws Exception {
		// create a blank Workbook object
		XSSFWorkbook  workbook = new XSSFWorkbook(excelPath);

				// access default empty worksheet
				XSSFSheet worksheet = workbook.getSheetAt(0);
				
				int rowNumber = getRow(worksheet);
				// set JsonLayoutOptions for formatting
				JsonLayoutOptions layoutOptions = new JsonLayoutOptions();
				layoutOptions.setArrayAsTable(true);

				JSONParser jsonParser = new JSONParser();
				
				FileReader reader = new FileReader(jsonPath);
				
				String jsonInput = (jsonParser.parse(reader)).toString();
				
				// export JSON data to CSV
				JsonUtility.importData(jsonInput, null, 0, 0, layoutOptions);

				// save CSV file
				workbook.save(excelPath, SaveFormat.AUTO);
				return "xlsx file has been created";
	}
}
