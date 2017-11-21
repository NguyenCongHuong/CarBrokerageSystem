package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Utils;
import form.FengShuiForm;
import model.bo.CarBO;
import model.bo.StyleCarBO;
import model.bo.TypeCarBO;

public class FengShuiAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		FengShuiForm fengShuiForm = (FengShuiForm) form;
		StyleCarBO styleCarBO = new StyleCarBO();
		TypeCarBO typeCarBO = new TypeCarBO();
		CarBO carBO = new CarBO();

		String birthday = fengShuiForm.getBirthday();
		String lunarDay = fengShuiForm.getLunarDay();
		System.out.println("feng: " + birthday + ", và" + lunarDay);
		fengShuiForm.setListStyleCar(styleCarBO.getListStyle());
		fengShuiForm.setListTypeCar(typeCarBO.getListType());

		if(lunarDay != null) {
			System.out.println("1");
			String[] arrDay = lunarDay.split("/");
			fengShuiForm.setListCar(carBO.getListFengShuiCar(Utils.getFiveElements(arrDay[2])));
			return mapping.findForward("fengShuiCar");
		}

		return mapping.findForward("fengShui");
	}

}
