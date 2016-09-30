package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import command.BoardCommand;

@Repository("questionDAO")
public class QuestionDAO extends SqlSessionDaoSupport {

	//전체 글 리스트
	public List<BoardCommand> selectBoardList(Map<String, Object> map){
		return getSqlSession().selectList("board.selectBoardList", map);
		}
	
	//글 내용 보기
    public BoardCommand selectBoardContents(Map<String, Object> map){
    	return getSqlSession().selectOne("board.selectBoardContents", map);
    }
    
    //글쓰기
    public void insertBoard(BoardCommand bc){
    	getSqlSession().insert("board.insertBoard",bc);
    }
    
    //글 수정
    public void updateBoard(BoardCommand bc){
    	getSqlSession().update("board.updateBoard", bc);
    }
    
    //글 삭제
    public void deleteBoard(int num){
    	getSqlSession().delete("board.deleteBoard", num);
    }

    //글 조회수
    public int selectCnt(int cnt){
    	return getSqlSession().update("board.selectCnt",cnt);
    }
    
    // 게시글 수
 	public int allCnt(Map<String, Object> map)throws DataAccessException{
 		return getSqlSession().selectOne("board.allCnt", map);
 		} 
}
