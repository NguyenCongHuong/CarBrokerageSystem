package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Constants;
import form.UserForm;
import model.bo.UserBO;

public class SignUpAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		UserForm userForm = (UserForm) form;
		UserBO userBO = new UserBO();

		String userName = userForm.getUserName();
		String password = userForm.getPassword();
		String comfirmPass = userForm.getComfirmPass();
		String phoneNumber = userForm.getPhoneNumber();
		String email = userForm.getEmail();
		String fullName = userForm.getFullName();
		
		
		if (userBO.checkUserName(userName)) {
			userForm.setNotify(Constants.MSG_USER_NAME);
			return mapping.findForward("signUp");
		} else {
			if (!comfirmPass.equals(password)) {
				userForm.setNotifyPass(Constants.MSG_PASS);
				userForm.setNotify("");
				return mapping.findForward("signUp");
			}else {
				userForm.setNotify("");
				userForm.setNotifyPass("");
				userForm.setUserName("");
				userForm.setFullName("");
				userForm.setPassword("");
				userForm.setComfirmPass("");
				userForm.setPhoneNumber("");
				userForm.setEmail("");
				userForm.setSuccess(Constants.MSG_SIGN_UP_SUCCESS);
				userBO.addUser(userName, fullName, password, phoneNumber, email);
			}
		}

		return mapping.findForward("signUp");
	}

}
