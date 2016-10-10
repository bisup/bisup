package command;

import java.util.List;

//매출관리
public class SaleCommand {

	private String id; //아이디
	private String sdate; //등록일
	private String item; //메뉴이름
	private int ea; //수량
	private String total; //총매출
	private int mon;//sdate 차트 월별 별칭임
	private int tot;//total 차트 총매출 별칭임
	public SaleCommand() {
    }
	
	public String getId() {		
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public int getMon() {
		return mon;
	}
	public void setMon(int mon) {
		this.mon = mon;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}	

}