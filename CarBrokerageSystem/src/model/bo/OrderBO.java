package model.bo;

import java.util.ArrayList;

import model.bean.Order;
import model.dao.OrderDAO;

public class OrderBO {

	OrderDAO orderDAO = new OrderDAO();

	public ArrayList<Order> getListOrder() {
		return orderDAO.getListOrder();
	}
	
	public void deleteOrder(String orderID) {
		orderDAO.deleteOrder(orderID);
	}
}