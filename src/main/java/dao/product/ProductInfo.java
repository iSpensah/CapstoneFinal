package dao.product;

import java.util.Date;

public class ProductInfo {
	private int pid;
	private String pname;
	private int pprice;
	private int pcategory;
	private String pcompany;
	private Date pdateReleased;
	private int pstock;
	private int psalesNum;
	private String pdescription;
	private String categoryName;
	private String imageDashboard;
	private String imageProduct;
	private String imageIcon;

	public void displayProductInfo() {
		System.out.println(pid + "  " + pname + " " + pcategory + " " + pprice + " " + pcompany + " " + pstock);
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPcategory() {
		return pcategory;
	}

	public void setPcategory(int pcategory) {
		this.pcategory = pcategory;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public String getPcompany() {
		return pcompany;
	}

	public void setPcompany(String pcompany) {
		this.pcompany = pcompany;
	}

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public Date getPdateReleased() {
		return pdateReleased;
	}

	public void setPdateReleased(Date pdateReleased) {
		this.pdateReleased = pdateReleased;
	}

	public int getPsalesNum() {
		return psalesNum;
	}

	public void setPsalesNum(int psalesNum) {
		this.psalesNum = psalesNum;
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getImageDashboard() {
		return imageDashboard;
	}

	public void setImageDashboard(String imageDashboard) {
		this.imageDashboard = imageDashboard;
	}

	public String getImageProduct() {
		return imageProduct;
	}

	public void setImageProduct(String imageProduct) {
		this.imageProduct = imageProduct;
	}

	public String getImageIcon() {
		return imageIcon;
	}

	public void setImageIcon(String imageIcon) {
		this.imageIcon = imageIcon;
	}

}
