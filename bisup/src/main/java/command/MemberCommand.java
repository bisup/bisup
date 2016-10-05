package command;
//회원정보
public class MemberCommand {

	private String id;//아이디
	private String name;//이름
	private String pw;//비밀번호
	private String nick;//닉네임
	private int sort;//회원구분
	private int snum;//사업자번호
	private String phone;//전화번호
	private String tel;//가게번호
	private String reg;//가입일       
	private String email;
	private int cer; //인증여부
	
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
