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
		String sql = " SELECT c.CarID, c.CarName, p.ProducerName, f.CarImage, c.Price, c.CarHighlight, c.StyleHighlight "
				+ " FROM [Car] c " + " INNER JOIN [Producer] as p on p.ProducerID = c.ProducerID "
				+ " INNER JOIN [FiveElement] as f on c.CarID = f.CarID " + " WHERE c.ProducerID = ? "
				+ " ORDER BY c.CarName ";
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
				car.setCarImage(Constants.LINK_SHOW_IMG + "" + rs.getString("CarImage"));
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Ham tra ve danh sach xe noi bat
	 * 
	 * @return
	 */
	public ArrayList<Car> getListCarHighlight() {
		String sql = " SELECT c.CarID, c.CarName, c.Price, f.CarImage " + " FROM [Car] c "
				+ " INNER JOIN [FiveElement] as f on c.CarID = f.CarID " + " WHERE c.CarHighlight = 1  "
				+ " ORDER BY c.CarName ";
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

		ArrayList<Car> list = new ArrayList<Car>();
		Car car;
		try {
			while (rs.next()) {
				car = new Car();
				car.setCarID(rs.getString("CarID"));
				car.setCarName(rs.getString("CarName"));
				car.setPrice(Utils.formatCurrency(rs.getString("Price")) + " " + Constants.CURRENCY);
				car.setCarImage(Constants.LINK_SHOW_IMG + "" + rs.getString("CarImage"));
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * ham tra ve danh sach xe theo ngu hanh
	 * 
	 * @param fireElement
	 * @return
	 */
	public ArrayList<Car> getListFengShuiCar(int fireElement) {

		String sql = " SELECT c.CarID, c.CarName, c.Price, f.CarImage " + " FROM [Car] c "
				+ " INNER JOIN [FiveElement] as f on c.CarID = f.CarID ";
		if (fireElement == 0) {
			sql += " WHERE f.Metal = 1 ORDER BY c.CarName ";
		} else if (fireElement == 1) {
			sql += " WHERE f.Water = 1 ORDER BY c.CarName ";
		} else if (fireElement == 2) {
			sql += " WHERE f.Fire = 1 ORDER BY c.CarName ";
		} else if (fireElement == 3) {
			sql += " WHERE f.Earth = 1 ORDER BY c.CarName ";
		} else
			sql += " WHERE f.Wood = 1 ORDER BY c.CarName ";
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

		ArrayList<Car> list = new ArrayList<Car>();
		Car car;
		int count = 0;
		try {
			while (rs.next()) {
				if (count < 6) {
					car = new Car();
					car.setCarID(rs.getString("CarID"));
					car.setCarName(rs.getString("CarName"));
					car.setPrice(Utils.formatCurrency(rs.getString("Price")) + " " + Constants.CURRENCY);
					car.setCarImage(Constants.LINK_SHOW_IMG + "" + rs.getString("CarImage"));
					list.add(car);
					count += 1;
				} else
					break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
