package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Constants;
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

		FengShuiForm fengShuiForm = (FengShuiForm) form;
		StyleCarBO styleCarBO = new StyleCarBO();
		TypeCarBO typeCarBO = new TypeCarBO();
		CarBO carBO = new CarBO();

		String birthday = fengShuiForm.getBirthday();
		String lunarDay = fengShuiForm.getLunarDay();

		fengShuiForm.setListStyleCar(styleCarBO.getListStyle());
		fengShuiForm.setListTypeCar(typeCarBO.getListType());

		if (lunarDay != null) {
			String[] arrDay = lunarDay.split("/");
			String styleCarID = fengShuiForm.getStyleCarID();
			String typeCarID = fengShuiForm.getTypeCarID();
			fengShuiForm.setBirthday(birthday);
			fengShuiForm.setStyleCarID(styleCarID);
			fengShuiForm.setTypeCarID(typeCarID);
			fengShuiForm.setCanChi(
					Constants.CAN[Utils.getYearCan(arrDay[2])] + " " + Constants.CHI[Utils.getYearChi(arrDay[2])]);
			fengShuiForm.setElement(Constants.FIVE_ELEMENTS_VI[Utils.getFiveElements(arrDay[2])]);
			fengShuiForm.setListCar(carBO.getListFengShuiCar(Utils.getFiveElements(arrDay[2]), styleCarID, typeCarID));
			fengShuiForm.setLunarDay(null);
			return mapping.findForward("fengShuiCar");
		}

		fengShuiForm.setBirthday(null);
		return mapping.findForward("fengShui");
	}

}
