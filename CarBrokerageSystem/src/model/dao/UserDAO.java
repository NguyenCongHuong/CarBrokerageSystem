package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.User;

public class UserDAO extends BaseDAO {
	
	/**
	 * Ham kiem tra dang nhap
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	public boolean checkLogin(String userName, String password) {
		String sqlCheckLogin = "SELECT UserName FROM [User] WHERE UserName = ? AND Password = ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection
					.prepareStatement(sqlCheckLogin);
			restmt.setString(1, userName);
			restmt.setString(2, password);
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
	
	/**
	 * Ham tra ve toan bo thong tin cua user
	 * 
	 * @param userName
	 * @return
	 */
	public User getUser(String userName) {
		String sql = "SELECT FullName, Type, Email, Password, PhoneNumber, Address "
				+ " FROM [User] WHERE UserName = ? ";
		ResultSet rs = null;

		// Ket noi va truy van database
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, userName);
			rs = restmt.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		User user = new User();

		try {
			if (rs.next()) {
				user.setUserName(userName);
				user.setFullName(rs.getString("FullName"));
				user.setEmail(rs.getString("Email"));
				user.setType(rs.getString("Type"));
				user.setPassword(rs.getString("Password"));
				user.setPhoneNumber(rs.getString("PhoneNumber"));
				user.setAddress(rs.getString("Address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
	
	public void addUser(String userName, String fullName, String password, String phoneNumber, String email) {
		String sql = " INSERT INTO [User](UserName, Password, Type, FullName, Email, PhoneNumber) "
				+ " VALUES (?, ?, 1, ?, ?, ?) ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, userName);
			restmt.setString(2, password);
			restmt.setString(3, fullName);
			restmt.setString(4, email);
			restmt.setString(5, phoneNumber);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkUserName(String userName) {
		String sqlCheckLogin = "SELECT UserName FROM [User] WHERE UserName = ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection
					.prepareStatement(sqlCheckLogin);
			restmt.setString(1, userName);
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
	
	public void editUser(String userName, String fullName, String phoneNumber, String email, String address) {
		String sql = " UPDATE [User] SET FullName = ?, PhoneNumber = ?, Email = ?, Address = ? "
				+ " WHERE UserName = ? ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, fullName);
			restmt.setString(2, phoneNumber);
			restmt.setString(3, email);
			restmt.setString(4, address);
			restmt.setString(5, userName);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<User> getListUser() {
		String sql = " SELECT * FROM [User] WHERE type = '1' ";
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

		ArrayList<User> list = new ArrayList<User>();
		User user;
		try {
			while (rs.next()) {
				user = new User();
				user.setFullName(rs.getString("FullName"));
				user.setPhoneNumber(rs.getString("PhoneNumber"));
				user.setUserName(rs.getString("UserName"));
				user.setEmail(rs.getString("Email"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
