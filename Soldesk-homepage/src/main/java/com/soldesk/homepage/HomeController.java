package com.soldesk.homepage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value="/", method= RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		return "team2/contents/contents";
	}
	
}
