package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.Utils;
import model.bean.Order;

public class OrderDAO extends BaseDAO {

	/**
	 * Tra ve danh sach toan bo don dat hang
	 * 
	 * @return
	 */
	public ArrayList<Order> getListOrder() {
		String sql = " SELECT o.OrderID, o.CarID, c.CarName, o.PhoneNumber, o.Email, "
				+ " o.Address, o.OrderDate, o.Seen, o.Contacted, o.Orderer, o.UserName " + " FROM [Order] o "
				+ " INNER JOIN [Car] as c on o.CarID = c.CarID " + " ORDER BY o.Seen desc, o.Orderer, c.CarName";
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

		ArrayList<Order> list = new ArrayList<Order>();
		Order order;
		try {
			while (rs.next()) {
				order = new Order();
				order.setOrderID(rs.getString("OrderID"));
				order.setOrderer(rs.getString("Orderer"));
				order.setCarID(rs.getString("CarID"));
				order.setCarName(rs.getString("CarName"));
				order.setPhoneNumber(rs.getString("PhoneNumber"));
				order.setEmail(rs.getString("Email"));
				order.setAddress(Utils.convertNullString(rs.getString("Address")));
				order.setOrderDate(Utils.formatDateTime(rs.getString("OrderDate")));
				order.setSeen(rs.getString("Seen"));
				order.setContacted(rs.getString("Contacted"));
				order.setUserName(rs.getString("UserName"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Ham xoa mot don hang da dat
	 * 
	 * @param orderID
	 */
	public void deleteOrder(String orderID) {
		String sql = "DELETE FROM [Order] WHERE OrderID = ?";
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, orderID);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addOrder(String orderer, String email, String phoneNumber, String address, String orderDate,
			String carID, String userName) {
		String sql = " INSERT INTO [Order](Orderer, Email, PhoneNumber, Address, OrderDate, CarID, Seen, Contacted, UserName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, orderer);
			restmt.setString(2, email);
			restmt.setString(3, phoneNumber);
			restmt.setString(4, address);
			restmt.setString(5, orderDate);
			restmt.setString(6, carID);
			restmt.setString(7, "0");
			restmt.setString(8, "0");
			restmt.setString(9, userName);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String numberNewOrder() {
		String sql = " SELECT [count] = COUNT(*) FROM [Order] WHERE Seen = 1 ";
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
		String count = "";
		try {
			while (rs.next()) {
				count = rs.getString("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public ArrayList<Order> getListNumberNewOrder() {
		String sql = " SELECT c.CarName, o.Orderer " + " FROM [Order] o "
				+ " INNER JOIN [Car] as c on o.CarID = c.CarID " + " WHERE o.Seen = 1 " + " ORDER BY o.Orderer ";
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

		ArrayList<Order> list = new ArrayList<Order>();
		Order order;
		try {
			while (rs.next()) {
				order = new Order();
				order.setOrderer(rs.getString("Orderer"));
				order.setCarName(rs.getString("CarName"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void editSeen(String orderID) {
		String sql = " UPDATE [Order] SET Seen = 0 WHERE OrderID = ? ";
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, orderID);
			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
