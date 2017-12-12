package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.Constants;
import common.Utils;
import model.bean.Car;
import model.bo.FiveElementBO;

public class CarDAO extends BaseDAO {

	FiveElementBO fiveElementBO = new FiveElementBO();

	/**
	 * Tra ve danh sach cac xe trong mot hang xe
	 * 
	 * @return
	 */
	public ArrayList<Car> getListCar(String producerID) {
		String sql = " SELECT DISTINCT c.CarID, c.CarName, p.ProducerName, CarImage = (select top 1 CarImage from [FiveElement] where CarID = c.CarID), c.Price, c.CarHighlight, c.TypeHighlight "
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
				car.setPrice(Utils.formatCurrency(rs.getString("Price")));
				car.setMoney(Constants.CURRENCY);
				car.setCarHighlight(rs.getString("CarHighlight"));
				car.setTypeHighlight(rs.getString("TypeHighlight"));
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
		String sql = " SELECT DISTINCT c.CarID, c.CarName, c.Price, CarImage = (select top 1 CarImage from [FiveElement] where CarID = c.CarID) "
				+ " FROM [Car] c " + " INNER JOIN [FiveElement] as f on c.CarID = f.CarID "
				+ " WHERE c.CarHighlight = 1  " + " ORDER BY c.CarName ";
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
				car.setPrice(Utils.formatCurrency(rs.getString("Price")));
				car.setMoney(Constants.CURRENCY);
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

		String sql = " SELECT DISTINCT c.CarID, c.CarName, c.CarHighlight, c.Price, CarImage = (select top 1 CarImage from [FiveElement] where CarID = c.CarID) "
				+ " FROM [Car] c " + " INNER JOIN [FiveElement] as f on c.CarID = f.CarID "
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
				System.out.println("sql: " + sql);
				restmt = connection.prepareStatement(sql);
			} else if ("0".equals(styleCarID) == true && "0".equals(typeCarID) == false) {
				sql += " and c.TypeCarID = ? " + sqlOrderBy;
				System.out.println("sql: " + sql);
				restmt = connection.prepareStatement(sql);
				restmt.setString(1, typeCarID);
			} else if ("0".equals(styleCarID) == false && "0".equals(typeCarID) == true) {
				sql += " and c.StyleCarID = ? " + sqlOrderBy;
				System.out.println("sql: " + sql);
				restmt = connection.prepareStatement(sql);
				restmt.setString(1, styleCarID);
			} else {
				sql += " and c.StyleCarID = ? and c.TypeCarID = ? " + sqlOrderBy;
				System.out.println("sql: " + sql);
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
					car.setPrice(Utils.formatCurrency(rs.getString("Price")));
					car.setMoney(Constants.CURRENCY);
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

	/**
	 * Ham tra ve tat ca xe noi trong tung loai xe
	 * 
	 * @param styleCarID
	 * @return
	 */
	public ArrayList<Car> getListCarByType(String typeCarID) {
		String sql = " SELECT DISTINCT c.CarID, c.CarName, c.Price, CarImage = (select top 1 CarImage from [FiveElement] where CarID = c.CarID) "
				+ " FROM [Car] c " + " INNER JOIN [TypeCar] as t on c.TypeCarID = t.TypeCarID"
				+ " INNER JOIN [FiveElement] as f on c.CarID = f.CarID"
				+ " WHERE t.TypeCarID = ? and c.TypeHighlight = 1 " + " ORDER BY c.CarName ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, typeCarID);
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
				car.setPrice(Utils.formatCurrency(rs.getString("Price")));
				car.setMoney(Constants.CURRENCY);
				car.setCarImage(Constants.LINK_SHOW_IMG + "" + rs.getString("CarImage"));
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Ham tra ve thong tin cua mot xe
	 * 
	 * @param carID
	 * @return
	 */
	public Car getCarDetail(String carID) {
		String sql = " SELECT DISTINCT c.CarID, c.CarName, c.Price, CarImage = (select top 1 CarImage from [FiveElement] where CarID = c.CarID), "
				+ " c.Warranty, p.ProducerID, p.ProducerName , st.StyleCar, t.TypeCar, "
				+ " c.Size, c.Wheelbase, c.[Weight], c.MaxWeight, c.EngineType, c.Torque, c.EnginePower, c.TopSpeed, c.FuelTankCapacity, c.Fuel, "
				+ " c.FuelConsumption, c.EmissionStandard, c.Gear, c.FrontBrake, c.RearBrake, c.FrontFoglamp, c.RearFoglamp, c.RearviewMirrorOutside, c.WinscreenWiper, "
				+ " c.Antenna, c.DoorHandle, c.AirConditioner, c.RearviewMirrorInside, c.Sunroof, c.SeatType, c.Seat, c.Sunshade, c.CupHolder, c.SpeakerType, "
				+ " c.Dics, c.NumberSpeaker, c.Usb, c.Bluetooth, c.ElectronicStabilityControl, c.Brakelight, c.ChildSafetyLock, c.SeatBelt, c.Airbag "
				+ " FROM [Car] c " + " INNER JOIN [Producer] as p on c.ProducerID = p.ProducerID "
				+ " INNER JOIN [StyleCar] as st on c.StyleCarID = st.StyleCarID "
				+ " INNER JOIN [TypeCar] as t on c.TypeCarID = t.TypeCarID "
				+ " INNER JOIN [FiveElement] as f on c.CarID = f.CarID " + " WHERE c.CarID = ? ";
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

		Car car = null;
		try {
			while (rs.next()) {
				car = new Car();
				car.setCarID(rs.getString("CarID"));
				car.setCarName(rs.getString("CarName"));
				car.setPrice(Utils.formatCurrency(rs.getString("Price")) + " " + Constants.CURRENCY);
				car.setMoney(Constants.CURRENCY);
				car.setCarImage(Constants.LINK_SHOW_IMG + "" + rs.getString("CarImage"));
				car.setWarranty(rs.getString("Warranty"));
				car.setProducerID(rs.getString("ProducerID"));
				car.setProducerName(rs.getString("ProducerName"));
				car.setStyleCar(rs.getString("StyleCar"));
				car.setTypeCar(rs.getString("TypeCar"));
				car.setSize(rs.getString("Size"));
				car.setWheelbase(rs.getString("Wheelbase"));
				car.setWeight(rs.getString("Weight"));
				car.setMaxWeight(rs.getString("MaxWeight"));
				car.setEngineType(rs.getString("EngineType"));
				car.setTorque(rs.getString("Torque"));
				car.setEnginePower(rs.getString("EnginePower"));
				car.setTopSpeed(rs.getString("TopSpeed"));
				car.setFuelTankCapacity(rs.getString("FuelTankCapacity"));
				car.setFuel(rs.getString("Fuel"));
				car.setFuelConsumption(rs.getString("FuelConsumption"));
				car.setEmissionStandard(rs.getString("EmissionStandard"));
				car.setGear(rs.getString("Gear"));
				car.setFrontBrake(rs.getString("FrontBrake"));
				car.setRearBrake(rs.getString("RearBrake"));
				car.setFrontFoglamp(rs.getString("FrontFoglamp"));
				car.setRearFoglamp(rs.getString("RearFoglamp"));
				car.setRearviewMirrorOutside(rs.getString("RearviewMirrorOutside"));
				car.setWinscreenWiper(rs.getString("WinscreenWiper"));
				car.setAntenna(rs.getString("Antenna"));
				car.setDoorHandle(rs.getString("DoorHandle"));
				car.setAirConditioner(rs.getString("AirConditioner"));
				car.setRearviewMirrorInside(rs.getString("RearviewMirrorInside"));
				car.setSunroof(rs.getString("Sunroof"));
				car.setSeatType(rs.getString("SeatType"));
				car.setSeat(rs.getString("Seat"));
				car.setSunshade(rs.getString("Sunshade"));
				car.setCupHolder(rs.getString("CupHolder"));
				car.setSpeakerType(rs.getString("SpeakerType"));
				car.setDics(rs.getString("Dics"));
				car.setNumberSpeaker(rs.getString("NumberSpeaker"));
				car.setUsb(rs.getString("Usb"));
				car.setBluetooth(rs.getString("Bluetooth"));
				car.setElectronicStabilityControl(rs.getString("ElectronicStabilityControl"));
				car.setBrakelight(rs.getString("Brakelight"));
				car.setChildSafetyLock(rs.getString("ChildSafetyLock"));
				car.setSeatBelt(rs.getString("SeatBelt"));
				car.setAirbag(rs.getString("Airbag"));
				car.setListColor(fiveElementBO.getListColor(carID));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return car;
	}

	public ArrayList<Car> getListCarPriceOrSeatSreach(String price) {
		String sql = " exec search ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, price);
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
				car.setCarImage(Constants.LINK_SHOW_IMG + "" + rs.getString("CarImage"));
				car.setPrice(Utils.formatCurrency(rs.getString("Price")));
				car.setMoney(Constants.CURRENCY);
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Car> getListProducerSearch(String producer) {
		String sql = " SELECT DISTINCT c.CarID, c.CarName, c.Price, CarImage = (select top 1 CarImage from [FiveElement] where CarID = c.CarID), p.ProducerName "
				+ " FROM [Car] c " + " INNER JOIN [Producer] as p on p.ProducerID = c.ProducerID "
				+ " WHERE p.ProducerName like '%" + producer + "%' ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
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
				car.setCarImage(Constants.LINK_SHOW_IMG + "" + rs.getString("CarImage"));
				car.setPrice(Utils.formatCurrency(rs.getString("Price")));
				car.setMoney(Constants.CURRENCY);
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Car> getListCarSearch(String carName) {
		String sql = " SELECT CarID, CarName, Price, CarImage = (select top 1 CarImage from [FiveElement] where CarID = CarID) FROM [Car] WHERE CarName like '%"
				+ carName + "%' ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
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
				car.setCarImage(Constants.LINK_SHOW_IMG + "" + rs.getString("CarImage"));
				car.setPrice(Utils.formatCurrency(rs.getString("Price")));
				car.setMoney(Constants.CURRENCY);
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("aaaaa");
		return list;
	}

	/**
	 * Ham tra ve danh sach toan bo xe
	 * 
	 * @return
	 */
	public ArrayList<Car> getListCar() {
		String sql = " SELECT c.CarID, c.CarName, p.ProducerName, p.ProducerID " + " FROM [Car] c "
				+ " INNER JOIN [Producer] as p on p.ProducerID = c.ProducerID " + " ORDER BY p.ProducerID, c.CarName ";
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
				car.setProducerName(rs.getString("ProducerName"));
				car.setProducerID(rs.getString("ProducerID"));
				car.setId(rs.getString("ProducerID") + "_" + rs.getString("CarID"));
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
