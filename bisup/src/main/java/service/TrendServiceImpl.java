package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.TrendDAO;

public class TrendServiceImpl implements TrendService{
	
	@Autowired
	private TrendDAO dao1;
	public void setDao1(TrendDAO dao1) {
		this.dao1 = dao1;
	}


	public List<String> listgu(){
		List<String> list = null;
		
		try{
			list = dao1.getListgu("trend.concerting");
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}

}
