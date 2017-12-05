package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Utils;
import form.ListCarForm;
import model.bean.Car;
import model.bo.CarBO;

public class SearchAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		ListCarForm listCarForm = (ListCarForm) form;
		CarBO carBO = new CarBO();

		String searchString = listCarForm.getSearchString();
		listCarForm.setSearchString(searchString);

		ArrayList<Car> listCar = null;

		if (Utils.isNumber(searchString) == true && searchString.length() <= 18) {
			listCar = carBO.getListCarPriceOrSeatSreach(searchString);
		} else if (Utils.isNumber(searchString) == false) {
			listCar = carBO.getListProducerSearch(searchString);
			if (listCar.isEmpty())
				listCar = carBO.getListCarSearch(searchString);
		}

		if (listCar.isEmpty() || searchString == null) {
			System.out.println("Gia tri list3: " + listCar.isEmpty());
			listCarForm.setNofi("Không tìm thấy xe tương ứng.");
		}
		
		listCarForm.setListCarSearch(listCar);
		
		return mapping.findForward("search");
	}

}
