package model;

public class AccountDTO {
	private String account_no;
	private String cust_id;
	private String prd_type;
	private String prd_detail;
	
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getPrd_type() {
		return prd_type;
	}
	public void setPrd_type(String prd_type) {
		this.prd_type = prd_type;
	}
	public String getPrd_detail() {
		return prd_detail;
	}
	public void setPrd_detail(String prd_detail) {
		this.prd_detail = prd_detail;
	}
	
}
