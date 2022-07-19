package dao.showallproduct;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

public class ProductJdbcTemplate {
	public JdbcTemplate getTemplate() {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate) context.getBean("tmp");
		return temp;
	}

	//Selecting all data in Product Table
	public List<ProductInfo> getAllProducts() {
		JdbcTemplate temp = getTemplate();
		List<ProductInfo> list = temp.query("Select * from product_tbl p inner join ctgry_tbl c on  p.categoryid = c.categoryid where QOH >= 1 order by dateReleased desc", new ProductMapper());

		return list;

	}
	
	//Selecting one data in Product Table
	public ProductInfo viewProduct(int productid) {
		JdbcTemplate temp = getTemplate();
		
		ProductInfo product = temp.queryForObject("Select * from product_tbl p inner join ctgry_tbl c on  p.categoryid = c.categoryid  where productid = ?",
				new Object [] {productid},new ProductMapper());
		
		return product;
	}

	//Selecting all unique Category ID
	public List<Integer> getAllCategoryId() {
		JdbcTemplate temp = getTemplate();
		List<Integer> list = temp.queryForList("Select unique(categoryid) from product_tbl", Integer.class);
		return list;
	}

	//Listing products after filtering
	public List<ProductInfo> getAllProducts(String filter) {
		JdbcTemplate temp = getTemplate();
		List<ProductInfo> list = temp.query("Select * from product_tbl p join ctgry_tbl c on p.categoryid = c.categoryid where c.categoryname in (" + filter + ")",
				new ProductMapper());
		return list;
	}

	//Listing products after filtering
	public List<ProductInfo> getAllProductCat(String categoryname) {
		JdbcTemplate temp = getTemplate();
		List<ProductInfo> list = temp.query(
				"Select * from product_tbl p join ctgry_tbl c on p.categoryid = c.categoryid where c.categoryname=?",
				new Object[] { categoryname }, new ProductMapper());
		return list;
	}

	//Selecting all Category from Product Table
	public List<String> getAllCategories() {
		JdbcTemplate temp = getTemplate();
		List<String> list = temp.queryForList(
				"Select unique(c.categoryname) from product_tbl p join ctgry_tbl c on p.categoryid = c.categoryid",
				String.class);
		return list;
	}
	
	public static void main(String s[]) {

	}
}