package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class QuestionFileDAO extends SqlSessionDaoSupport{
	
	public List<FileDB> selectAllMem() {
		return getSqlSession().selectList("fileDB.selectFile");
	}
	
	public int insert(FileDB fileDB){	
		
		return getSqlSession().insert("fileDB.addFile",fileDB);
	}
}
