package model.bo;

import model.bean.User;
import model.dao.UserDAO;

public class UserBO {
	UserDAO userDAO = new UserDAO();
	
	public boolean checkLogin(String userName, String password) {
		return userDAO.checkLogin(userName, password);
	}
	
	public User getUser(String userName) {
		return userDAO.getUser(userName);
	}

}
