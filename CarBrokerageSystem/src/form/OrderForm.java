package form;

import org.apache.struts.action.ActionForm;

public class OrderForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String orderID;

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

}
