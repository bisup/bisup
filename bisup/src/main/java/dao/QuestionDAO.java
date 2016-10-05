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

	//��ü �� ����Ʈ
	public List<BoardCommand> selectBoardList(Map<String, Object> map){
		return getSqlSession().selectList("board.selectBoardList", map);
		}
	
	//�� ���� ����
    public BoardCommand selectBoardContents(int num){
    	return getSqlSession().selectOne("board.selectboardContents", num);
    }
    
    //�۾���
    public void insertBoard(BoardCommand bc){
    	getSqlSession().insert("board.insertBoard",bc);
    }
    
    //�� ����
    public void updateBoard(BoardCommand bc){
    	getSqlSession().update("board.updateBoard", bc);
    }
    
    //�� ����
    public void deleteBoard(int num){
    	getSqlSession().delete("board.deleteBoard", num);
    }

    //�� ��ȸ�� ����
    public int updateCnt(int num){
    	return getSqlSession().update("board.updateCnt",num);
    }
    
    // ��ü �� ����
 	public int allCnt(){
 		return getSqlSession().selectOne("board.allCnt");
 		} 
 	
 	//����ȸ�� ��й�ȣ Ȯ��
 	public String selectPW(int num){
 		return getSqlSession().selectOne("board.selectPW",num);
 	}
}
