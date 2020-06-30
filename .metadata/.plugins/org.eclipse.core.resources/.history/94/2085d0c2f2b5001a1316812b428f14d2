package dbAccess;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import itemDao.ItemDao;
import itemDto.ItemDto;

public class SelectAll implements DBAccess {

	@Override
	public void execute(HttpServletRequest request) throws SQLException {
		
		ItemDao dao = null;
		
		System.out.println("全ての作品を表示");
		
		try {
				dao = new ItemDao();
				ArrayList<ItemDto> list = dao.getItemsFromAll();
				System.out.println(list.get(0).getName());
				System.out.println(list.get(0).getImg());
				if(list.size() > 0) {
					request.setAttribute("list", list);
				}else {
					request.setAttribute("message", "該当するデータがありません");
				}
			 {
				request.setAttribute("message", "入力が不正です");
			}
		}finally {
			if(dao != null) dao.close();
		}

	}

}
