package service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import command.BoardCommand;
import dao.QuestionDAO;

@Service("questionSevice")
public class QuestionServiceImple implements BoardService {

	@Resource(name="questionDAO")
	private QuestionDAO questionDAO;
	
	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}
	//전체글
	@Override
	public List<BoardCommand> selectBoardList(Map<String, Object> map) throws Exception {
		return questionDAO.selectBoardList(map);
	}
	//글내용
	@Override
	public BoardCommand selectboardContents(Map<String, Object> map, int num) throws Exception {
		questionDAO.selectCnt(num);
		return questionDAO.selectBoardContents(map);
	}

	//글 쓰기
	@Override
	public void insertBoard(BoardCommand boardCommand) throws Exception {
		questionDAO.insertBoard(boardCommand);		
	}
	
	//글 수정
	@Override
	public void updateBoard(BoardCommand boardCommand) throws Exception {
		questionDAO.updateBoard(boardCommand);
	}

	//글 삭제
	@Override
	public void deleteBoard(int num) throws Exception {
		questionDAO.deleteBoard(num);
	}
	
	


}
