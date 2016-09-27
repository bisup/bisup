package command;
//건의사항게시판
public class Prop_boardCommand {

	private int pnum; //글번호
	private String pnick;//작성자
	private String ptitle;//제목
	private String pcontent;//내용
	private int pcnt;//조회수
	private String preg;//작성일
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPnick() {
		return pnick;
	}
	public void setPnick(String pnick) {
		this.pnick = pnick;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public String getPreg() {
		return preg;
	}
	public void setPreg(String preg) {
		this.preg = preg;
	}
	
	
}
