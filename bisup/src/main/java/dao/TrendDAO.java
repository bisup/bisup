package dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class TrendDAO extends SqlSessionDaoSupport{
	
	public int list(String item){
		int selectsales ;
		System.out.println(item); // �Ƹ޸�ī��
		selectsales = getSqlSession().selectOne("trend.list",item);
		System.out.println("qwe");
		return selectsales;
}

}
