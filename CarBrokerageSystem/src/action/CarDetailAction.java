package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.CarForm;
import model.bo.CarBO;

public class CarDetailAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		CarForm carForm = (CarForm) form;
		CarBO carBO = new CarBO();

		String carID = carForm.getCarID();

		carForm.setCarDetail(carBO.getCarDetail(carID));
		carForm.setUserName((String) session.getAttribute("userName"));

		return mapping.findForward("carDetail");
	}

}
