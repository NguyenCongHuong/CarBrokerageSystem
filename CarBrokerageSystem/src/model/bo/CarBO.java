package model.bo;

import java.util.ArrayList;

import model.bean.Car;
import model.dao.CarDAO;

public class CarBO {

	CarDAO carDAO = new CarDAO();

	public ArrayList<Car> getListCar(String producerID) {
		return carDAO.getListCar(producerID);
	}

	public ArrayList<Car> getListCarHighlight() {
		return carDAO.getListCarHighlight();
	}

	public ArrayList<Car> getListFengShuiCar(int fireElement, String styleCarID, String typeCarID) {
		return carDAO.getListFengShuiCar(fireElement, styleCarID, typeCarID);
	}

	public ArrayList<Car> getListCarByType(String typeCarID) {
		return carDAO.getListCarByType(typeCarID);
	}

	public Car getCarDetail(String carID) {
		return carDAO.getCarDetail(carID);
	}

	public ArrayList<Car> getListCarPriceOrSeatSreach(String price) {
		return carDAO.getListCarPriceOrSeatSreach(price);
	}

	public ArrayList<Car> getListProducerSearch(String producer) {
		return carDAO.getListProducerSearch(producer);
	}

	public ArrayList<Car> getListCarSearch(String carName) {
		return carDAO.getListCarSearch(carName);
	}

	public ArrayList<Car> getListCar() {
		return carDAO.getListCar();
	}

	public void addCar(String carName, String price, String warranty, String producerID, String styleCarID,
			String typeCarID, String size, String wheelbase, String weight, String maxWeight, String engineType,
			String torque, String enginePower, String topSpeed, String fuelTankCapacity, String fuel,
			String fuelConsumption, String emissionStandard, String gear, String frontBrake, String rearBrake,
			String frontFoglamp, String rearFoglamp, String rearviewMirrorOutside, String winscreenWiper,
			String antenna, String doorHandle, String airConditioner, String rearviewMirrorInside, String sunroof,
			String seatType, String seat, String sunshade, String cupHolder, String speakerType, String dics,
			String numberSpeaker, String usb, String bluetooth, String electronicStabilityControl, String brakelight,
			String childSafetyLock, String seatBelt, String airbag) {
		carDAO.addCar(carName, price, warranty, producerID, styleCarID, typeCarID, size, wheelbase, weight, maxWeight,
				engineType, torque, enginePower, topSpeed, fuelTankCapacity, fuel, fuelConsumption, emissionStandard,
				gear, frontBrake, rearBrake, frontFoglamp, rearFoglamp, rearviewMirrorOutside, winscreenWiper, antenna,
				doorHandle, airConditioner, rearviewMirrorInside, sunroof, seatType, seat, sunshade, cupHolder,
				speakerType, dics, numberSpeaker, usb, bluetooth, electronicStabilityControl, brakelight,
				childSafetyLock, seatBelt, airbag);
	}

	public String getCarID(String carName) {
		return carDAO.getCarID(carName);
	}

	public void deleteCar(String carID) {
		carDAO.deleteCar(carID);
	}

	public String getCarHighlight(String carID) {
		return carDAO.getCarHighlight(carID);
	}

	public String getTypeHighlight(String carID) {
		return carDAO.getTypeHighlight(carID);
	}

	public void editCarHighlight(String carID) {
		carDAO.editCarHighlight(carID);
	}

	public void editTypeHighlight(String carID) {
		carDAO.editTypeHighlight(carID);
	}

	public boolean checkFollowCar(String userName, String carID) {
		return carDAO.checkFollowCar(userName, carID);
	}

	public void deleteFollowCar(String carID, String userName) {
		carDAO.deleteFollowCar(carID, userName);
	}

	public void addFollowCar(String carID, String userName) {
		carDAO.addFollowCar(carID, userName);
	}
}
