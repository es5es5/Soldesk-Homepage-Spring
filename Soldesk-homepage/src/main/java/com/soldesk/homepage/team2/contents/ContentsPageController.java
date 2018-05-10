package com.soldesk.homepage.team2.contents;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContentsPageController {
	@RequestMapping(value = "/contentsPage.go", method = RequestMethod.GET)
	public String goContentsPage(HttpServletRequest request, HttpServletResponse response) {
		ContentsDAO.getCdao().contentsPaging(Integer.parseInt(request.getParameter("p")), request, response);
		request.setAttribute("contentPage", "contents/contentsBBS.jsp");
		return "index";
	}
}
