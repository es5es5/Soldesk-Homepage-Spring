package com.soldesk.homepage.team2.contents;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.oreilly.servlet.MultipartRequest;
import com.soldesk.homepage.common.main.DBManager;
import com.soldesk.homepage.common.main.MRManager;
import com.soldesk.homepage.team2.teacher.Teacher;

public class ContentsDAO
{
	private static final ContentsDAO CDAO = new ContentsDAO();
	private ArrayList<Contents> contents;
	private ArrayList<ContentsSubstance> substance;

	public ContentsDAO()
	{
		// TODO Auto-generated constructor stub
	}

	public static ContentsDAO getCdao()
	{
		return CDAO;
	}

	public void createContents(HttpServletRequest request, HttpServletResponse response)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		MultipartRequest mr = null;
		try
		{
			mr = MRManager.mrSettings(request, response, "team2/img/contents");

			con = DBManager.connect();

			String sc_category = mr.getParameter("sc_category");
			String sc_title = mr.getParameter("sc_title");
			String sc_teacher = mr.getParameter("sc_teacher");
			String sc_schedule_start = mr.getParameter("sc_schedule_start");
			String sc_schedule_finish = mr.getParameter("sc_schedule_finish");
			String sc_week = mr.getParameter("sc_week");

			String sc_HH = mr.getParameter("sc_HH");
			int sc_HH2 = Integer.parseInt(sc_HH);
			String sc_mm = mr.getParameter("sc_mm");
			int sc_mm2 = Integer.parseInt(sc_mm);
			String sc_time = String.format("%02d%02d", sc_HH, sc_mm);

			int sc_capacity = Integer.parseInt(mr.getParameter("sc_capacity"));

			String sql = "insert into SOLDESK_contents values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, sc_category);
			pstmt.setString(2, sc_title);
			pstmt.setString(3, sc_teacher);
			pstmt.setString(4, sc_schedule_start);
			pstmt.setString(5, sc_schedule_finish);
			pstmt.setString(6, sc_week);

			if (pstmt.executeUpdate() == 1)
			{
				// contents 등록 성공
			} else
			{
				// contents 등록 실패
			}

		} catch (Exception e)
		{
			// contents 등록 실패
		} finally
		{
			DBManager.close(con, pstmt, null);
		}
	}

	public void delete(HttpServletRequest request, HttpServletResponse response)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try
		{
			// 연결
			con = DBManager.connect();

			String sc_title = request.getParameter("sc_title");

			String sql = "delete from soldesk_contents " + "where sc_title=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, sc_title);

			if (pstmt.executeUpdate() == 1)
			{
				request.setAttribute("r", "삭제 성공");
			} else
			{
				request.setAttribute("r", "삭제 실패");
			}

		} catch (Exception e)
		{
			request.setAttribute("r", "삭제 실패");
		} finally
		{
			DBManager.close(con, pstmt, null);
		}
	}

	public void contentsPaging(int page, HttpServletRequest request, HttpServletResponse response)
	{
		double cnt = 10;
		int itemSize = contents.size();
		int pageCount = (int) Math.ceil(itemSize / cnt);
		request.setAttribute("pageCount", pageCount);
		int start = itemSize - ((int) cnt * (page - 1)) - 1;
		ArrayList<Contents> contents2 = new ArrayList<>();
		for (int i = start; i > (page == pageCount ? -1 : start - (int) cnt + 2); i--)
		{
			contents2.add(contents.get(i));
		}
		request.setAttribute("contents", contents2);
	}

	public void contentsPaging(HttpServletRequest request, HttpServletResponse response)
	{
		int pageCount = (int) Math.ceil(contents.size() / 10.0);
		request.setAttribute("pageCount", pageCount);
		ArrayList<Contents> contents2 = new ArrayList<>();
		for (int i = contents.size() - 1; i > (1 == pageCount ? -1 : contents.size() - 11); i--)
		{
			contents2.add(contents.get(i));
		}
		request.setAttribute("contents", contents2);
	}

	public void getAllContents(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setAttribute("contents", DBManager.newConnect().selectList("team2.getAll"));
		} catch (Exception e)
		{
			contents = new ArrayList<>();
			contents.add(null);
		}
	}

	public void getDetailContents(HttpServletRequest request, HttpServletResponse response)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBManager.connect();
			pstmt = con.prepareStatement("select * from SOLDESK_contents, SOLDESK_CONTENTS_SUBSTANCE, SOLDESK_TEACHER "
					+ "where sc_no=? and sc_no = scs_contents_no and sc_teacher = st_no " + "order by scs_order");
			pstmt.setString(1, request.getParameter("sc_no"));
			rs = pstmt.executeQuery();
			// if문으로 scs_info가 이미지인지 텍스트인지 강사페이지인지 구분하여 보낼 계획
			substance = new ArrayList<>();
			for (int i = 0; rs.next(); i++)
			{
				if (i == 0)
				{
					Contents c = new Contents(rs.getInt("sc_no"), rs.getInt("sc_category"), rs.getString("sc_title"),
							rs.getInt("sc_teacher"), rs.getDate("sc_schedule_start"), rs.getDate("sc_schedule_finish"),
							rs.getInt("sc_week"), rs.getInt("sc_capacity"), rs.getInt("sc_expense"));
					SimpleDateFormat mm = new SimpleDateFormat("MM");
					SimpleDateFormat hh = new SimpleDateFormat("HH");
					int totalMonth = Integer.parseInt(mm.format(c.getSc_schedule_finish()))
							- Integer.parseInt(mm.format(c.getSc_schedule_start()));
					ArrayList<String> totalWeeks = new ArrayList<>();
					int k = c.getSc_week() + 1;
					for (int j = 64; j > 0; j = j >> 1)
					{
						if (k - j > 0)
						{
							switch (j)
							{
							case 64:
								totalWeeks.add("일");
								break;
							case 32:
								totalWeeks.add("토");
								break;
							case 16:
								totalWeeks.add("금");
								break;
							case 8:
								totalWeeks.add("목");
								break;
							case 4:
								totalWeeks.add("수");
								break;
							case 2:
								totalWeeks.add("화");
								break;
							case 1:
								totalWeeks.add("월");
								break;
							default:
								break;
							}
							k -= j;
						}
					}
					request.setAttribute("t", new Teacher(rs.getInt("st_no"), rs.getString("st_name"),
							rs.getString("st_photo"), rs.getString("st_resume"), rs.getString("st_certificate")));
					request.setAttribute("c", c);
					request.setAttribute("totalMonth", totalMonth);
					request.setAttribute("totalHours",
							totalMonth * 20 * (Integer.parseInt(hh.format(c.getSc_schedule_finish()))
									- Integer.parseInt(hh.format(c.getSc_schedule_start())) - 1));
					request.setAttribute("totalWeeks", totalWeeks);
				}
				substance.add(new ContentsSubstance(rs.getInt("scs_no"), rs.getInt("scs_contents_no"),
						rs.getInt("scs_order"), rs.getString("scs_title"),
						rs.getString("scs_info").replace("{{{", "<img alt=\"내용\" src=\"").replace("}}}", "\">")));
			}
			if (substance.size() == 0)
			{
				substance.add(null);
			}
			request.setAttribute("substance", substance);
		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("r", "DB서버오류");
		} finally
		{
			DBManager.close(con, pstmt, rs);
		}
	}

	public ArrayList<Date> holyDay(Date start, Date finish)
	{
		HttpsURLConnection huc;
		JSONParser jp = new JSONParser();
		JSONArray ja;
		JSONObject holyDay;
		Calendar startCal = Calendar.getInstance();
		Calendar finishCal = Calendar.getInstance();
		startCal.setTime(start);
		finishCal.setTime(finish);
		int fY = finishCal.get(Calendar.YEAR);
		StringBuffer sb;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		ArrayList<Date> holyDays = new ArrayList<>();
		try
		{
			for (int i = startCal.get(Calendar.YEAR); i <= fY; i++)
			{
				huc = (HttpsURLConnection) new URL(
						String.format("https://apis.sktelecom.com/v1/eventday/days?month=&year=%d&type=h,i&day=", i))
								.openConnection();
				huc.addRequestProperty("referer",
						"https://developers.sktelecom.com/projects/project_31848010/services/EventDay/apiGuide/");
				huc.addRequestProperty("Accept", "application/json");
				huc.addRequestProperty("TDCProjectKey", "59ee7384-a5a8-4fef-b265-db673e6ac086");
				ja = (JSONArray) ((JSONObject) jp.parse((MyConverter.convertToString(huc.getInputStream()))))
						.get("results");
				for (int j = 0; ja != null && j < ja.size(); j++)
				{
					holyDay = (JSONObject) ja.get(j);
					sb = new StringBuffer();
					sb.append(holyDay.get("year"));
					sb.append(holyDay.get("month"));
					sb.append(holyDay.get("day"));
					holyDays.add(sdf.parse(sb.toString()));
				}
			}
		} catch (Exception e)
		{
		}
		for (int i = 0; i < holyDays.size(); i++)
		{
			if (holyDays.get(i).before(start) || holyDays.get(i).after(finish))
			{
				holyDays.remove(i);
				i--;
			}
		}
		return holyDays;
	}
}
