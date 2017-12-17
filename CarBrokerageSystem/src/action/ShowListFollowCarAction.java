package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.ListFollowCarForm;
import model.bo.FollowCarBO;

public class ShowListFollowCarAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		if (session.getAttribute("userName") == null) {
			return mapping.findForward("login");
		}

		ListFollowCarForm listFollowCarForm = (ListFollowCarForm) form;
		FollowCarBO followCarBO = new FollowCarBO();

		listFollowCarForm.setListFollowCar(followCarBO.getListFollowCar());

		return mapping.findForward("listFollowCar");
	}

}
