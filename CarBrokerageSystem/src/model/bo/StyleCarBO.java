package model.bo;

import java.util.ArrayList;

import model.bean.StyleCar;
import model.dao.StyleCarDAO;

public class StyleCarBO {

	StyleCarDAO styleCarDAO = new StyleCarDAO();

	public ArrayList<StyleCar> getListStyle() {
		return styleCarDAO.getListStyle();
	}

	public void addStyle(String styleCar) {
		styleCarDAO.addStyle(styleCar);
	}

	public void deleteStyle(String styleCarID) {
		styleCarDAO.deleteStyle(styleCarID);
	}

	public void editStyle(String styleCarID, String styleCar) {
		styleCarDAO.editStyle(styleCarID, styleCar);
	}

	public boolean checkStyleName(String styleCar) {
		return styleCarDAO.checkStyleName(styleCar);
	}

	public ArrayList<StyleCar> getListStyleHighlight() {
		return styleCarDAO.getListStyleHighlight();
	}
}
