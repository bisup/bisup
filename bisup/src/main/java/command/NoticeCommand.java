package command;
//��������

import org.springframework.web.multipart.MultipartFile;

public class NoticeCommand {

	private int nnum; //�۹�ȣ
	private String nnick;//�ۼ���
	private String ntitle;//����
	private String ncontents;//����
	private int ncnt;//��ȸ��
	private String nreg;//�ۼ���
	private MultipartFile filename;
	
	public MultipartFile getFilename() {
		return filename;
	}
	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getNnick() {
		return nnick;
	}
	public void setNnick(String nnick) {
		this.nnick = nnick;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontents() {
		return ncontents;
	}
	public void setNcontents(String ncontents) {
		this.ncontents = ncontents;
	}
	public int getNcnt() {
		return ncnt;
	}
	public void setNcnt(int ncnt) {
		this.ncnt = ncnt;
	}
	public String getNreg() {
		return nreg;
	}
	public void setNreg(String nreg) {
		this.nreg = nreg;
	}
	
	

}
