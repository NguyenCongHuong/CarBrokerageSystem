package model.bean;

import java.util.ArrayList;

public class TypeCar {

	private String typeCarID;
	private String typeCar;
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

	public String getTypeCarID() {
		return typeCarID;
	}

	public void setTypeCarID(String typeCarID) {
		this.typeCarID = typeCarID;
	}

	public String getTypeCar() {
		return typeCar;
	}

	public void setTypeCar(String typeCar) {
		this.typeCar = typeCar;
	}

}
