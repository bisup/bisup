package command;
//공지사항
public class NotifyCommand {

	private int nnum; //글번호
	private String nnick;//작성자
	private String ntitle;//제목
	private String ncontent;//내용
	private int ncnt;//조회수
	private String nreg;//작성일
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getNnick() {
		return nnick;
	}
	public void setNnick(String nnick) {
		this.nnick = nnick;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public int getNcnt() {
		return ncnt;
	}
	public void setNcnt(int ncnt) {
		this.ncnt = ncnt;
	}
	public String getNreg() {
		return nreg;
	}
	public void setNreg(String nreg) {
		this.nreg = nreg;
	}
	
	

}
