package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Constants;
import form.ListCarForm;
import model.bean.Producer;
import model.bo.CarBO;
import model.bo.OrderBO;
import model.bo.ProducerBO;

public class ManageCarAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		if (session.getAttribute("userName") == null) {
			return mapping.findForward("login");
		}

		if (Constants.USER.equals(session.getAttribute("type"))) {
			return mapping.findForward("login");
		}

		ListCarForm listCarForm = (ListCarForm) form;
		ProducerBO producerBO = new ProducerBO();
		CarBO carBO = new CarBO();
		OrderBO orderBO = new OrderBO();

		ArrayList<Producer> listProducer = producerBO.getListProducer();
		listCarForm.setListProducer(listProducer);

		String producerID = listCarForm.getProducerID();
		String producerName = "";
		if (producerID == null) {
			if (session.getAttribute("producerID") == null) {
				producerID = listProducer.get(0).getProducerID();
				producerName = listProducer.get(0).getProducerName();
			} else {
				producerID = "" + session.getAttribute("producerID");
				producerName = producerBO.getProducerName(producerID);
			}
		} else {
			producerName = producerBO.getProducerName(producerID);
		}

		listCarForm.setProducerName(producerName);
		listCarForm.setNumberNewOrder(orderBO.numberNewOrder());
		listCarForm.setListCar(carBO.getListCar(producerID));
		listCarForm.setListNumberNewOrder(orderBO.getListNumberNewOrder());

		return mapping.findForward("manageCar");
	}

}
