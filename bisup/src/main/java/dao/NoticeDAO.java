package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;

import command.BoardCommand;

public class NoticeDAO extends SqlSessionDaoSupport{
	
	//��ü �� ����Ʈ
		public List<BoardCommand> selectBoardList(Map<String, Object> map){
			return getSqlSession().selectList("notice.selectBoardList", map);
			}
		
		//�� ���� ����
	    public BoardCommand selectBoardContents(int num){
	    	return getSqlSession().selectOne("notice.selectboardContents", num);
	    }
	    
	    //�۾���
	    public void insertBoard(BoardCommand bc){
	    	getSqlSession().insert("notice.insertBoard",bc);
	    }
	    
	    //�� ����
	    public void updateBoard(BoardCommand bc){
	    	getSqlSession().update("notice.updateBoard", bc);
	    }
	    
	    //�� ����
	    public void deleteBoard(int num){
	    	getSqlSession().delete("notice.deleteBoard", num);
	    }

	    //�� ��ȸ�� ����
	    public int updateCnt(int num){
	    	return getSqlSession().update("notice.updateCnt",num);
	    }
	    
	    // ��ü �� ����
	 	public int allCnt(){
	 		return getSqlSession().selectOne("notice.allCnt");
	 		} 
	 	
	 	/*//����ȸ�� ��й�ȣ Ȯ��
	 	public String selectPW(int num){
	 		return getSqlSession().selectOne("board.selectPW",num);
	 	}*/
	
}
