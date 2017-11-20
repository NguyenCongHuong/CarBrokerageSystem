package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Constants;
import form.ListStyleForm;
import model.bo.StyleCarBO;

public class ManageStyleAction extends Action {

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

		ListStyleForm listStyleForm = (ListStyleForm) form;
		StyleCarBO styleCarBO = new StyleCarBO();
		
		listStyleForm.setListStyleCar(styleCarBO.getListStyle());

		return mapping.findForward("manageStyle");
	}

}
