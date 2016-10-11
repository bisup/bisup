package service;

import java.util.List;
import java.util.Map;

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
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}
	
	public List listtotal(String gucode){
		List list1 = null;
		
		try{
			list1 = trendDAO.getListtotal(gucode);
			System.out.println(gucode);
		}catch(Exception e){
			System.out.println(e.toString());
		}     
		
		return list1;
	}

}
