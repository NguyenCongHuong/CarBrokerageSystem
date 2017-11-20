package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.Constants;
import common.Utils;
import model.bean.Car;

public class CarDAO extends BaseDAO {

	/**
	 * Tra ve danh sach cac xe trong mot hang xe
	 * 
	 * @return
	 */
	public ArrayList<Car> getListCar(String producerID) {
		String sql = " SELECT c.CarID, c.CarName, p.ProducerName, c.Price, c.CarHighlight, c.StyleHighlight "
				+ " FROM [Car] c " + " INNER JOIN [Producer] as p on p.ProducerID = c.ProducerID"
				+ " WHERE c.ProducerID = ? " + " ORDER BY c.CarName ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, producerID);
			rs = restmt.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ArrayList<Car> list = new ArrayList<Car>();
		Car car;
		try {
			while (rs.next()) {
				car = new Car();
				car.setCarID(rs.getString("CarID"));
				car.setCarName(rs.getString("CarName"));
				car.setProducerName(rs.getString("ProducerName"));
				car.setPrice(Utils.formatCurrency(rs.getString("Price")) + " " + Constants.CURRENCY);
				car.setCarHighlight(rs.getString("CarHighlight"));
				car.setStyleHighlight(rs.getString("StyleHighlight"));
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
