package dbAccess;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import itemDao.ItemDao;
import itemDto.ItemDto;
import itemDto.UserDto;
import loginServlet.LoginServlet;

public class SelectSave implements DBAccess {

	@Override
	public void execute(HttpServletRequest request) throws SQLException {
		ItemDao dao = null;
		int itemId = Integer.parseInt(request.getParameter("id"));
		
		HttpSession session = request.getSession();
		UserDto user = (UserDto) session.getAttribute("user");
		
		try {
			dao = new ItemDao();
			int create = dao.createTable(user.getId());
			System.out.println(create);
			try {
				int insert = dao.insert(user.getId(), itemId);
			}catch(Exception e){
				System.out.println("Duplicate entry");
			}
			
			ArrayList<ItemDto> dto = dao.getAll(user.getId());
			request.setAttribute("list", dto);
			
		}finally {
			if(dao != null) dao.close();
		}

	}

}
