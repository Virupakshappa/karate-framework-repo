package com.janadri.classFile;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class UiPath {
	
	public static void trigger(String uftPath) throws Exception {



		ProcessBuilder pb = new ProcessBuilder(uftPath);



		Process process = pb.start();
		BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		StringBuffer sb = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
		sb.append(line + "\n");
		}
		System.out.println(sb);
		}
}
