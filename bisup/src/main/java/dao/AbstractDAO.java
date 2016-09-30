package dao;


//지금 안쓰는 DAO지만 삭제하지 마세요 -미래-
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public Object insert(String queryId, Object params){
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId, Object params){
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId, Object params){
		return sqlSession.delete(queryId, params);
	}
	
	public Object selectOne(String queryId){
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params){
		return sqlSession.selectOne(queryId, params);
	}
	
	public List selectList(String queryId){
		return sqlSession.selectList(queryId);
	}
	
	public List selectList(String queryId, Object params){
		return sqlSession.selectList(queryId,params);
	}
	
	//글 조회수
	public int updateCnt(String queryId, Object params){
		return sqlSession.update(queryId,params);
	}
	
	//전체 글 갯수
	public int allCnt(String queryId, Object params){
		return sqlSession.selectOne(queryId, params);
	}
}
