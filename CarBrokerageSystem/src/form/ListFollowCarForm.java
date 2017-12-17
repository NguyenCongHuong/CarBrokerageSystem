package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.FollowCar;

public class ListFollowCarForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String carID;
	private ArrayList<FollowCar> listFollowCar;

	public String getCarID() {
		return carID;
	}

	public void setCarID(String carID) {
		this.carID = carID;
	}

	public ArrayList<FollowCar> getListFollowCar() {
		return listFollowCar;
	}

	public void setListFollowCar(ArrayList<FollowCar> listFollowCar) {
		this.listFollowCar = listFollowCar;
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
