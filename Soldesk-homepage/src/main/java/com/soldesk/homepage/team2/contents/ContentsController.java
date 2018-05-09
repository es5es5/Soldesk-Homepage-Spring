package com.soldesk.homepage.team2.contents;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContentsController {
	@RequestMapping(value="/", method= RequestMethod.GET)
	public String goContentsPage(HttpServletRequest request, HttpServletResponse response) {
		// "contentsPage" request 내용 추가 요망  
		return "index"; // 현재 프로젝트엔 index 없는데 이거 논의 필요.
	}
}
