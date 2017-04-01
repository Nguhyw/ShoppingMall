package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {
	private static final  String sqlname = "shopping"; //���ݿ��е����ݱ�����
	private static final  String driver = "com.mysql.jdbc.Driver"; //���ݿ�����
	private static final  String url = "jdbc:mysql://localhost:3306/"+sqlname+"?useUnicode=true&characterEncoding=UTF-8";
	private static final  String username = "root"; //��¼���ݿ���û���
	private static final  String password = ""; //����
	
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
			System.out.println("���ݿ����ӳɹ�");
		}else{
			System.out.println("���ݿ�����ʧ��");
		}
	}
	
}
