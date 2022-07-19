package dao.viewaddbuyproduct;

public class ViewCart {

	private int cartid;
	private int userid;
	private int productid;
	private String productname;
	private int quantity;
	private int pprice;
	private String companyName;
	private int QOH;
	private String ImageDashboard;

	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getcompanyName() {
		return companyName;
	}
	public void setcompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getQOH() {
		return QOH;
	}
	public void setQOH(int qOH) {
		QOH = qOH;
	}
	public String getImageDashboard() {
		return ImageDashboard;
	}
	public void setImageDashboard(String imageDashboard) {
		ImageDashboard = imageDashboard;
	}
	
	
}
