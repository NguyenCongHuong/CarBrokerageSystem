package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import model.bean.Car;
import model.bean.Producer;
import model.bean.StyleCar;
import model.bean.TypeCar;

public class CarForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String carID;
	private String carID2;
	private String userName;
	private String producerID;
	private String producerID2;
	private String carName;
	private String price;
	private String warranty;
	private String producerName;
	private String typeCarID;
	private String typeCar;
	private String styleCarID;
	private String styleCar;
	private String carHighlight;
	private String typeHighlight;
	private FormFile carImage;
	private FormFile carBanner;
	private String size;
	private String wheelbase;
	private String weight;
	private String maxWeight;
	private String engineType;
	private String torque;
	private String enginePower;
	private String topSpeed;
	private String fuelTankCapacity;
	private String fuel;
	private String fuelConsumption;
	private String emissionStandard;
	private String gear;
	private String frontBrake;
	private String rearBrake;
	private String frontFoglamp;
	private String rearFoglamp;
	private String rearviewMirrorOutside;
	private String winscreenWiper;
	private String antenna;
	private String doorHandle;
	private String airConditioner;
	private String rearviewMirrorInside;
	private String sunroof;
	private String seatType;
	private String seat;
	private String sunshade;
	private String cupHolder;
	private String speakerType;
	private String dics;
	private String numberSpeaker;
	private String usb;
	private String bluetooth;
	private String electronicStabilityControl;
	private String brakelight;
	private String childSafetyLock;
	private String seatBelt;
	private String airbag;
	private String money;
	private String safe;
	private String color;
	private String fiveElement;
	private String follow;
	private ArrayList<Producer> listProducer;
	private ArrayList<StyleCar> listStyle;
	private ArrayList<TypeCar> listType;
	private ArrayList<Car> listCar;
	private Car carDetail;
	private Car carDetail2;
	private String submit;

	public String getFollow() {
		return follow;
	}

	public void setFollow(String follow) {
		this.follow = follow;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	public ArrayList<StyleCar> getListStyle() {
		return listStyle;
	}

	public void setListStyle(ArrayList<StyleCar> listStyle) {
		this.listStyle = listStyle;
	}

	public ArrayList<TypeCar> getListType() {
		return listType;
	}

	public void setListType(ArrayList<TypeCar> listType) {
		this.listType = listType;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getFiveElement() {
		return fiveElement;
	}

	public void setFiveElement(String fiveElement) {
		this.fiveElement = fiveElement;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getWarranty() {
		return warranty;
	}

	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}

	public String getProducerName() {
		return producerName;
	}

	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}

	public String getTypeCarID() {
		return typeCarID;
	}

	public void setTypeCarID(String typeCarID) {
		this.typeCarID = typeCarID;
	}

	public String getTypeCar() {
		return typeCar;
	}

	public void setTypeCar(String typeCar) {
		this.typeCar = typeCar;
	}

	public String getStyleCarID() {
		return styleCarID;
	}

	public void setStyleCarID(String styleCarID) {
		this.styleCarID = styleCarID;
	}

	public String getStyleCar() {
		return styleCar;
	}

	public void setStyleCar(String styleCar) {
		this.styleCar = styleCar;
	}

	public String getCarHighlight() {
		return carHighlight;
	}

	public void setCarHighlight(String carHighlight) {
		this.carHighlight = carHighlight;
	}

	public String getTypeHighlight() {
		return typeHighlight;
	}

	public void setTypeHighlight(String typeHighlight) {
		this.typeHighlight = typeHighlight;
	}

	public FormFile getCarImage() {
		return carImage;
	}

	public void setCarImage(FormFile carImage) {
		this.carImage = carImage;
	}

	public FormFile getCarBanner() {
		return carBanner;
	}

	public void setCarBanner(FormFile carBanner) {
		this.carBanner = carBanner;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getWheelbase() {
		return wheelbase;
	}

	public void setWheelbase(String wheelbase) {
		this.wheelbase = wheelbase;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getMaxWeight() {
		return maxWeight;
	}

	public void setMaxWeight(String maxWeight) {
		this.maxWeight = maxWeight;
	}

	public String getEngineType() {
		return engineType;
	}

	public void setEngineType(String engineType) {
		this.engineType = engineType;
	}

	public String getTorque() {
		return torque;
	}

	public void setTorque(String torque) {
		this.torque = torque;
	}

	public String getEnginePower() {
		return enginePower;
	}

	public void setEnginePower(String enginePower) {
		this.enginePower = enginePower;
	}

	public String getTopSpeed() {
		return topSpeed;
	}

	public void setTopSpeed(String topSpeed) {
		this.topSpeed = topSpeed;
	}

	public String getFuelTankCapacity() {
		return fuelTankCapacity;
	}

	public void setFuelTankCapacity(String fuelTankCapacity) {
		this.fuelTankCapacity = fuelTankCapacity;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public String getFuelConsumption() {
		return fuelConsumption;
	}

	public void setFuelConsumption(String fuelConsumption) {
		this.fuelConsumption = fuelConsumption;
	}

	public String getEmissionStandard() {
		return emissionStandard;
	}

	public void setEmissionStandard(String emissionStandard) {
		this.emissionStandard = emissionStandard;
	}

	public String getGear() {
		return gear;
	}

	public void setGear(String gear) {
		this.gear = gear;
	}

	public String getFrontBrake() {
		return frontBrake;
	}

	public void setFrontBrake(String frontBrake) {
		this.frontBrake = frontBrake;
	}

	public String getRearBrake() {
		return rearBrake;
	}

	public void setRearBrake(String rearBrake) {
		this.rearBrake = rearBrake;
	}

	public String getFrontFoglamp() {
		return frontFoglamp;
	}

	public void setFrontFoglamp(String frontFoglamp) {
		this.frontFoglamp = frontFoglamp;
	}

	public String getRearFoglamp() {
		return rearFoglamp;
	}

	public void setRearFoglamp(String rearFoglamp) {
		this.rearFoglamp = rearFoglamp;
	}

	public String getRearviewMirrorOutside() {
		return rearviewMirrorOutside;
	}

	public void setRearviewMirrorOutside(String rearviewMirrorOutside) {
		this.rearviewMirrorOutside = rearviewMirrorOutside;
	}

	public String getWinscreenWiper() {
		return winscreenWiper;
	}

	public void setWinscreenWiper(String winscreenWiper) {
		this.winscreenWiper = winscreenWiper;
	}

	public String getAntenna() {
		return antenna;
	}

	public void setAntenna(String antenna) {
		this.antenna = antenna;
	}

	public String getDoorHandle() {
		return doorHandle;
	}

	public void setDoorHandle(String doorHandle) {
		this.doorHandle = doorHandle;
	}

	public String getAirConditioner() {
		return airConditioner;
	}

	public void setAirConditioner(String airConditioner) {
		this.airConditioner = airConditioner;
	}

	public String getRearviewMirrorInside() {
		return rearviewMirrorInside;
	}

	public void setRearviewMirrorInside(String rearviewMirrorInside) {
		this.rearviewMirrorInside = rearviewMirrorInside;
	}

	public String getSunroof() {
		return sunroof;
	}

	public void setSunroof(String sunroof) {
		this.sunroof = sunroof;
	}

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getSunshade() {
		return sunshade;
	}

	public void setSunshade(String sunshade) {
		this.sunshade = sunshade;
	}

	public String getCupHolder() {
		return cupHolder;
	}

	public void setCupHolder(String cupHolder) {
		this.cupHolder = cupHolder;
	}

	public String getSpeakerType() {
		return speakerType;
	}

	public void setSpeakerType(String speakerType) {
		this.speakerType = speakerType;
	}

	public String getDics() {
		return dics;
	}

	public void setDics(String dics) {
		this.dics = dics;
	}

	public String getNumberSpeaker() {
		return numberSpeaker;
	}

	public void setNumberSpeaker(String numberSpeaker) {
		this.numberSpeaker = numberSpeaker;
	}

	public String getUsb() {
		return usb;
	}

	public void setUsb(String usb) {
		this.usb = usb;
	}

	public String getBluetooth() {
		return bluetooth;
	}

	public void setBluetooth(String bluetooth) {
		this.bluetooth = bluetooth;
	}

	public String getElectronicStabilityControl() {
		return electronicStabilityControl;
	}

	public void setElectronicStabilityControl(String electronicStabilityControl) {
		this.electronicStabilityControl = electronicStabilityControl;
	}

	public String getBrakelight() {
		return brakelight;
	}

	public void setBrakelight(String brakelight) {
		this.brakelight = brakelight;
	}

	public String getChildSafetyLock() {
		return childSafetyLock;
	}

	public void setChildSafetyLock(String childSafetyLock) {
		this.childSafetyLock = childSafetyLock;
	}

	public String getSeatBelt() {
		return seatBelt;
	}

	public void setSeatBelt(String seatBelt) {
		this.seatBelt = seatBelt;
	}

	public String getAirbag() {
		return airbag;
	}

	public void setAirbag(String airbag) {
		this.airbag = airbag;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getSafe() {
		return safe;
	}

	public void setSafe(String safe) {
		this.safe = safe;
	}

	public Car getCarDetail2() {
		return carDetail2;
	}

	public void setCarDetail2(Car carDetail2) {
		this.carDetail2 = carDetail2;
	}

	public String getCarID2() {
		return carID2;
	}

	public void setCarID2(String carID2) {
		this.carID2 = carID2;
	}

	public String getProducerID2() {
		return producerID2;
	}

	public void setProducerID2(String producerID2) {
		this.producerID2 = producerID2;
	}

	public String getProducerID() {
		return producerID;
	}

	public void setProducerID(String producerID) {
		this.producerID = producerID;
	}

	public ArrayList<Producer> getListProducer() {
		return listProducer;
	}

	public void setListProducer(ArrayList<Producer> listProducer) {
		this.listProducer = listProducer;
	}

	public ArrayList<Car> getListCar() {
		return listCar;
	}

	public void setListCar(ArrayList<Car> listCar) {
		this.listCar = listCar;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Car getCarDetail() {
		return carDetail;
	}

	public void setCarDetail(Car carDetail) {
		this.carDetail = carDetail;
	}

	public String getCarID() {
		return carID;
	}

	public void setCarID(String carID) {
		this.carID = carID;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
