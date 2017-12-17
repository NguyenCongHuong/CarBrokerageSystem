package action;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import common.Constants;
import form.CarForm;
import model.bo.CarBO;
import model.bo.FiveElementBO;
import model.bo.ProducerBO;
import model.bo.StyleCarBO;
import model.bo.TypeCarBO;

public class AddCarAction extends Action {

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

		CarForm carForm = (CarForm) form;
		CarBO carBO = new CarBO();
		FiveElementBO fiveElementBO = new FiveElementBO();
		ProducerBO producerBO = new ProducerBO();
		StyleCarBO styleCarBO = new StyleCarBO();
		TypeCarBO typeCarBO = new TypeCarBO();

		carForm.setListProducer(producerBO.getListProducer());
		carForm.setListStyle(styleCarBO.getListStyle());
		carForm.setListType(typeCarBO.getListType());

		if ("submit".equals(carForm.getSubmit())) {

			FileOutputStream outputStream = null;
			FormFile file = null;
			try {
				file = carForm.getCarImage();
				String path = Constants.LINK_UPLOAD_IMG + Constants.LINK_SHOW_IMG + file.getFileName();

				outputStream = new FileOutputStream(new File(path));
				outputStream.write(file.getFileData());
			} finally {
				if (outputStream != null) {
					outputStream.close();
				}
			}
			String carBanner = "";
			if (!"".equals("" + carForm.getCarBanner())) {
				FileOutputStream outputStream2 = null;
				FormFile file2 = null;
				try {
					file2 = carForm.getCarBanner();
					String path2 = Constants.LINK_UPLOAD_IMG + Constants.LINK_SHOW_IMG + file2.getFileName();

					outputStream2 = new FileOutputStream(new File(path2));
					outputStream2.write(file2.getFileData());
				} finally {
					if (outputStream2 != null) {
						outputStream2.close();
					}
				}
				carBanner = file2.getFileName();
			}

			String carName = carForm.getCarName();
			String producerID = carForm.getProducerID();
			String price = carForm.getPrice();
			String warranty = carForm.getWarranty();
			String typeCarID = carForm.getTypeCarID();
			String styleCarID = carForm.getStyleCarID();
			String size = carForm.getSize();
			String wheelbase = carForm.getWheelbase();
			String weight = carForm.getWeight();
			String maxWeight = carForm.getMaxWeight();
			String engineType = carForm.getEngineType();
			String torque = carForm.getTorque();
			String enginePower = carForm.getEnginePower();
			String topSpeed = carForm.getTopSpeed();
			String fuelTankCapacity = carForm.getFuelTankCapacity();
			String fuel = carForm.getFuel();
			String fuelConsumption = carForm.getFuelConsumption();
			String emissionStandard = carForm.getEmissionStandard();
			String gear = carForm.getGear();
			String frontBrake = carForm.getFrontBrake();
			String rearBrake = carForm.getRearBrake();
			String frontFoglamp = carForm.getFrontFoglamp();
			String rearFoglamp = carForm.getRearFoglamp();
			String rearviewMirrorOutside = carForm.getRearviewMirrorOutside();
			String winscreenWiper = carForm.getWinscreenWiper();
			String antenna = carForm.getAntenna();
			String doorHandle = carForm.getDoorHandle();
			String airConditioner = carForm.getAirConditioner();
			String rearviewMirrorInside = carForm.getRearviewMirrorInside();
			String sunroof = carForm.getSunroof();
			String seatType = carForm.getSeatType();
			String seat = carForm.getSeat();
			String sunshade = carForm.getSunshade();
			String cupHolder = carForm.getCupHolder();
			String speakerType = carForm.getSpeakerType();
			String dics = carForm.getDics();
			String numberSpeaker = carForm.getNumberSpeaker();
			String usb = carForm.getUsb();
			String bluetooth = carForm.getBluetooth();
			String electronicStabilityControl = carForm.getElectronicStabilityControl();
			String brakelight = carForm.getBrakelight();
			String childSafetyLock = carForm.getChildSafetyLock();
			String seatBelt = carForm.getSeatBelt();
			String airbag = carForm.getAirbag();
			String color = carForm.getColor();
			String[] fiveElement = { "0", "0", "0", "0", "0" };
			fiveElement[Integer.parseInt(carForm.getFiveElement())] = "1";

			carBO.addCar(carName, price, warranty, producerID, styleCarID, typeCarID, size, wheelbase, weight,
					maxWeight, engineType, torque, enginePower, topSpeed, fuelTankCapacity, fuel, fuelConsumption,
					emissionStandard, gear, frontBrake, rearBrake, frontFoglamp, rearFoglamp, rearviewMirrorOutside,
					winscreenWiper, antenna, doorHandle, airConditioner, rearviewMirrorInside, sunroof, seatType, seat,
					sunshade, cupHolder, speakerType, dics, numberSpeaker, usb, bluetooth, electronicStabilityControl,
					brakelight, childSafetyLock, seatBelt, airbag);

			fiveElementBO.addFiveElement(carBO.getCarID(carName), color, file.getFileName(), carBanner, fiveElement[0],
					fiveElement[1], fiveElement[2], fiveElement[3], fiveElement[4]);
		}
		
		carForm.setCarName("");
		carForm.setPrice("");
		carForm.setWarranty("");
		carForm.setSize("");
		carForm.setWheelbase("");
		carForm.setWeight("");
		carForm.setMaxWeight("");
		carForm.setEngineType("");
		carForm.setTorque("");
		carForm.setEnginePower("");
		carForm.setTopSpeed("");
		carForm.setFuelTankCapacity("");
		carForm.setFuel("");
		carForm.setFuelConsumption("");
		carForm.setEmissionStandard("");
		carForm.setGear("");
		carForm.setFrontBrake("");
		carForm.setRearBrake("");
		carForm.setFrontFoglamp("");
		carForm.setRearFoglamp("");
		carForm.setRearviewMirrorOutside("");
		carForm.setWinscreenWiper("");
		carForm.setAntenna("");
		carForm.setDoorHandle("");
		carForm.setAirConditioner("");
		carForm.setRearviewMirrorInside("");
		carForm.setSunroof("");
		carForm.setSeatType("");
		carForm.setSeat("");
		carForm.setSunshade("");
		carForm.setCupHolder("");
		carForm.setSpeakerType("");
		carForm.setDics("");
		carForm.setNumberSpeaker("");
		carForm.setUsb("");
		carForm.setBluetooth("");
		carForm.setElectronicStabilityControl("");
		carForm.setBrakelight("");
		carForm.setChildSafetyLock("");
		carForm.setSeatBelt("");
		carForm.setAirbag("");
		carForm.setColor("");

		return mapping.findForward("addCar");
	}

}
