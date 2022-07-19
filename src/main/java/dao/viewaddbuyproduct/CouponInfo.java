package dao.viewaddbuyproduct;

public class CouponInfo {
	
	private int cid;
	private String coupname;
	private String coupdesc;
	private int pid;
	private int discount;	
	private int categoryid;
	private String eventname;
	private String eventstartdate;
	private String eventenddate;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCoupname() {
		return coupname;
	}
	public void setCoupname(String coupname) {
		this.coupname = coupname;
	}
	public String getCoupdesc() {
		return coupdesc;
	}
	public void setCoupdesc(String coupdesc) {
		this.coupdesc = coupdesc;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getEventname() {
		return eventname;
	}
	public void setEventname(String eventname) {
		this.eventname = eventname;
	}
	public String getEventstartdate() {
		return eventstartdate;
	}
	public void setEventstartdate(String eventstartdate) {
		this.eventstartdate = eventstartdate;
	}
	public String getEventenddate() {
		return eventenddate;
	}
	public void setEventenddate(String eventenddate) {
		this.eventenddate = eventenddate;
	}

}
