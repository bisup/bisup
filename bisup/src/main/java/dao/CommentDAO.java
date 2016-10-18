package dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import command.CommantCommand;
@Repository
public class CommentDAO extends SqlSessionDaoSupport {

    public List<CommantCommand> getList(int qnum) {
          return getSqlSession().selectList("comment.select", qnum);
    }

    public int insertC(CommantCommand cc) {
    	return getSqlSession().insert("comment.insert", cc);
    }

    public void deleteCmt(CommantCommand cc) {
    	getSqlSession().delete("comment.delete", cc);
    }

}
