package command;

public class GuCommand {

	private int gcode;
	private String gn;
	private int cd; //구코드별 갯수
	
	//table admcd 
	private int dcode;
	private String dn;

	
	public int getCd() {
		return cd;
	}
	public void setCd(int cd) {
		this.cd = cd;
	}
	public int getGcode() {
		return gcode;
	}
	public void setGcode(int gcode) {
		this.gcode = gcode;
	}
	public String getGn() {
		return gn;
	}
	public void setGn(String gn) {
		this.gn = gn;
	}
	
	//table admcd 
	public int getDcode() {
		return dcode;
	}
	public void setDcode(int dcode) {
		this.dcode = dcode;
	}
	public String getDn() {
		return dn;
	}
	public void setDn(String dn) {
		this.dn = dn;
	}
	
	
	
	
}
