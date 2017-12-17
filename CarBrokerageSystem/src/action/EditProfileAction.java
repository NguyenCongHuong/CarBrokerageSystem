package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Utils;
import form.UserForm;
import model.bo.UserBO;

public class EditProfileAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		if (session.getAttribute("userName") == null) {
			return mapping.findForward("login");
		}

		String userName = "" + session.getAttribute("userName");
		UserForm userForm = (UserForm) form;
		UserBO userBO  = new UserBO();
		
		if ("submit".equals(userForm.getSubmit())) {
			userName = userForm.getUserName();
			String fullName = userForm.getFullName();
			String email = userForm.getEmail();
			String phoneNumber = userForm.getPhoneNumber();
			String address = userForm.getAddress();
			System.out.println("loi1: "+userForm.getFullName());
			System.out.println("loi2: "+Utils.unicode(userForm.getFullName()));
			userBO.editUser(userName, fullName, phoneNumber, email, address);
		}
		
		userForm.setUser(userBO.getUser(userName));

		return mapping.findForward("profile");
	}

}
