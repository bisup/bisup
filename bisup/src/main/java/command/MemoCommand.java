package command;

import java.util.Set;

public class MemoCommand {

	private String send;
	private String sub;
	private String mtitle;
	private String mcontent;
	private String mreg;
	
	private Set<MemoCommand> connections=null;
	
	public MemoCommand() {
		// TODO Auto-generated constructor stub
	}
	
	public MemoCommand(String send, String mtitle) {
		// TODO Auto-generated constructor stub
		this.send = send;
		this.mtitle = mtitle;
	}
	
	public MemoCommand(Set<MemoCommand> connections){
		this.connections = connections;
	}

	public String getSend() {
		return send;
	}

	public void setSend(String send) {
		this.send = send;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getMtitle() {
		return mtitle;
	}

	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public String getMreg() {
		return mreg;
	}

	public void setMreg(String mreg) {
		this.mreg = mreg;
	}


	public Set<MemoCommand> getConnections() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
