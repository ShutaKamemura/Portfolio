package dbAccess;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import itemDao.ItemDao;
import itemDto.ItemDto;

public class SelectCategory implements DBAccess {

	@Override
	public void execute(HttpServletRequest request) throws SQLException {
		ItemDao dao = null;
		String category = request.getParameter("category");
		request.setAttribute("aaa", category);
		System.out.println(category + "を選択");
		
		try {
			if(category != null && !category.isEmpty() ) {
				dao = new ItemDao();
				ArrayList<ItemDto> list = dao.getItemsFromCategory(category);
				System.out.println(list.get(0).getCategory());
				if(list.size() > 0) {
					request.setAttribute("list", list);
				}else {
					request.setAttribute("message", "該当するデータがありません");
				}
			}else {
				request.setAttribute("message", "入力が不正です");
			}
		}finally {
			if(dao != null) dao.close();
		}

	}

}
