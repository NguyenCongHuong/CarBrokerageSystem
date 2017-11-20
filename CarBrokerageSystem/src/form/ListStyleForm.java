package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.StyleCar;

public class ListStyleForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private ArrayList<StyleCar> listStyleCar;

	public ArrayList<StyleCar> getListStyleCar() {
		return listStyleCar;
	}

	public void setListStyleCar(ArrayList<StyleCar> listStyleCar) {
		this.listStyleCar = listStyleCar;
	}

}
