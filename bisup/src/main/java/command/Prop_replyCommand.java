package command;

//건의사항 댓글
public class Prop_replyCommand {

	private int pnum;//글번호
	private String id;//아이디
	private String rnick;//작성자
	private int rnum;//리플번호
	private String rcontent;//내용
	private String rreg;//작성일
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRnick() {
		return rnick;
	}
	public void setRnick(String rnick) {
		this.rnick = rnick;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRreg() {
		return rreg;
	}
	public void setRreg(String rreg) {
		this.rreg = rreg;
	}
	

}
