package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Car;
import model.bean.Producer;
import model.bean.TypeCar;

public class HomeForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String userName;
	private String fullName;
	private ArrayList<Producer> listProducer;
	private ArrayList<Car> listCarHighlight;
	private ArrayList<TypeCar> listTypeHighlight;

	public ArrayList<TypeCar> getListTypeHighlight() {
		return listTypeHighlight;
	}

	public void setListTypeHighlight(ArrayList<TypeCar> listTypeHighlight) {
		this.listTypeHighlight = listTypeHighlight;
	}

	public ArrayList<Car> getListCarHighlight() {
		return listCarHighlight;
	}

	public void setListCarHighlight(ArrayList<Car> listCarHighlight) {
		this.listCarHighlight = listCarHighlight;
	}

	public ArrayList<Producer> getListProducer() {
		return listProducer;
	}

	public void setListProducer(ArrayList<Producer> listProducer) {
		this.listProducer = listProducer;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
