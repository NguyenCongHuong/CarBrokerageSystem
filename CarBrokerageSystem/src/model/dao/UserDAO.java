package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

}
