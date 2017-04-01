package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBHelper;

import entity.Items;


//��Ʒҵ���߼���
public class ItemsDAO {
	
	
	//��ȡ���е���Ʒ��Ϣ
	public ArrayList<Items> getAllItems(){
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Items> list = new ArrayList<Items>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from items;"; //Ҫִ�е�sql���
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getInt("price"));
				item.setPicture(rs.getString("picture"));
				
				list.add(item); //��һ����Ʒ���뼯��
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			//�ͷ����ݼ�����
			if(rs!=null){
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			//�ͷ�������
			if(stmt!=null){
				try {
					stmt.close();
					stmt = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}
	
	//������Ʒ��Ż����Ʒ����
	public Items getItemsById(int id){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Items item = new Items();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from items where id=?;"; //Ҫִ�е�sql���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()){
				item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getInt("price"));
				item.setPicture(rs.getString("picture"));
				
			}
			else{
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("�쳣");
		}
		finally{
			//�ͷ����ݼ�����
			if(rs!=null){
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			//�ͷ�������
			if(stmt!=null){
				try {
					stmt.close();
					stmt = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return item;
	}
	//��������������Ʒ�ļ�¼
	public ArrayList<Items> getViewList(String str){
		System.out.println("���ݵĲ���"+str);
		ArrayList<Items> list = new ArrayList<Items> ();
		if(str!=null&&str.length()>0){
			
			String[] arr = str.split(",");
			if(arr.length>=5){
				for(int i=arr.length-1;i>arr.length-1-5;i--){
					list.add(getItemsById(Integer.parseInt(arr[i])));
				}
			}
			else
			{
				for(int i=arr.length-1;i>=0;i--){
					list.add(getItemsById(Integer.parseInt(arr[i])));
				}
			}
			return list;
		}
		else{
			return null;
		}
		
	}
	
	
	public static void main(String[] args) {
		 ArrayList<Items> list = new ArrayList<Items>();
		 ItemsDAO isd = new ItemsDAO();
		 list = isd.getViewList("1,2,4");
		 for (Items items : list) {
			System.out.println(items);
		}
		 
		 System.out.println(isd.getItemsById(2));
	}
}
