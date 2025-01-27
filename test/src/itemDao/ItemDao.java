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
import itemDto.UserDto;

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
	
	/*入力したユーザー名、パスワードの照合*/
	public UserDto getLoginInfo(String name, String pass) throws SQLException{
		
		UserDto user = null;
		sql = "SELECT * from user where name = ? and password = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, pass);
		
		try {
			rs = ps.executeQuery();
			while(rs.next()) {
				user = new UserDto();
				user.setName(rs.getString("name"));
				user.setPass(rs.getInt("password"));
				user.setId(rs.getInt("id"));
			}
		}finally {
			ps.close();
		}
		return user;
	}
	
	/*ホーム画面に表示する全作品のデータ*/
	public ArrayList<ItemDto> getItemsFromAll() throws SQLException{
		
		sql = "select * from item order by rand()";
		ps = con.prepareStatement(sql);
		return search(ps);
	}
	
	public ArrayList<ItemDto> getAll(int id) throws SQLException{
		
		sql = "select * from library" + id + " join item on item.id = library" + id + ".itemId";
		ps = con.prepareStatement(sql);
		
		return search(ps);
	}
	
	/*作品名で検索*/
	public ArrayList<ItemDto> getItemsFromName(String name) throws SQLException{
		
		sql = "select * from item where name like ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, "%" + name + "%");
		return search(ps);
	}
	
	/*カテゴリで検索*/
	public ArrayList<ItemDto> getItemsFromCategory(String name) throws SQLException{
		
		sql = "select * from item where category like ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, "%" + name + "%");
		return search(ps);
	}
	
	public int createTable(int id) throws SQLException {
		
		int n = 0;
		sql = "create table if not exists library" + id + " (itemId int unique)";
		ps = con.prepareStatement(sql);
		n = ps.executeUpdate();
		return n;
	}
	
	public int insert(int id, int itemId) throws SQLException {
		int n = 0;
		sql = "insert into library" + id + " values(" + itemId + ")";
		ps = con.prepareStatement(sql);
		n = ps.executeUpdate();
		return n;
	}
	/*ライブラリに保存するデータの取得*/
	public ArrayList<ItemDto> getItem(int code) throws SQLException{
		
		sql = "select * from item where code = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, code);
		return search(ps);
	}

	private ArrayList<ItemDto> search(PreparedStatement ps) throws SQLException {
		
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
				dto.setImg(rs.getString("img"));
				System.out.println(rs.getString("img"));
				dto.setReplay(rs.getString("replay"));
				System.out.println(rs.getString("replay"));
				list.add(dto);
			}
		}finally {
			ps.close();
		}
		return list;
	
	}
	
}
