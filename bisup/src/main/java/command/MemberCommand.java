package command;
//ȸ������
public class MemberCommand {

	private String id;//���̵�
	private String name;//�̸�
	private String pw;//��й�ȣ
	private String nick;//�г���
	private int sort;//ȸ������
	private int snum;//����ڹ�ȣ
	private String phone;//��ȭ��ȣ
	private String tel;//���Թ�ȣ
	private String reg;//������       
	private String email;
	private int cer; //��������
	
	public int getCer() {
		return cer;
	}
	public void setCer(int cer) {
		this.cer = cer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {   
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	
	
}
