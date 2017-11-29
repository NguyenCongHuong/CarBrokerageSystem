package model.bean;

import java.util.ArrayList;

public class StyleCar {
	private String styleCarID;
	private String styleCar;
	private String active;
	private ArrayList<Car> listCar;

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public ArrayList<Car> getListCar() {
		return listCar;
	}

	public void setListCar(ArrayList<Car> listCar) {
		this.listCar = listCar;
	}

	public String getStyleCarID() {
		return styleCarID;
	}

	public void setStyleCarID(String styleCarID) {
		this.styleCarID = styleCarID;
	}

	public String getStyleCar() {
		return styleCar;
	}

	public void setStyleCar(String styleCar) {
		this.styleCar = styleCar;
	}

}
