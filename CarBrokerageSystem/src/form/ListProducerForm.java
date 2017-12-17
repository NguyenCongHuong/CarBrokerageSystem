package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

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

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
