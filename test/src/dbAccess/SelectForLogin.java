package dbAccess;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import itemDao.ItemDao;
import itemDto.UserDto;


public class SelectForLogin implements DBAccess{

	@Override
	public void execute(HttpServletRequest request) throws SQLException {
		
		ItemDao dao = null;
		UserDto user = null;
		
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		request.setAttribute("login", name);
		
		if(name == null || name.isEmpty() || pass == null || pass.isEmpty()) {
			
			request.setAttribute("login", "error");
			request.setAttribute("user", user);
			return;
		}
		
		try {
			dao = new ItemDao();
			user = dao.getLoginInfo(name, pass); //データベースに存在するか確認
			request.setAttribute("user", user);
			System.out.println(user.getName());
			
			
		}finally {
			if(dao != null) dao.close();
		}
	}

}
