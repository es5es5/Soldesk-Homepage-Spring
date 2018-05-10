package com.soldesk.homepage.team2.contents;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContentsBBSController {
	@RequestMapping(value="/contentsBBS.go", method= RequestMethod.GET)
	public String goContentsBBS(HttpServletRequest request, HttpServletResponse response) {
		ContentsDAO.getCdao().getAllContents(request, response);
		request.setAttribute("contentPage", "contents/contentsBBS.jsp");
		return "index";
	}
}
