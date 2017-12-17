package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

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

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
