package dao.product;

import java.util.List;
import java.util.Scanner;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import dao.category.CategoryInfoP;
import dao.category.CategoryMapperP;

public class JdbcTemplateProduct {
	public JdbcTemplate getTemplate() {
		// refers the spring-config.xml as context
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml"); //opens the spring container 
		// gets the <beans> of the context/spring-config.xml to access or sync the
		// database
		JdbcTemplate temp = (JdbcTemplate) context.getBean("tmp");
		return temp;
	}

	public List<ProductInfo> displayAllProduct() {
		JdbcTemplate temp = getTemplate();
		List<ProductInfo> displayList = temp.query(
				"Select * from product_tbl p inner join ctgry_tbl c on p.categoryid = c.categoryid order by qoh asc",
				new ProductMapper());

		return displayList;
	}

	public int getNewProductID() {
		// gets the <beans> of the context/spring-config.xml to access or sync the
		// database
		JdbcTemplate temp = getTemplate();

		Integer newpid = temp.queryForObject("select max(productID) + 1 from product_tbl", Integer.class);
		return newpid;
	}

	public List<ProductInfo> getAllProduct() {
		JdbcTemplate temp = getTemplate();
		List<ProductInfo> list = temp.query(
				"Select * from product_tbl p inner join ctgry_tbl c on p.categoryid = c.categoryid",
				new ProductMapper());

		return list;
		// for(CustomerInfo customer : list)
		// customer.displayCustomerInfo();
	}

	public List<ProductInfo> getAllProduct(String pcategory) {
		JdbcTemplate temp = getTemplate();
		List<CategoryInfoP> listC = temp.query("Select * from ctgry_tbl where categoryName=?",
				new Object[] { pcategory }, new CategoryMapperP());

		List<ProductInfo> list = temp.query(
				"Select * from product_tbl p inner join ctgry_tbl c on p.categoryid = c.categoryid where p.categoryID=?",
				new Object[] { listC.get(0).getCategoryID() }, new ProductMapper());
		return list;
	}

//------------------------- insert, delete, update
	public void insertNewProduct(int pid, String pname, int pprice, int pcategory, String pcompany,
			Date pdateReleased, int pstock, int psalesNum, String pdescription, String imageDashboard, String imageProduct, String imageIcon) {
		JdbcTemplate temp = getTemplate();
		temp.update("insert into product_tbl values(?,?,?,?,?,?,?,?,?,?,?,?)",
				new Object[] { pid, pname, pprice, pcategory, pcompany, pdateReleased, pstock, psalesNum,
						pdescription, imageDashboard, imageProduct, imageIcon});
	}

	public void updateProduct(int pid, String pname, int pcategory, int pprice, String pcompany, Date pdateReleased,
			int pstock, int psalesNum, String pdescription, String imageDashboard, String imageProduct, String imageIcon) {
		JdbcTemplate temp = getTemplate();
		temp.update(
				"update product_tbl set productname = ?, categoryid = ?, pprice = ?, companyname = ?, datereleased = ?, QOH = ?, salesNum = ?, pdescription = ?, imageDashboard = ?, imageProduct = ?, imageIcon = ?   where productid = ?",
				new Object[] { pname, pcategory, pprice, pcompany, pdateReleased, pstock, psalesNum, pdescription, imageDashboard,imageProduct, imageIcon,
						pid });

	}

	public void deleteProduct(int pid) {
		JdbcTemplate temp = getTemplate();
		temp.update("delete from product_tbl where productid =?", new Object[] { pid });
	}

	public ProductInfo searchProduct(int pid) {

		JdbcTemplate temp = getTemplate();
		ProductInfo product = temp.queryForObject(
				"Select * from product_tbl p inner join ctgry_tbl c on p.categoryid = c.categoryid where productID = ?",
				new Object[] { pid }, new ProductMapper());
		return product;
	}
//-----------------------------------
	
	public Integer countTotalProducts() {
		JdbcTemplate temp = getTemplate();
		Integer totalproducts = temp.queryForObject("select count(*) as totalproducts from product_tbl ",
				Integer.class);

		return totalproducts;
	}

	public void countTotalProduct() {
		JdbcTemplate temp = getTemplate();
		Integer totalproducts = temp.queryForObject("select count(*) from product_tbl", Integer.class);

		System.out.println("Total products : " + totalproducts);
	}

	public static void main(String s[]) {
		JdbcTemplateProduct obj = new JdbcTemplateProduct();
		Scanner sc = new Scanner(System.in);

		// System.out.println(obj.getNewProductID());
		List<ProductInfo>  list  = obj.getAllProduct();
		System.out.println("Total Records "  +list.size());
		
		for (int i =0; i<list.size(); i++)
		System.out.println(list.get(i).getPname() + list.get(i).getPcategory());
		}
}
