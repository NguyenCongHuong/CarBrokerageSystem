package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.TypeCar;

public class ListTypeForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private ArrayList<TypeCar> listTypeCar;

	public ArrayList<TypeCar> getListTypeCar() {
		return listTypeCar;
	}

	public void setListTypeCar(ArrayList<TypeCar> listTypeCar) {
		this.listTypeCar = listTypeCar;
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
