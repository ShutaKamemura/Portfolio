package mypageServlet;

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
import dbAccess.SelectForLogin;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/MypageServlet")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static DBAccess dbAccess;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String btn = request.getParameter("btn");
		String next = null;
		
		if(btn != null) {
			switch (btn) {
			case "home":
				next = "mypage.jsp";
				break;
			case "search":
				next = "SearchServlet";
				break;
			case "like":
				next = "LibraryServlet";
				break;
			case "set":
				next = "SetServlet";
				break;
			case "replay":
				next = "ReplayServlet";
				break;
			case "keep":
				next = "SaveServlet";
				break;
			default:
				next = "mypage.jsp";
				break;
			}
		}else {
			next = "mypage.jsp";
		}
		
		dbAccess = new SelectForLogin();
		try {
			dbAccess.execute(request);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ServletContext context = getServletContext();
		RequestDispatcher dis = context.getRequestDispatcher("/" + next);
		dis.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
