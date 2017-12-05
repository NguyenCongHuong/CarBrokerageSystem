package model.bo;

import java.util.ArrayList;

import model.bean.FiveElement;
import model.dao.FiveElementDAO;

public class FiveElementBO {

	FiveElementDAO fiveElementDAO = new FiveElementDAO();
	
	public ArrayList<FiveElement> getListColor(String carID) {
		return fiveElementDAO.getListColor(carID);
	}
	
}
