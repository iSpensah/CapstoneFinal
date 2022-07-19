package dao.coupon;

public class CouponInfo {
	
	
	
		private int cid;
		private String coupname;
		private String coupdesc;
		private int pid;
		private int discount;
		private String eventname;
		private int categoryID;
		
		public String getEventname() {
			return eventname;
		}


		public void setEventame(String eventname) {
			this.eventname = eventname;
		}
	
		
		public void displayCouponInfo()
		{
			System.out.println(cid + "  " + coupname + " " + coupdesc + " " + pid + " " + discount + " " + categoryID);
		}
		
		
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
					
			
}

