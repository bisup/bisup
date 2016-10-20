package service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import command.GuCommand;
import command.ReportedCommand;
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
		}catch(Exception e){
			System.out.println(e.toString());
		}     
		return list1;
	}
	
	public List listtotal1(String gucode){
		List list2 = null;
		try{
			list2 = trendDAO.getListtotal1(gucode);
		}catch(Exception e){
			System.out.println(e.toString());
		}     
		return list2;
	}
	
	public List listtotal2(String gucode){
		List list3 = null;
		try{
			list3= trendDAO.getListtotal2(gucode);
		}catch(Exception e){
			System.out.println(e.toString());
		}     
		return list3;
	}
	
	public List listtotal3(String gucode){
		List list4= null;
		try{
			list4 = trendDAO.getListtotal3(gucode);
		}catch(Exception e){
			System.out.println(e.toString());
		}     
		return list4;
	}
	public List<ReportedCommand> selectReportList(){
		List<ReportedCommand> list = null;
		      
		try{
			list = trendDAO.selectReportList();
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}
	
	public int insertReport(ReportedCommand rc){
		int check = 0;
		try{
			check = trendDAO.insertReport(rc);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return check;
		
	}
	
	public String listOne(String gucode){
		String one = null;
		try{
			one = trendDAO.listOne(gucode);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return one;
	}
	
	
	

}
