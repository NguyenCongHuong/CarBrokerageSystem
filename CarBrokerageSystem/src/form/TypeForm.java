package form;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class TypeForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String typeCarID;
	private String typeCar;
	private String notify;
	private String notifyFail;

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
	
	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
