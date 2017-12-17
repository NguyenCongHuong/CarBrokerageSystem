package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Constants;
import form.TypeForm;
import model.bo.TypeCarBO;

public class AddTypeAction extends Action {

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
		
		TypeForm typeForm = (TypeForm) form;
		TypeCarBO typeCarBO = new TypeCarBO();
		
		String typeCar = typeForm.getTypeCar();
		
		if(typeCar==null) {
			return mapping.findForward("addStyle");
		}else if(typeCarBO.checkTypeName(typeCar)) {
			typeForm.setTypeCar(typeCar);
			typeForm.setNotifyFail(Constants.MSG_ADD_TYPE_FAIL);
		}else{
			typeCarBO.addType(typeCar);
			typeForm.setTypeCar("");
			typeForm.setNotify(Constants.MSG_ADD_TYPE);
		}
		
		return mapping.findForward("addType");
	}

}
