package com.soldesk.homepage.team2.teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.soldesk.homepage.common.main.DBManager;
import com.soldesk.homepage.common.main.MRManager;

public class TeacherDAO {
	private static final TeacherDAO TDAO = new TeacherDAO();

	public TeacherDAO() {
		// TODO Auto-generated constructor stub
	}

	public static TeacherDAO getTdao() {
		return TDAO;
	}

	public void createTeacher(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		MultipartRequest mr = null;
		
		try {
			mr = MRManager.mrSettings(request, response, "team2/img/teacher");
			con = DBManager.connect();
			
			int st_no = Integer.parseInt(mr.getParameter("st_no"));
			String st_name = mr.getParameter("st_name");
			String st_photo = mr.getParameter("st_photo");
			String st_resume = mr.getParameter("st_resume");
			String st_certificate = mr.getParameter("st_certificate");
			
			String sql = "insert into solesk_teacher values(SOLDESK_teacher_seq.nextval, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, st_name);
			pstmt.setString(2, st_photo);
			pstmt.setString(3, st_resume);
			pstmt.setString(4, st_certificate);
			
			if (pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "강사 생성 성공");
			} else {
				request.setAttribute("r", "강사 생성 실패");
			}
		} catch (Exception e) {
			request.setAttribute("r", "강사 생성 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public void deleteTeacher(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBManager.connect();
			int st_no = Integer.parseInt(request.getParameter("st_no"));

			String sql = "delete from soldesk_teacher where st_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, st_no);

			if (pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "강사 삭제 성공");
			} else {
				request.setAttribute("r", "강사 삭제 실패");
			}
		} catch (Exception e) {
			request.setAttribute("r", "강사 삭제 실패");
		}
	}

}
