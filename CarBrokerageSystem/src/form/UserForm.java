package form;

import org.apache.struts.action.ActionForm;

import model.bean.User;

public class UserForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String userName;
	private String password;
	private String notify;
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNotify() {
		return notify;
	}

	public void setNotify(String notify) {
		this.notify = notify;
	}

}
