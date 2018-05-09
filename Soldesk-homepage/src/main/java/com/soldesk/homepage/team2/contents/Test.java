package com.soldesk.homepage.team2.contents;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Test
{
	public static void main(String[] args)
	{
		try
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			ArrayList<Date> holyDays = ContentsDAO.getCdao().holyDay(sdf.parse("2016-11-08"), sdf.parse("2019-02-08"));
			System.out.println("시작일정과 종료일정 사이의 법정공휴일은 " + holyDays.size() + "번 입니다.");
			System.out.println();
			System.out.println("시작일정과 종료일정 사이의 법정공휴일은 각각");
			for (Date date : holyDays)
			{
				System.out.println(date);
			}
			System.out.println("입니다.");
		} catch (Exception e)
		{
		}
	}
}
