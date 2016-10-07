package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;

import command.BoardCommand;

public class NoticeDAO extends SqlSessionDaoSupport{
	
	//전체 글 리스트
		public List<BoardCommand> selectBoardList(Map<String, Object> map){
			return getSqlSession().selectList("notice.selectBoardList", map);
			}
		
		//글 내용 보기
	    public BoardCommand selectBoardContents(int num){
	    	return getSqlSession().selectOne("notice.selectboardContents", num);
	    }
	    
	    //글쓰기
	    public void insertBoard(BoardCommand bc){
	    	getSqlSession().insert("notice.insertBoard",bc);
	    }
	    
	    //글 수정
	    public void updateBoard(BoardCommand bc){
	    	getSqlSession().update("notice.updateBoard", bc);
	    }
	    
	    //글 삭제
	    public void deleteBoard(int num){
	    	getSqlSession().delete("notice.deleteBoard", num);
	    }

	    //글 조회수 증가
	    public int updateCnt(int num){
	    	return getSqlSession().update("notice.updateCnt",num);
	    }
	    
	    // 전체 글 개수
	 	public int allCnt(){
	 		return getSqlSession().selectOne("notice.allCnt");
	 		} 
	 	
	 	/*//글조회시 비밀번호 확인
	 	public String selectPW(int num){
	 		return getSqlSession().selectOne("board.selectPW",num);
	 	}*/
	
}
