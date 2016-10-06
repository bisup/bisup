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
	
	public QuestionDAO getQuestionDAO() {
		return questionDAO;
	}
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
	public BoardCommand selectboardContents(int num) throws Exception {
		questionDAO.updateCnt(num);
		return questionDAO.selectBoardContents(num);
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
	
	 //글 조회수 증가
	@Override
	public void updateCnt(int num) {
		questionDAO.updateCnt(num);
	}
	
	//전체 글 갯수
	@Override
	public int allCnt() {
		return questionDAO.allCnt();
	}
	
	//본인확인 비밀번호 검색
	@Override
	public String selectPW(int num) {
		System.out.println("Implenum::" + num);
		return questionDAO.selectPW(num);
	}
	
	


}
