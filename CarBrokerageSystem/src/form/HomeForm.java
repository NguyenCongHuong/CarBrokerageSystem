package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Producer;

public class HomeForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String userName;
	private String fullName;
	private ArrayList<Producer> listProducer;

	public ArrayList<Producer> getListProducer() {
		return listProducer;
	}

	public void setListProducer(ArrayList<Producer> listProducer) {
		this.listProducer = listProducer;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}