package com.aboard1.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.aboard1.service.*;
import com.aboard1.vo.*;

@WebServlet("/list")
public class ListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Board> list = BoardService.getInstance().list();
	
		RequestDispatcher rd = request.getRequestDispatcher("/list.jsp");
		request.setAttribute("list", list);
		rd.forward(request, response);
	}

}
