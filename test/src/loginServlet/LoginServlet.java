package loginServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbAccess.DBAccess;
import dbAccess.SelectForLogin;

/**
 * Servlet implementation class LoginServlet
 *・doGet...ログインページに遷移<br>
 *・doPost...データ照合処理を呼び出し、成功時はリダイレクト、失敗時はログインページに戻る
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DBAccess dbAccess;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		ServletContext context = getServletContext();
		RequestDispatcher dis = context.getRequestDispatcher("/mypageTop.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		dbAccess = new SelectForLogin();
		
		try {
			dbAccess.execute(request);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String login = (String)request.getAttribute("login");
		
		HttpSession session = request.getSession();
		session.setAttribute("login2", login);
		int n = (int)request.getAttribute("n");
		
		switch(n) {
		case 1:
			ServletContext context = getServletContext();
			RequestDispatcher dis = context.getRequestDispatcher("/mypage.jsp");
			dis.forward(request, response);
			break;
		default:
			request.setAttribute("message", "ユーザー名、パスワードが正しく入力されていません");
			doGet(request, response);
			break;
		}
		
	}

}