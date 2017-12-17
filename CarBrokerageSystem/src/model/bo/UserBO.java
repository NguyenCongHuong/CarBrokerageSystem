package model.bo;

import java.util.ArrayList;

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

	public void addUser(String userName, String fullName, String password, String phoneNumber, String email) {
		userDAO.addUser(userName, fullName, password, phoneNumber, email);
	}

	public boolean checkUserName(String userName) {
		return userDAO.checkUserName(userName);
	}

	public void editUser(String userName, String fullName, String phoneNumber, String email, String address) {
		userDAO.editUser(userName, fullName, phoneNumber, email, address);
	}

	public ArrayList<User> getListUser() {
		return userDAO.getListUser();
	}
}
