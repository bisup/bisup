package command;

import java.util.List;

//�������
public class SaleCommand {

	private String id; //���̵�
	private String sdate; //�����
	private String item; //�޴��̸�
	private int ea; //����
	private String total; //�Ѹ���
	private int mon;//sdate ��Ʈ ���� ��Ī��
	private int tot;//total ��Ʈ �Ѹ��� ��Ī��
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