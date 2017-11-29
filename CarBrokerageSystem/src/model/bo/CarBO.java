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
}
