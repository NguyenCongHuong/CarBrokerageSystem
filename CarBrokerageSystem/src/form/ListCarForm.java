package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Car;
import model.bean.Order;
import model.bean.Producer;

public class ListCarForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private ArrayList<Producer> listProducer;
	private ArrayList<Car> listCar;
	private String producerID;
	private String producerName;
	private String searchString;
	private String nofi;
	private ArrayList<Car> listCarSearch;
	private String numberNewOrder;
	private ArrayList<Order> listNumberNewOrder;

	public String getNumberNewOrder() {
		return numberNewOrder;
	}

	public void setNumberNewOrder(String numberNewOrder) {
		this.numberNewOrder = numberNewOrder;
	}

	public ArrayList<Order> getListNumberNewOrder() {
		return listNumberNewOrder;
	}

	public void setListNumberNewOrder(ArrayList<Order> listNumberNewOrder) {
		this.listNumberNewOrder = listNumberNewOrder;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public String getNofi() {
		return nofi;
	}

	public void setNofi(String nofi) {
		this.nofi = nofi;
	}

	public ArrayList<Car> getListCarSearch() {
		return listCarSearch;
	}

	public void setListCarSearch(ArrayList<Car> listCarSearch) {
		this.listCarSearch = listCarSearch;
	}

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

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
