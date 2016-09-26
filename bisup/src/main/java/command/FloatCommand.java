package command;
//유동인구
public class FloatCommand {

	private int pop; //유동인구수
	private String gu;//행정구
	private String dong;//동
	private String yo;//조사요일
	private String tim;//시간대
	public int getPop() {
		return pop;
	}
	public void setPop(int pop) {
		this.pop = pop;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getYo() {
		return yo;
	}
	public void setYo(String yo) {
		this.yo = yo;
	}
	public String getTim() {
		return tim;
	}
	public void setTim(String tim) {
		this.tim = tim;
	}
	
	
}
