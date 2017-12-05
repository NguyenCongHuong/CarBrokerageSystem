package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.CarForm;
import model.bean.Car;
import model.bo.CarBO;
import model.bo.ProducerBO;

public class CompareAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		CarForm carForm = (CarForm) form;
		CarBO carBO = new CarBO();
		ProducerBO producerBO = new ProducerBO();

		String carID1 = carForm.getCarID();
		String carID2 = carForm.getCarID2();
		String producerID1 = carForm.getProducerID();
		String producerID2 = carForm.getProducerID2();

		carForm.setListProducer(producerBO.getListProducer());
		carForm.setListCar(carBO.getListCar());

		Car car1 = new Car();
		Car car2 = new Car();

		if (carID1 != null) {
			String[] arrID1 = carID1.split("_");
			car1 = carBO.getCarDetail(arrID1[1]);
		}

		if (carID2 != null) {
			String[] arrID2 = carID2.split("_");
			car2 = carBO.getCarDetail(arrID2[1]);
		}
		
		carForm.setCarDetail(car1);
		carForm.setCarDetail2(car2);
		
		return mapping.findForward("compare");
	}

}
