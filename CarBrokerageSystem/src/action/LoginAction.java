package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Constants;
import form.UserForm;
import model.bean.User;
import model.bo.UserBO;

public class LoginAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		UserForm userForm = (UserForm) form;
		UserBO userBO = new UserBO();

		String userName = userForm.getUserName();
		String password = userForm.getPassword();

		if (userName == null && password == null) {
			return mapping.findForward("login");
		}

		if (userBO.checkLogin(userName, password)) {
			User user = userBO.getUser(userName);
			session.setAttribute("userName", user.getUserName());
			session.setAttribute("type", user.getType());
			if (session.getAttribute("userName") == null) {
				return mapping.findForward("login");
			} else if (Constants.ADMIN.equals(user.getType())) {
				userForm.setUser(user);
				return mapping.findForward("loginAdmin");
			} else
				return mapping.findForward("loginUser");
		} else {
			userForm.setNotify(Constants.MSG_LOGIN_FAILED);
			return mapping.findForward("loginFail");
		}

	}

}
