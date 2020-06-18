package dbAccess;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;


public interface DBAccess {

	public void execute(HttpServletRequest request) throws SQLException;
		// TODO 自動生成されたメソッド・スタブ

}
