package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.StyleCar;


public class StyleCarDAO extends BaseDAO{
	
	/**
	 * Ham tra ve danh sach phong cach xe
	 * 
	 * @return
	 */
	public ArrayList<StyleCar> getListStyle() {
		String sql = " SELECT StyleCarID, StyleCar  " +
				" FROM [StyleCar] " +
				" ORDER BY StyleCar ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			rs = restmt.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ArrayList<StyleCar> list = new ArrayList<StyleCar>();
		StyleCar styleCar;
		try {
			while (rs.next()) {
				styleCar = new StyleCar();
				styleCar.setStyleCarID(rs.getString("StyleCarID"));
				styleCar.setStyleCar(rs.getString("StyleCar"));
				list.add(styleCar);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * Ham them mot phong cach xe
	 * 
	 * @param styleCar
	 */
	public void addStyle(String styleCar) {
		String sql=	" INSERT INTO [StyleCar](StyleCar) VALUES (?) ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection
			.prepareStatement(sql);
			
			restmt.setString(1, styleCar);
			
			restmt.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Ham xoa mot phong cach xe
	 * 
	 * @param styleCarID
	 */
	public void deleteStyle(String styleCarID) {
		String sql=	"DELETE FROM [StyleCar] WHERE StyleCarID = ?";
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection
			.prepareStatement(sql);
			restmt.setString(1, styleCarID);
			
			restmt.executeUpdate();
		} catch (ClassNotFoundException e){
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Ham sua ten mot phong cach xe
	 * 
	 * @param styleCarID
	 * @param styleCar
	 */
	public void editStyle(String styleCarID, String styleCar) {
		String sql=	" UPDATE [StyleCar] SET StyleCar = ? WHERE StyleCarID = ? ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection
			.prepareStatement(sql);
			
			restmt.setString(1, styleCar);
			restmt.setString(2, styleCarID);
			
			restmt.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Kiem tra ten phong cach da ton tai hay khong: ton tai=true, khong ton tai=false
	 * 
	 * @param styleCar
	 * @return
	 */
	public boolean checkStyleName(String styleCar) {
		String sql = " SELECT * FROM [StyleCar] WHERE StyleCar = ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection
					.prepareStatement(sql);
			restmt.setString(1, styleCar);
			rs = restmt.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
