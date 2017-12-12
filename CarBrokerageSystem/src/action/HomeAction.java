package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.HomeForm;
import model.bean.User;
import model.bo.CarBO;
import model.bo.ProducerBO;
import model.bo.TypeCarBO;
import model.bo.UserBO;

public class HomeAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		HomeForm homeForm = (HomeForm) form;
		UserBO userBO = new UserBO();
		ProducerBO producerBO = new ProducerBO();
		CarBO carBO = new CarBO();
		TypeCarBO typeCarBO = new TypeCarBO();

		String userName = "" + session.getAttribute("userName");

		homeForm.setUserName(userName);
		homeForm.setListProducer(producerBO.getListProducer());
		homeForm.setListCarHighlight(carBO.getListCarHighlight());
		homeForm.setListTypeHighlight(typeCarBO.getListTypeHighlight());

		if (session.getAttribute("userName") != null) {
			User user = userBO.getUser(userName);
			homeForm.setFullName(user.getFullName());
		}

		return mapping.findForward("home");
	}

}
