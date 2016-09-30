package controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mybatis.FileDB;
import mybatis.QuestionDAO;

@Controller
public class QuestionController {

	@Autowired
	private QuestionDAO dao;
	
	public void setNodao(QuestionDAO nodao) {
		this.dao = nodao;
	}
	
	@RequestMapping("/question/qlist.do")
	public String plist(){
		//System.out.println("���ǻ��� ����");
		return "qlist";
	}
	
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.GET)
	public String pwrite(){
		//System.out.println("���ǻ��� �۾���");
		return "qwrite";
	}
	
	@RequestMapping(value = "/question/qcontents.do", method = RequestMethod.GET)
	public String pcontents(){
		//System.out.println("���ǻ��� �� ���뺸��");
		return "qcontents";
	}
	
	
	@RequestMapping("/question/qpw.do")
	public String ppw(){
		//System.out.println("���ǻ��� ����Ȯ��");
		return "qpw";
	}
	
	
	//���� ���ε�
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.POST)
	public String submitReport1(@RequestParam("nnick") String studentNumber,
			@RequestParam("filename") MultipartFile filename) {
		upload(filename);
		return "qlist";
	}
	
	//���� ���ε�
	public void upload(MultipartFile report){
		String name = report.getOriginalFilename();
		long now = System.currentTimeMillis();
		String o_name = now + name;
		File new_file = new File("e:\\upload\\"+o_name);
		try{
			report.transferTo(new_file);
			FileDB fileDB = new FileDB(name,new_file.getPath(),report.getSize());
			dao.insert(fileDB);
			//���� �̸��� ������ �����ϸ� �����ѵ� ����
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
