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
	 * ham tra ve danh sach xe theo ngu hanh, phong cach xe, loai xe
	 * 
	 * @param fireElement
	 * @return
	 */
	public ArrayList<Car> getListFengShuiCar(int fireElement, String styleCarID, String typeCarID) {

		String sql = " SELECT c.CarID, c.CarName, c.Price, f.CarImage " + " FROM [Car] c "
				+ " INNER JOIN [FiveElement] as f on c.CarID = f.CarID "
				+ " INNER JOIN [StyleCar] as s on c.StyleCarID = s.StyleCarID "
				+ " INNER JOIN [TypeCar] as t on c.TypeCarID = t.TypeCarID " + " WHERE f."
				+ Constants.FIVE_ELEMENTS_EN[fireElement] + " = 1";
		String sqlOrderBy = " ORDER BY c.CarHighlight desc, c.CarName ";

		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = null;

			if ("0".equals(styleCarID) == true && "0".equals(typeCarID) == true) {
				sql += sqlOrderBy;
				System.out.println(sql);
				restmt = connection.prepareStatement(sql);
			} else if ("0".equals(styleCarID) == true && "0".equals(typeCarID) == false) {
				sql += " and c.TypeCarID = ? " + sqlOrderBy;
				System.out.println(sql);
				restmt = connection.prepareStatement(sql);
				restmt.setString(1, typeCarID);
			} else if ("0".equals(styleCarID) == false && "0".equals(typeCarID) == true) {
				sql += " and c.StyleCarID = ? " + sqlOrderBy;
				System.out.println(sql);
				restmt = connection.prepareStatement(sql);
				restmt.setString(1, styleCarID);
			} else {
				sql += " and c.StyleCarID = ? and c.TypeCarID = ? " +sqlOrderBy;
				System.out.println(sql);
				restmt = connection.prepareStatement(sql);
				restmt.setString(1, styleCarID);
				restmt.setString(2, typeCarID);
			}

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
