package com.soldesk.homepage.team2.contents;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContentsController {
	@Autowired
	private ContentsDAO cDAO;
	
	@RequestMapping(value="/contents.go", method= RequestMethod.GET)
	public String goContents(Contents c, HttpServletRequest request, HttpServletResponse response) {
		cDAO.getDetailContents(c, request, response);
		request.setAttribute("contents", "team2/contents/contents.jsp");
		return "index";
	}
}
