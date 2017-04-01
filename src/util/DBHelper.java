package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {
	private static final  String sqlname = "shopping"; //数据库中的数据表名字
	private static final  String driver = "com.mysql.jdbc.Driver"; //数据库驱动
	private static final  String url = "jdbc:mysql://localhost:3306/"+sqlname+"?useUnicode=true&characterEncoding=UTF-8";
	private static final  String username = "root"; //登录数据库的用户名
	private static final  String password = ""; //密码
	
	private static Connection conn= null;
	
	static {
		try{
			Class.forName(driver);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException{
		if(conn==null){
			conn = DriverManager.getConnection(url, username, password);
		}
		return conn;
	}
	
	public static void main(String[] args) throws Exception {
		Connection conn = DBHelper.getConnection();
		if(conn!=null){
			System.out.println("数据库连接成功");
		}else{
			System.out.println("数据库连接失败");
		}
	}
	
}
