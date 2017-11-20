package model.bo;

import java.util.ArrayList;

import model.bean.Producer;
import model.dao.ProducerDAO;

public class ProducerBO {

	ProducerDAO producerDAO = new ProducerDAO();
	
	public ArrayList<Producer> getListProducer() {
		return producerDAO.getListProducer();
	}
	
	public void addProducer(String producerName) {
		producerDAO.addProducer(producerName);
	}
	
	public boolean checkProducerName(String producerName) {
		return producerDAO.checkProducerName(producerName);
	}
	
	public void deleteProducer (String producerID) {
		producerDAO.deleteProducer(producerID);
	}
	
	public void editProducer(String producerID, String producerName) {
		producerDAO.editProducer(producerID, producerName);
	}
}
