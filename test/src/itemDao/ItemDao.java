package itemDao;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import itemDto.ItemDto;

/**
 * Servlet implementation class ItemDao
 */
@WebServlet(name = "ItemDao.java", urlPatterns = { "/ItemDao.java" })
public class ItemDao extends HttpServlet {
		
	private Connection con;
	private String sql;
	PreparedStatement ps = null;
	ResultSet rs = null;
	ArrayList<ItemDto> list = null;
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public ItemDao() throws SQLException{
		String url= "jdbc:mysql://localhost:3306/manage?serverTimezone=UTC";
		String user = "root";
		String pass = "Kq+04mfn9";
		con = DriverManager.getConnection(url, user, pass);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void close() {
		try {
			if(con != null) con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getLoginInfo(String name, String pass) throws SQLException{
		
		int row = 0;
		sql = "SELECT * from user where name = ? and password = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, pass);
		
		try {
			rs = ps.executeQuery();
			if(rs.next()) {
				row = 1;
			}
		}finally {
			ps.close();
		}
		return row;
	}
	
	public ArrayList<ItemDto> getItemsFromName(String name) throws SQLException{
		
		sql = "select * from item where name like ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, "%" + name + "%");
		return search(ps);
	}


	private ArrayList<ItemDto> search(PreparedStatement ps) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		try {
			rs = ps.executeQuery();
			list = new ArrayList<>();
			ItemDto dto;
			while(rs.next()) {
				dto = new ItemDto();
				dto.setId(rs.getInt("id"));
				dto.setCode(rs.getInt("code"));
				dto.setName(rs.getString("name"));
				dto.setCategory(rs.getString("category"));
				list.add(dto);
			}
		}finally {
			ps.close();
		}
		return list;
	
	
	}

	private String parseCategory(String string) {
		
		return null;
	}

	public ArrayList<ItemDto> getItemsFromCategory(String name) throws SQLException{
		
		sql = "select * from item where category like ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, "%" + name + "%");
		return search(ps);
	}
	

}