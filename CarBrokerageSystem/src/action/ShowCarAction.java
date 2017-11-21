package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.ListCarForm;
import model.bo.CarBO;
import model.bo.ProducerBO;

public class ShowCarAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ListCarForm listCarForm = (ListCarForm) form;
		CarBO carBO = new CarBO();
		ProducerBO producerBO = new ProducerBO();

		String producerID = listCarForm.getProducerID();

		listCarForm.setProducerName(producerBO.getProducerName(producerID));
		listCarForm.setListCar(carBO.getListCar(producerID));

		return mapping.findForward("listCar");
	}

}
