package command;
//매출관리
public class SaleCommand {

	private String id; //아이디
	private String sdate; //등록일
	private String item; //메뉴이름
	private int ea; //수량
	private String total; //총매출
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
	
	

}
