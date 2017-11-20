package form;

import org.apache.struts.action.ActionForm;

public class StyleForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String styleCarID;
	private String styleCar;
	private String notify;
	private String notifyFail;

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

	public String getNotify() {
		return notify;
	}

	public void setNotify(String notify) {
		this.notify = notify;
	}

	public String getNotifyFail() {
		return notifyFail;
	}

	public void setNotifyFail(String notifyFail) {
		this.notifyFail = notifyFail;
	}

}
