package com.janadri.classFile;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class JavaFuns {

	
	public String writeData2() throws FileNotFoundException, UnsupportedEncodingException {
		PrintWriter writer = new PrintWriter("simpledata3.xml", "UTF-8");
//		writer.println(arg);
		writer.close();
		return "xml file has been created....";
	}
	
	public String writeData3(String arg) throws FileNotFoundException, UnsupportedEncodingException {
		PrintWriter writer = new PrintWriter("simpledata3.xml", "UTF-8");
		writer.println(arg);
		writer.close();
		return "xml file has been updated....";
	}
	 public static void main(String[] args)  {
		 JavaFuns jf = new JavaFuns();
		 try {
			jf.writeData2();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
}
