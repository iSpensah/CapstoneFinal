package dao.category;

public class CategoryInfo {
	
	private int categoryId;
	private String categoryName;
	private String categoryDesc;
	
	public void displayCategoryInfo()
	{
		System.out.println(categoryId + "  " + categoryName + " " + categoryDesc);
	}
	
	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDesc() {
		return categoryDesc;
	}

	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	
}
