package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Car;
import model.bean.StyleCar;
import model.bean.TypeCar;

public class FengShuiForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String birthday;
	private String lunarDay;
	private String styleCarID;
	private String typeCarID;
	private String information;
	private String canChi;
	private String element;
	private ArrayList<TypeCar> listTypeCar;
	private ArrayList<StyleCar> listStyleCar;
	private ArrayList<Car> listCar;

	public String getElement() {
		return element;
	}

	public void setElement(String element) {
		this.element = element;
	}

	public String getCanChi() {
		return canChi;
	}

	public void setCanChi(String canChi) {
		this.canChi = canChi;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public ArrayList<TypeCar> getListTypeCar() {
		return listTypeCar;
	}

	public void setListTypeCar(ArrayList<TypeCar> listTypeCar) {
		this.listTypeCar = listTypeCar;
	}

	public String getTypeCarID() {
		return typeCarID;
	}

	public void setTypeCarID(String typeCarID) {
		this.typeCarID = typeCarID;
	}

	public String getStyleCarID() {
		return styleCarID;
	}

	public void setStyleCarID(String styleCarID) {
		this.styleCarID = styleCarID;
	}

	public ArrayList<Car> getListCar() {
		return listCar;
	}

	public void setListCar(ArrayList<Car> listCar) {
		this.listCar = listCar;
	}

	public String getLunarDay() {
		return lunarDay;
	}

	public void setLunarDay(String lunarDay) {
		this.lunarDay = lunarDay;
	}

	public ArrayList<StyleCar> getListStyleCar() {
		return listStyleCar;
	}

	public void setListStyleCar(ArrayList<StyleCar> listStyleCar) {
		this.listStyleCar = listStyleCar;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

}
