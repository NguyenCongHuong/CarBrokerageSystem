package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Car;
import model.bean.Producer;

public class CarForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String carID;
	private String carID2;
	private Car carDetail;
	private String userName;
	private String producerID;
	private String producerID2;
	private ArrayList<Producer> listProducer;
	private ArrayList<Car> listCar;
	private Car carDetail2;

	public Car getCarDetail2() {
		return carDetail2;
	}

	public void setCarDetail2(Car carDetail2) {
		this.carDetail2 = carDetail2;
	}

	public String getCarID2() {
		return carID2;
	}

	public void setCarID2(String carID2) {
		this.carID2 = carID2;
	}

	public String getProducerID2() {
		return producerID2;
	}

	public void setProducerID2(String producerID2) {
		this.producerID2 = producerID2;
	}

	public String getProducerID() {
		return producerID;
	}

	public void setProducerID(String producerID) {
		this.producerID = producerID;
	}

	public ArrayList<Producer> getListProducer() {
		return listProducer;
	}

	public void setListProducer(ArrayList<Producer> listProducer) {
		this.listProducer = listProducer;
	}

	public ArrayList<Car> getListCar() {
		return listCar;
	}

	public void setListCar(ArrayList<Car> listCar) {
		this.listCar = listCar;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Car getCarDetail() {
		return carDetail;
	}

	public void setCarDetail(Car carDetail) {
		this.carDetail = carDetail;
	}

	public String getCarID() {
		return carID;
	}

	public void setCarID(String carID) {
		this.carID = carID;
	}

}
