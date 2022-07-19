package dao.category;

public class CategoryInfoP {
	private int categoryID;
	private String categoryName;
	private String categroyDesc;

	
	
	public void displayCategoryInfo()
	{
		System.out.println(categoryID + categoryName + categroyDesc);
	}


	public int getCategoryID() {
		return categoryID;
	}



	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	public String getCategroyDesc() {
		return categroyDesc;
	}



	public void setCategroyDesc(String categroyDesc) {
		this.categroyDesc = categroyDesc;
	}

}