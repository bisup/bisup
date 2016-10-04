package command;

import java.sql.Timestamp;

//���ǻ��װԽ���
public class BoardCommand {

	private int num; //�۹�ȣ
	private String writer;//�ۼ���
	private String title;//����
	private String contents;//����
	private int cnt;//��ȸ��
	private Timestamp reg;//�ۼ���
	private String pw;
	
	public BoardCommand(){}
	
	public BoardCommand(int num, String writer, String title, String contents, int cnt, Timestamp reg, String pw) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.cnt = cnt;
		this.reg = reg;
		this.pw = pw;
	}


	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
	
}