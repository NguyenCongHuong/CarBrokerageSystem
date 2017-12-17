package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

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
	
	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
