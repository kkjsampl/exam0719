package com.aboard1.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboard1.service.*;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Long bno = Long.parseLong(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String password = request.getParameter("password");	
		
		Boolean result = BoardService.getInstance().update(bno, title, content, password);
		if(result) 
			response.sendRedirect("/aboard1/list");
		else
			response.sendRedirect("/aboard1/list?error");
	}
}
