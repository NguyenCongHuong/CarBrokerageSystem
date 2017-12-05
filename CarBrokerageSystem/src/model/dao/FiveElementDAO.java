package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.FiveElement;

public class FiveElementDAO extends BaseDAO{
	
	public ArrayList<FiveElement> getListColor(String carID) {
		String sql = " SELECT Color"
				+ " FROM [FiveElement] "
				+ " WHERE CarID = ? ";
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

}
