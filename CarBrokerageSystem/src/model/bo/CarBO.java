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

	public ArrayList<Car> getListCarByStyle(String styleCarID) {
		return carDAO.getListCarByStyle(styleCarID);
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
}
