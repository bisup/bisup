package command;

public class GuCommand {

	private int gcode; //���ڵ�
	private String gn; //���̸�
	private int cd; //���ڵ庰 ����
	private int dcode; //���ڵ�
	private String dn; //���ڵ�
	private String newstore; //������ǥ	
	private int penf;  //3�� �� ���� ��� ����Ű���	
	private int arg; 	//��� ����Ⱓ
	private int jumpol; 	 //����������
	private int dang_num; //�ű�_â��_����_����_��

	
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
