package form;

import org.apache.struts.action.ActionForm;

public class OrderForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String orderID;
	private String Orderer;
	private String Email;
	private String PhoneNumber;
	private String Address;
	private String OrderDate;
	private String CarID;
	private String UserName;

	public String getOrderer() {
		return Orderer;
	}

	public void setOrderer(String orderer) {
		Orderer = orderer;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getOrderDate() {
		return OrderDate;
	}

	public void setOrderDate(String orderDate) {
		OrderDate = orderDate;
	}

	public String getCarID() {
		return CarID;
	}

	public void setCarID(String carID) {
		CarID = carID;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

}
