package model.bo;

import java.util.ArrayList;

import model.bean.Car;
import model.dao.CarDAO;

public class CarBO {

	CarDAO carDAO = new CarDAO();

	public ArrayList<Car> getListCar(String producerID) {
		return carDAO.getListCar(producerID);
	}
}
