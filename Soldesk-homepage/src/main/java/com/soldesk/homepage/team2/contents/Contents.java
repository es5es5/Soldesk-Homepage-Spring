package com.soldesk.homepage.team2.contents;

import java.util.Date;

public class Contents
{
	private int sc_no;
	private int sc_category;
	private String sc_title;
	private int sc_teacher;
	private Date sc_schedule_start;
	private Date sc_schedule_finish;
	private int sc_week;
	private int sc_capacity;
	private int sc_expense;

	public int getSc_no()
	{
		return sc_no;
	}

	public void setSc_no(int sc_no)
	{
		this.sc_no = sc_no;
	}

	public int getSc_category()
	{
		return sc_category;
	}

	public void setSc_category(int sc_category)
	{
		this.sc_category = sc_category;
	}

	public String getSc_title()
	{
		return sc_title;
	}

	public void setSc_title(String sc_title)
	{
		this.sc_title = sc_title;
	}

	public int getSc_teacher()
	{
		return sc_teacher;
	}

	public void setSc_teacher(int sc_teacher)
	{
		this.sc_teacher = sc_teacher;
	}

	public Date getSc_schedule_start()
	{
		return sc_schedule_start;
	}

	public void setSc_schedule_start(Date sc_schedule_start)
	{
		this.sc_schedule_start = sc_schedule_start;
	}

	public Date getSc_schedule_finish()
	{
		return sc_schedule_finish;
	}

	public void setSc_schedule_finish(Date sc_schedule_finish)
	{
		this.sc_schedule_finish = sc_schedule_finish;
	}

	public int getSc_week()
	{
		return sc_week;
	}

	public void setSc_week(int sc_week)
	{
		this.sc_week = sc_week;
	}

	public int getSc_capacity()
	{
		return sc_capacity;
	}

	public void setSc_capacity(int sc_capacity)
	{
		this.sc_capacity = sc_capacity;
	}

	public int getSc_expense()
	{
		return sc_expense;
	}

	public void setSc_expense(int sc_expense)
	{
		this.sc_expense = sc_expense;
	}

	public Contents(int sc_no, int sc_category, String sc_title, int sc_teacher, Date sc_schedule_start,
			Date sc_schedule_finish, int sc_week, int sc_capacity, int sc_expense)
	{
		super();
		this.sc_no = sc_no;
		this.sc_category = sc_category;
		this.sc_title = sc_title;
		this.sc_teacher = sc_teacher;
		this.sc_schedule_start = sc_schedule_start;
		this.sc_schedule_finish = sc_schedule_finish;
		this.sc_week = sc_week;
		this.sc_capacity = sc_capacity;
		this.sc_expense = sc_expense;
	}

	public Contents()
	{
		super();
	}
}
