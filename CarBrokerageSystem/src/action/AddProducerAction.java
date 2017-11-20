package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Constants;
import form.ProducerForm;
import model.bo.ProducerBO;

public class AddProducerAction extends Action {

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

		ProducerForm producerForm = (ProducerForm) form;
		ProducerBO producerBO = new ProducerBO();

		String producerName = producerForm.getProducerName();

		if (producerBO.checkProducerName(producerName)) {
			producerForm.setProducerName(producerName);
			producerForm.setNotifyFail(Constants.MSG_ADD_PRODUCER_FAIL);
		} else if (producerName == null) {
			return mapping.findForward("addProducer");
		} else {
			producerBO.addProducer(producerName);
			producerForm.setProducerName("");
			producerForm.setNotify(Constants.MSG_ADD_PRODUCER);
		}

		return mapping.findForward("addProducer");
	}

}
