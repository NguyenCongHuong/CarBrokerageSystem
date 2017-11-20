package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Constants;
import form.StyleForm;
import model.bo.StyleCarBO;

public class EditStyleAction extends Action {

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
		
		StyleForm styleForm = (StyleForm) form;
		StyleCarBO styleCarBO = new StyleCarBO();
		
		styleCarBO.editStyle(styleForm.getStyleCarID(), styleForm.getStyleCar());
		
		return mapping.findForward("editStyle");
	}

}
