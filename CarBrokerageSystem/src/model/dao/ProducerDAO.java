package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Producer;

public class ProducerDAO extends BaseDAO {

	/**
	 * Ham tra ve danh sach cac hang xe va so luong xe trong hang
	 * 
	 * @return
	 */
	public ArrayList<Producer> getListProducer() {
		String sql = " SELECT p.ProducerID, p.ProducerName, count = COUNT(c.CarID) " + " FROM [Producer] p "
				+ " LEFT JOIN [Car] as c on c.ProducerID = p.ProducerID " + " GROUP BY p.ProducerID, p.ProducerName  "
				+ " ORDER BY p.ProducerName ";
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

		ArrayList<Producer> list = new ArrayList<Producer>();
		Producer producer;
		try {
			while (rs.next()) {
				producer = new Producer();
				producer.setProducerID(rs.getString("ProducerID"));
				producer.setProducerName(rs.getString("ProducerName"));
				producer.setNumberCar(rs.getString("count"));
				list.add(producer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Ham them ten mot hang xe
	 * 
	 * @param producerName
	 */
	public void addProducer(String producerName) {
		String sql = " INSERT INTO [Producer](ProducerName) VALUES (?) ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, producerName);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Kiem tra ten hang xe da ton tai hay khong: ton tai=true, khong ton tai=false
	 * 
	 * @param producerName
	 * @return
	 */
	public boolean checkProducerName(String producerName) {
		String sql = " SELECT * FROM [Producer] WHERE ProducerName = ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, producerName);
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
	 * Xoa mot hang xe oto
	 * 
	 * @param producerID
	 */
	public void deleteProducer(String producerID) {
		String sql = "DELETE FROM [Producer] WHERE ProducerID = ?";
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, producerID);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Ham sua ten mot hang san xuat oto
	 * 
	 * @param producerID
	 * @param producerName
	 */
	public void editProducer(String producerID, String producerName) {
		String sql = " UPDATE [Producer] SET ProducerName = ? WHERE ProducerID = ? ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, producerName);
			restmt.setString(2, producerID);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Ham tra ve ten cua hang xe theo id
	 * 
	 * @param producerID
	 * @return
	 */
	public String getProducerName(String producerID) {
		String sql = " SELECT ProducerName " + " FROM [Producer] " + " WHERE ProducerID = ? ";
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

		String producerName = "";
		try {
			while (rs.next()) {
				producerName = rs.getString("ProducerName");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return producerName;
	}

}
