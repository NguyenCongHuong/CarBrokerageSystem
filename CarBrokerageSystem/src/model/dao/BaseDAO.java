package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import common.Constants;

public class BaseDAO {
	public static Connection getMyConnection() throws SQLException, ClassNotFoundException {
		Class.forName(Constants.LIBRARY_NAME);

		//Ket noi database bang jtds co ten dang nhap va mat khau
		Connection conn = DriverManager.getConnection(Constants.URL_CONNECTION, Constants.USERNAME, Constants.PASSWORD);
		
		//Ket noi database bang jdbc khong co ten dang nhap va mat khau
		// Connection conn =
		// DriverManager.getConnection(Constants.URL_CONNECTION);
		
		return conn;
	}

	public static void main(String[] args) throws SQLException, ClassNotFoundException {

		System.out.println("Get connection ... ");

		// Lấy ra đối tượng Connection kết nối vào database.
		Connection conn = getMyConnection();

		System.out.println("Get connection " + conn);

		System.out.println("Done!");
	}

}
