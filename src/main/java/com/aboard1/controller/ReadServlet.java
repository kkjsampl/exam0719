package com.aboard1.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.aboard1.service.*;
import com.aboard1.vo.*;

@WebServlet("/read")
public class ReadServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long bno = Long.parseLong(request.getParameter("bno"));
		Board board = BoardService.getInstance().read(bno);
		
		RequestDispatcher rd = request.getRequestDispatcher("/read.jsp");
		request.setAttribute("board", board);
		rd.forward(request, response);
	}
}
