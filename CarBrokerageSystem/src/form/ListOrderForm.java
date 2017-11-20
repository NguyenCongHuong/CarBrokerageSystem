package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Order;

public class ListOrderForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private ArrayList<Order> listOrder;

	public ArrayList<Order> getListOrder() {
		return listOrder;
	}

	public void setListOrder(ArrayList<Order> listOrder) {
		this.listOrder = listOrder;
	}

}
