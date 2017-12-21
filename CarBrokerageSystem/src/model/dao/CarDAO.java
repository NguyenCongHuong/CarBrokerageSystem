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
		String sql = " SELECT DISTINCT c.CarID, c.CarName, p.ProducerID ,p.ProducerName, CarImage = (select top 1 CarImage from [FiveElement] where CarID = c.CarID), c.Price, c.CarHighlight, c.TypeHighlight "
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
				car.setProducerID(rs.getString("ProducerID"));
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
//				System.out.println("sql: " + sql);
				restmt = connection.prepareStatement(sql);
			} else if ("0".equals(styleCarID) == true && "0".equals(typeCarID) == false) {
				sql += " and c.TypeCarID = ? " + sqlOrderBy;
//				System.out.println("sql: " + sql);
				restmt = connection.prepareStatement(sql);
				restmt.setString(1, typeCarID);
			} else if ("0".equals(styleCarID) == false && "0".equals(typeCarID) == true) {
				sql += " and c.StyleCarID = ? " + sqlOrderBy;
//				System.out.println("sql: " + sql);
				restmt = connection.prepareStatement(sql);
				restmt.setString(1, styleCarID);
			} else {
				sql += " and c.StyleCarID = ? and c.TypeCarID = ? " + sqlOrderBy;
//				System.out.println("sql: " + sql);
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

	/**
	 * Ham them du lieu mot xe vap bang Car va tra ve gia tri carID moi duoc them
	 * 
	 * @param carName
	 * @param price
	 * @param warranty
	 * @param producerID
	 * @param styleCarID
	 * @param typeCarID
	 * @param carHighlight
	 * @param typeHighlight
	 * @param size
	 * @param wheelbase
	 * @param weight
	 * @param maxWeight
	 * @param engineType
	 * @param torque
	 * @param enginePower
	 * @param topSpeed
	 * @param fuelTankCapacity
	 * @param fuel
	 * @param fuelConsumption
	 * @param emissionStandard
	 * @param gear
	 * @param frontBrake
	 * @param rearBrake
	 * @param frontFoglamp
	 * @param rearFoglamp
	 * @param rearviewMirrorOutside
	 * @param winscreenWiper
	 * @param antenna
	 * @param doorHandle
	 * @param airConditioner
	 * @param rearviewMirrorInside
	 * @param sunroof
	 * @param seatType
	 * @param seat
	 * @param sunshade
	 * @param cupHolder
	 * @param speakerType
	 * @param dics
	 * @param numberSpeaker
	 * @param usb
	 * @param bluetooth
	 * @param electronicStabilityControl
	 * @param brakelight
	 * @param childSafetyLock
	 * @param seatBelt
	 * @param airbag
	 * @return
	 */
	public void addCar(String carName, String price, String warranty, String producerID, String styleCarID,
			String typeCarID, String size, String wheelbase, String weight, String maxWeight, String engineType,
			String torque, String enginePower, String topSpeed, String fuelTankCapacity, String fuel,
			String fuelConsumption, String emissionStandard, String gear, String frontBrake, String rearBrake,
			String frontFoglamp, String rearFoglamp, String rearviewMirrorOutside, String winscreenWiper,
			String antenna, String doorHandle, String airConditioner, String rearviewMirrorInside, String sunroof,
			String seatType, String seat, String sunshade, String cupHolder, String speakerType, String dics,
			String numberSpeaker, String usb, String bluetooth, String electronicStabilityControl, String brakelight,
			String childSafetyLock, String seatBelt, String airbag) {
		String sql = " INSERT INTO [Car]( "
				+ " CarName, Price, Warranty, ProducerID, StyleCarID, TypeCarID, CarHighlight, TypeHighlight, "
				+ " Size, Wheelbase, Weight, MaxWeight, EngineType, Torque, EnginePower, TopSpeed, FuelTankCapacity, Fuel, "
				+ " FuelConsumption, EmissionStandard, Gear, FrontBrake, RearBrake, FrontFoglamp, RearFoglamp, RearviewMirrorOutside, WinscreenWiper, "
				+ " Antenna, DoorHandle, AirConditioner, RearviewMirrorInside, Sunroof, SeatType, Seat, Sunshade, CupHolder, SpeakerType, "
				+ " Dics, NumberSpeaker, Usb, Bluetooth, ElectronicStabilityControl, Brakelight, ChildSafetyLock, SeatBelt, Airbag) "
				+ " VALUES (?, ?, ?, ?, ?, ? ,0 ,0 ,? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, carName);
			restmt.setString(2, price);
			restmt.setString(3, warranty);
			restmt.setString(4, producerID);
			restmt.setString(5, styleCarID);
			restmt.setString(6, typeCarID);
			restmt.setString(7, size);
			restmt.setString(8, wheelbase);
			restmt.setString(9, weight);
			restmt.setString(10, maxWeight);
			restmt.setString(11, engineType);
			restmt.setString(12, torque);
			restmt.setString(13, enginePower);
			restmt.setString(14, topSpeed);
			restmt.setString(15, fuelTankCapacity);
			restmt.setString(16, fuel);
			restmt.setString(17, fuelConsumption);
			restmt.setString(18, emissionStandard);
			restmt.setString(19, gear);
			restmt.setString(20, frontBrake);
			restmt.setString(21, rearBrake);
			restmt.setString(22, frontFoglamp);
			restmt.setString(23, rearFoglamp);
			restmt.setString(24, rearviewMirrorOutside);
			restmt.setString(25, winscreenWiper);
			restmt.setString(26, antenna);
			restmt.setString(27, doorHandle);
			restmt.setString(28, airConditioner);
			restmt.setString(29, rearviewMirrorInside);
			restmt.setString(30, sunroof);
			restmt.setString(31, seatType);
			restmt.setString(32, seat);
			restmt.setString(33, sunshade);
			restmt.setString(34, cupHolder);
			restmt.setString(35, speakerType);
			restmt.setString(36, dics);
			restmt.setString(37, numberSpeaker);
			restmt.setString(38, usb);
			restmt.setString(39, bluetooth);
			restmt.setString(40, electronicStabilityControl);
			restmt.setString(41, brakelight);
			restmt.setString(42, childSafetyLock);
			restmt.setString(43, seatBelt);
			restmt.setString(44, airbag);
			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getCarID(String carName) {
		String sql = " SELECT CarID FROM [Car] WHERE CarName = ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, carName);
			rs = restmt.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String id = "";
		try {
			while (rs.next()) {
				id = rs.getString("CarID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	public void deleteCar(String carID) {
		String sql = "DELETE FROM [Car] WHERE CarID = ?";
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, carID);
			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getCarHighlight(String carID) {
		String sql = " SELECT CarHighlight FROM [Car] WHERE CarID = ? ";
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
		String carHighlight = "";
		try {
			while (rs.next()) {
				carHighlight = rs.getString("CarHighlight");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return carHighlight;
	}

	public String getTypeHighlight(String carID) {
		String sql = " SELECT TypeHighlight FROM [Car] WHERE CarID = ? ";
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
		String typeHighlight = "";
		try {
			while (rs.next()) {
				typeHighlight = rs.getString("TypeHighlight");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return typeHighlight;
	}

	public void editCarHighlight(String carID) {
		String sql = " UPDATE [Car] SET CarHighlight = ";

		if ("1".equals(getCarHighlight(carID))) {
			sql += " 0 WHERE CarID = ? ";
		} else
			sql += " 1 WHERE CarID = ? ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, carID);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editTypeHighlight(String carID) {
		String sql = " UPDATE [Car] SET TypeHighlight = ";

		if ("1".equals(getTypeHighlight(carID))) {
			sql += " 0 WHERE CarID = ? ";
		} else
			sql += " 1 WHERE CarID = ? ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, carID);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean checkFollowCar(String userName, String carID) {
		String sqlCheckLogin = "SELECT UserName FROM [FollowCar] WHERE UserName = ? and CarID = ? ";
		ResultSet rs = null;
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sqlCheckLogin);
			restmt.setString(1, userName);
			restmt.setString(2, carID);
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

	public void deleteFollowCar(String carID, String userName) {
		String sql = "DELETE FROM [FollowCar] WHERE CarID = ? and UserName = ? ";
		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);
			restmt.setString(1, carID);
			restmt.setString(2, userName);
			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addFollowCar(String carID, String userName) {
		String sql = " INSERT INTO [FollowCar](UserName, CarID) VALUES (?,?) ";

		try {
			Connection connection = getMyConnection();
			PreparedStatement restmt = connection.prepareStatement(sql);

			restmt.setString(1, userName);
			restmt.setString(2, carID);

			restmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
