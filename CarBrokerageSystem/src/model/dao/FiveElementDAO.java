package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.FiveElement;

public class FiveElementDAO extends BaseDAO {

	public ArrayList<FiveElement> getListColor(String carID) {
		String sql = " SELECT Color" + " FROM [FiveElement] " + " WHERE CarID = ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, carID);
			rs = restmt.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ArrayList<FiveElement> list = new ArrayList<FiveElement>();
		FiveElement fiveElement;
		try {
			while (rs.next()) {
				fiveElement = new FiveElement();
				fiveElement.setColor(rs.getString("Color"));
				list.add(fiveElement);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Ham them thong tin phogn thuy cua xe
	 * 
	 * @param carID
	 * @param metal
	 * @param water
	 * @param fire
	 * @param earth
	 * @param wood
	 */
	public void addFiveElement(String carID, String color, String carImage, String carBanner, String metal,
			String water, String fire, String earth, String wood) {
		String sql = " INSERT INTO [FiveElement](CarID, Color, CarImage, CarBanner, Metal, Water, Fire, Earth, Wood) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, carID);
			restmt.setString(2, color);
			restmt.setString(3, carImage);
			restmt.setString(4, carBanner);
			restmt.setString(5, metal);
			restmt.setString(6, water);
			restmt.setString(7, fire);
			restmt.setString(8, earth);
			restmt.setString(9, wood);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
