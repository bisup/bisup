package command;

import java.sql.Timestamp;

public class CommantCommand {
	private int qnum;
	private int rpw;
	private String rwriter;
	private String rcontents;
	private Timestamp rreg;
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public int getRpw() {
		return rpw;
	}
	public void setRpw(int rpw) {
		this.rpw = rpw;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public String getRcontents() {
		return rcontents;
	}
	public void setRcontents(String rcontents) {
		this.rcontents = rcontents;
	}
	public Timestamp getRreg() {
		return rreg;
	}
	public void setRreg(Timestamp rreg) {
		this.rreg = rreg;
	}
	public CommantCommand(int qnum, int rpw, String rwriter, String rcontents, Timestamp rreg) {
		super();
		this.qnum = qnum;
		this.rpw = rpw;
		this.rwriter = rwriter;
		this.rcontents = rcontents;
		this.rreg = rreg;
	}
	public CommantCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
