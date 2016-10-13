package command;

public class GuCommand {

	private int gcode; //구코드
	private String gn; //구이름
	private int cd; //구코드별 갯수
	private int dcode; //동코드
	private String dn; //행코드
	private String newstore; //위험지표	
	private int penf;  //3년 간 개업 대비 폐업신고율	
	private int arg; 	//평균 폐업기간
	private int jumpol; 	 //점포증감률
	private int dang_num; //신규_창업_위험_지수_값

	
	public String getNewstore() {
		return newstore;
	}
	public void setNewstore(String newstore) {
		this.newstore = newstore;
	}
	public int getPenf() {
		return penf;
	}
	public void setPenf(int penf) {
		this.penf = penf;
	}
	public int getArg() {
		return arg;
	}
	public void setArg(int arg) {
		this.arg = arg;
	}
	public int getJumpol() {
		return jumpol;
	}
	public void setJumpol(int jumpol) {
		this.jumpol = jumpol;
	}
	public int getDang_num() {
		return dang_num;
	}
	public void setDang_num(int dang_num) {
		this.dang_num = dang_num;
	}
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
