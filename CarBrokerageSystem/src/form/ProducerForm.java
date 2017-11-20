package form;

import org.apache.struts.action.ActionForm;

public class ProducerForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String producerName;
	private String notify;
	private String notifyFail;
	private String producerID;

	public String getProducerID() {
		return producerID;
	}

	public void setProducerID(String producerID) {
		this.producerID = producerID;
	}

	public String getNotifyFail() {
		return notifyFail;
	}

	public void setNotifyFail(String notifyFail) {
		this.notifyFail = notifyFail;
	}

	public String getNotify() {
		return notify;
	}

	public void setNotify(String notify) {
		this.notify = notify;
	}

	public String getProducerName() {
		return producerName;
	}

	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}

}
