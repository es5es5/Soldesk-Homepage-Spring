package com.soldesk.homepage.team2.contents;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class MyConverter
{
	public static String convertToString(InputStream is) throws Exception
	{
		InputStreamReader isr = new InputStreamReader(is, "utf-8");
		BufferedReader br = new BufferedReader(isr);
		StringBuffer sb = new StringBuffer();
		String line = null;
		while ((line = br.readLine()) != null)
		{
			sb.append(line);
		}
		return sb.toString();
	}
}
