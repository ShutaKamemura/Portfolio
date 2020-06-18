package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbAccess.DBAccess;
import dbAccess.SelectCategory;
import dbAccess.SelectName;
import dbAccess.SelectUserName;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DBAccess dbAccess;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selectWay = request.getParameter("selectWay");
		
		switch(selectWay) {
		case "username":
			dbAccess = new SelectUserName();
			break;
		case "name":
			dbAccess = new SelectName();
			break;
		case "category":
			dbAccess = new SelectCategory();
			break;
		}
		try {
			dbAccess.execute(request);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("selectWay", selectWay);
		ServletContext context = getServletContext();
		RequestDispatcher dis = context.getRequestDispatcher("/search.jsp");
		dis.forward(request, response);
	}


}
