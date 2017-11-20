package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.TypeCar;

public class TypeCarDAO extends BaseDAO {

	/**
	 * Ham tra ve danh sach cac loai xe
	 * 
	 * @return
	 */
	public ArrayList<TypeCar> getListType() {
		String sql = " SELECT TypeCarID, TypeCar  " + " FROM [TypeCar] " + " ORDER BY TypeCar ";
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

		ArrayList<TypeCar> list = new ArrayList<TypeCar>();
		TypeCar typeCar;
		try {
			while (rs.next()) {
				typeCar = new TypeCar();
				typeCar.setTypeCarID(rs.getString("TypeCarID"));
				typeCar.setTypeCar(rs.getString("TypeCar"));
				list.add(typeCar);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Ham them mot loai xe
	 * 
	 * @param typeCar
	 */
	public void addType(String typeCar) {
		String sql = " INSERT INTO [TypeCar](TypeCar) VALUES (?) ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, typeCar);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Ham xoa mot loai xe
	 * 
	 * @param typeCarID
	 */
	public void deleteType(String typeCarID) {
		String sql = "DELETE FROM [TypeCar] WHERE TypeCarID = ?";
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, typeCarID);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Ham sua ten mot loai xe
	 * 
	 * @param typeCarID
	 * @param typeCar
	 */
	public void editType(String typeCarID, String typeCar) {
		String sql = " UPDATE [TypeCar] SET TypeCar = ? WHERE TypeCarID = ? ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, typeCar);
			restmt.setString(2, typeCarID);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Kiem tra ten loai da ton tai hay khong: ton tai=true, khong ton tai=false
	 * 
	 * @param typeCar
	 * @return
	 */
	public boolean checkTypeName(String typeCar) {
		String sql = " SELECT * FROM [TypeCar] WHERE TypeCar = ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, typeCar);
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
