package command;

import java.sql.Timestamp;

//건의사항게시판
public class BoardCommand {

	private int num; //글번호
	private String write;//작성자
	private String title;//제목
	private String contents;//내용
	private int cnt;//조회수
	private Timestamp reg;//작성일
	private String pw;
	
	public BoardCommand(){}
	
	public BoardCommand(int num, String write, String title, String contents, int cnt, Timestamp reg, String pw) {
		super();
		this.num = num;
		this.write = write;
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
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
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
