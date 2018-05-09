package com.soldesk.homepage.team2.contents;

public class ContentsSubstance
{
	private int scs_no;
	private int scs_contents_no;
	private int scs_order;
	private String scs_title;
	private String scs_info;

	public int getScs_no()
	{
		return scs_no;
	}

	public void setScs_no(int scs_no)
	{
		this.scs_no = scs_no;
	}

	public int getScs_contents_no()
	{
		return scs_contents_no;
	}

	public void setScs_contents_no(int scs_contents_no)
	{
		this.scs_contents_no = scs_contents_no;
	}

	public int getScs_order()
	{
		return scs_order;
	}

	public void setScs_order(int scs_order)
	{
		this.scs_order = scs_order;
	}

	public String getScs_title()
	{
		return scs_title;
	}

	public void setScs_title(String scs_title)
	{
		this.scs_title = scs_title;
	}

	public String getScs_info()
	{
		return scs_info;
	}

	public void setScs_info(String scs_info)
	{
		this.scs_info = scs_info;
	}

	public ContentsSubstance(int scs_no, int scs_contents_no, int scs_order, String scs_title, String scs_info)
	{
		super();
		this.scs_no = scs_no;
		this.scs_contents_no = scs_contents_no;
		this.scs_order = scs_order;
		this.scs_title = scs_title;
		this.scs_info = scs_info;
	}

	public ContentsSubstance()
	{
		super();
	}
}
