package com.soldesk.homepage.common.main;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MRManager {
	public static MultipartRequest mrSettings(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		String p = request.getServletContext().getRealPath(path);
		MultipartRequest mr = new MultipartRequest(request, p, 31457280, "euc-kr", new DefaultFileRenamePolicy());
		
		return mr;
	}
}
