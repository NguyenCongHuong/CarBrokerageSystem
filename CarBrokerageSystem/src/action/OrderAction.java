package action;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.OrderForm;
import model.bo.OrderBO;

public class OrderAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		OrderBO orderBO = new OrderBO();
		OrderForm orderForm = (OrderForm) form;
		
		String carID = orderForm.getCarID();
		String orderer = orderForm.getOrderer();
		String email = orderForm.getEmail();
		String phoneNumber = orderForm.getPhoneNumber();
		String address = orderForm.getAddress();
		String userName = orderForm.getUserName();
		
		// Lay thoi gian
		Date today = new Date(System.currentTimeMillis());
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd");
		String orderDate = timeFormat.format(today.getTime());
		
		orderBO.addOrder(orderer, email, phoneNumber, address, orderDate, carID, userName);
		
		orderForm.setCarID(carID);
		
		return mapping.findForward("order");
	}

}
