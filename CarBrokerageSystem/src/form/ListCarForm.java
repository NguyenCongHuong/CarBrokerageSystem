package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Car;
import model.bean.Producer;

public class ListCarForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private ArrayList<Producer> listProducer;
	private ArrayList<Car> listCar;
	private String producerID;
	private String producerName;

	public String getProducerName() {
		return producerName;
	}

	public void setProducerName(String producerName) {
		this.producerName = producerName;
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

}
