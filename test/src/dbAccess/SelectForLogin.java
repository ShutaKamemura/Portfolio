package dbAccess;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import itemDao.ItemDao;


public class SelectForLogin implements DBAccess{

	@Override
	public void execute(HttpServletRequest request) throws SQLException {
		
		ItemDao dao = null;
		int n = 0;
		
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		request.setAttribute("login", name);
		
		if(name == null || name.isEmpty() || pass == null || pass.isEmpty()) {
			
			request.setAttribute("login", "error");
			request.setAttribute("n", n);
			return;
		}
		
		try {
			dao = new ItemDao();
			n = dao.getLoginInfo(name, pass); //データベースに存在するか確認
			request.setAttribute("n", n);
			System.out.println(n);
			
			
		}finally {
			if(dao != null) dao.close();
		}
	}

}
