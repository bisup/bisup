package dao;

import java.util.ArrayList;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class SaleChartAction extends SqlSessionDaoSupport {

	public ArrayList salePerMon(String id){
		ArrayList salePerMon = (ArrayList) getSqlSession().selectList("sales.salePerMon", id);
		return salePerMon;
	}
	
}