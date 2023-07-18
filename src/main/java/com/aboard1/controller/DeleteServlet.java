package com.aboard1.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboard1.service.*;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long bno = Long.parseLong(request.getParameter("bno"));
		String password = request.getParameter("password");
		Boolean result = BoardService.getInstance().delete(bno, password);
		if(result) 
			response.sendRedirect("/aboard1/list");
		else
			response.sendRedirect("/aboard1/list?error");
	}
}
