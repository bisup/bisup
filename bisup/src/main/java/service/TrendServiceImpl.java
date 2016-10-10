package service;

import java.util.List;

import javax.annotation.Resource;

import command.GuCommand;
import dao.TrendDAO;

public class TrendServiceImpl implements TrendService{
	
	@Resource(name="trendDAO")
	private TrendDAO trendDAO;
	
	public TrendDAO getTrendDAO() {
		return trendDAO;
	}

	public void setTrendDAO(TrendDAO trendDAO) {
		this.trendDAO = trendDAO;
	}



	public List<GuCommand> listgu(){
		List<GuCommand> list = null;
		
		try{
			list = trendDAO.getListgu();
			System.out.println(list.size());
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}

}
