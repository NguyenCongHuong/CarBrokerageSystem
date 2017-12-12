package model.bo;

import java.util.ArrayList;

import model.bean.TypeCar;
import model.dao.TypeCarDAO;

public class TypeCarBO {

	TypeCarDAO typeCarDAO = new TypeCarDAO();

	public ArrayList<TypeCar> getListType() {
		return typeCarDAO.getListType();
	}

	public void addType(String typeCar) {
		typeCarDAO.addType(typeCar);
	}

	public void deleteType(String typeCarID) {
		typeCarDAO.deleteType(typeCarID);
	}

	public void editType(String typeCarID, String typeCar) {
		typeCarDAO.editType(typeCarID, typeCar);
	}

	public boolean checkTypeName(String typeCar) {
		return typeCarDAO.checkTypeName(typeCar);
	}

	public ArrayList<TypeCar> getListTypeHighlight() {
		return typeCarDAO.getListTypeHighlight();
	}
}
