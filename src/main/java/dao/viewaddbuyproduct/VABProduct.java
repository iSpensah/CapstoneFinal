package dao.viewaddbuyproduct;

public class VABProduct {
	
	private int productid;
	private String productname;
	private int pprice;
	private int categoryid;
	private String companyname;
	private String dateReleased;
	private int QOH;
	private int salesNum;
	private String pdescription;
	private String imagepath;
	

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


	public int getPprice() {
		return pprice;
	}


	public void setPprice(int pprice) {
		this.pprice = pprice;
	}


	public int getCategoryid() {
		return categoryid;
	}


	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}


	public String getCompanyname() {
		return companyname;
	}


	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}


	public String getDateReleased() {
		return dateReleased;
	}


	public void setDateReleased(String dateReleased) {
		this.dateReleased = dateReleased;
	}


	public int getQOH() {
		return QOH;
	}


	public void setQOH(int qOH) {
		QOH = qOH;
	}


	public int getSalesNum() {
		return salesNum;
	}


	public void setSalesNum(int salesNum) {
		this.salesNum = salesNum;
	}


	public String getPdescription() {
		return pdescription;
	}


	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}


	public String getImagepath() {
		return imagepath;
	}


	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}


	public void display()
	{
		System.out.println(productid + "  " + productname);
	}
	
	
}
