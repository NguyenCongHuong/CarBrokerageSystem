package model.bo;

import java.util.ArrayList;

import model.bean.FollowCar;
import model.dao.FollowCarDAO;

public class FollowCarBO {
	FollowCarDAO followCarDAO = new FollowCarDAO();

	public ArrayList<FollowCar> getListFollowCar() {
		return followCarDAO.getListFollowCar();
	}
}
