package dao;


import org.mybatis.spring.support.SqlSessionDaoSupport;

public class TrendDAO extends SqlSessionDaoSupport{
	
	public int list(String item){
		int selectsales=0 ;
		System.out.println(item); // �Ƹ޸�ī��
		selectsales = getSqlSession().selectOne("trend.list", item);
		return selectsales;
}

}
 