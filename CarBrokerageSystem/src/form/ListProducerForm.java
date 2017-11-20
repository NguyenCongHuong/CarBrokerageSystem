package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Producer;

public class ListProducerForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private ArrayList<Producer> listProducer;

	public ArrayList<Producer> getListProducer() {
		return listProducer;
	}

	public void setListProducer(ArrayList<Producer> listProducer) {
		this.listProducer = listProducer;
	}

}
