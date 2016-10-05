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
	//��ü��
	@Override
	public List<BoardCommand> selectBoardList(Map<String, Object> map) throws Exception {
		return questionDAO.selectBoardList(map);
	}
	//�۳���
	@Override
	public BoardCommand selectboardContents(int num) throws Exception {
		questionDAO.updateCnt(num);
		return questionDAO.selectBoardContents(num);
	}

	//�� ����
	@Override
	public void insertBoard(BoardCommand boardCommand) throws Exception {
		questionDAO.insertBoard(boardCommand);		
	}
	
	//�� ����
	@Override
	public void updateBoard(BoardCommand boardCommand) throws Exception {
		questionDAO.updateBoard(boardCommand);
	}

	//�� ����
	@Override
	public void deleteBoard(int num) throws Exception {
		questionDAO.deleteBoard(num);
	}
	
	 //�� ��ȸ�� ����
	@Override
	public void updateCnt(int num) {
		questionDAO.updateCnt(num);
	}
	
	//��ü �� ����
	@Override
	public int allCnt() {
		return questionDAO.allCnt();
	}
	
	//����Ȯ�� ��й�ȣ �˻�
	@Override
	public String selectPW(int num) {
		System.out.println("Implenum::" + num);
		return questionDAO.selectPW(num);
	}
	
	


}
