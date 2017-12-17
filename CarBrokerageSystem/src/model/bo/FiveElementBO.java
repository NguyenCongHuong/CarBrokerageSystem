package model.bo;

import java.util.ArrayList;

import model.bean.FiveElement;
import model.dao.FiveElementDAO;

public class FiveElementBO {

	FiveElementDAO fiveElementDAO = new FiveElementDAO();

	public ArrayList<FiveElement> getListColor(String carID) {
		return fiveElementDAO.getListColor(carID);
	}

	public void addFiveElement(String carID, String color, String carImage, String carBanner, String metal,
			String water, String fire, String earth, String wood) {
		fiveElementDAO.addFiveElement(carID, color, carImage, carBanner, metal, water, fire, earth, wood);
	}

}
