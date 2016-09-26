package command;

public class StoreCommand {

	private String var1;
	private boolean var2;
	private int var3;
	
	public StoreCommand() {
		// TODO Auto-generated constructor stub
	}
	
	public StoreCommand(String var1, int var3) {
		// TODO Auto-generated constructor stub
		this.var1 = var1;
		this.var3 = var3;
	}
	
	public String getVar1() {
		return var1;
	}
	public void setVar1(String var1) {
		this.var1 = var1;
	}
	public boolean isVar2() {
		return var2;
	}
	public void setVar2(boolean var2) {
		this.var2 = var2;
	}
	public int getVar3() {
		return var3;
	}
	public void setVar3(int var3) {
		this.var3 = var3;
	}

}
