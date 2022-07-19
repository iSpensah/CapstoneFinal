package dao.category;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcTemplateCategory 
{
	public JdbcTemplate getTemplate()
	{
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
		return temp;
	}

	public List<CategoryInfo> getAllCategory()
	{
		JdbcTemplate temp = getTemplate();
		List<CategoryInfo> list = temp.query("Select * from ctgry_tbl order by categoryId asc",new CategoryMapper());
		
		return list;
		
	}
	
	public void addNewCategory(int categoryId,String categoryName,String categoryDesc)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("insert into ctgry_tbl values(?,?,?)",new Object[] {categoryId, categoryName, categoryDesc});
	}
	
	public int getNewCategoryId()
	{
		JdbcTemplate temp = getTemplate();	
		Integer newCategoryId = temp.queryForObject("select max(categoryId) + 1 from ctgry_tbl", Integer.class);
		return newCategoryId;
	}
	
	public void updateCategory(int categoryId,String categoryName, String categoryDesc)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("update ctgry_tbl set categoryName = ?, categoryDesc=? where categoryId =?",new Object[] {categoryName,categoryDesc,categoryId});
		
		System.out.println("asdasd");
	}
	
	public CategoryInfo searchCategory(int categoryId)
	{
		JdbcTemplate temp = getTemplate();	
		CategoryInfo category = temp.queryForObject("Select * from ctgry_tbl where categoryId = ?",
											new Object [] {categoryId},new CategoryMapper());
		return category;
	}
	
	public void deleteCategory(int categoryId)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("delete from ctgry_tbl where categoryId =?",new Object[] {categoryId});

	}
	
	public static void main(String s[])
	{
		JdbcTemplateCategory obj = new JdbcTemplateCategory();
		Scanner sc = new Scanner(System.in);
		
		obj.updateCategory(sc.nextInt(),sc.next(),sc.next());
		obj.getAllCategory();
		
	}
}


