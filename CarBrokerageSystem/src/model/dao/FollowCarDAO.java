package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.Constants;
import common.Utils;
import model.bean.FollowCar;


public class FollowCarDAO extends BaseDAO{
	
	public ArrayList<FollowCar> getListFollowCar() {
		String sql = " SELECT c.CarID, c.CarName, p.ProducerName, c.Price FROM [FollowCar] f "
				+ " INNER JOIN [Car] as c on f.CarID = c.CarID "
				+ " INNER JOIN [Producer] as p on p.ProducerID = c.ProducerID ";
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

		ArrayList<FollowCar> list = new ArrayList<FollowCar>();
		FollowCar followCar;
		try {
			while (rs.next()) {
				followCar = new FollowCar();
				followCar.setCarID(rs.getString("CarID"));
				followCar.setCarName(rs.getString("CarName"));
				followCar.setProducerName(rs.getString("ProducerName"));
				followCar.setPrice(Utils.formatCurrency(rs.getString("Price")) + " " + Constants.CURRENCY);
				list.add(followCar);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
