package dao.category;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcTemplateCategoryP 
{
	public JdbcTemplate getTemplate()
	{
		//refers the spring-config.xml as context
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		//gets the <beans> of the context/spring-config.xml to access or sync the database 
		JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
		return temp;
	}

	public int getNewCategoryID()
	{
		//gets the <beans> of the context/spring-config.xml to access or sync the database
		JdbcTemplate temp = getTemplate();		
		Integer newpid = temp.queryForObject("select max(CategoryID) + 1 from ctgry_tbl",Integer.class);
		return newpid;
	}
//	
	public List<CategoryInfoP> getAllCategory()
	{
		JdbcTemplate temp = getTemplate();
		List<CategoryInfoP> listC = temp.query("Select * from ctgry_tbl",new CategoryMapperP());	
		return listC;
	}
	
// for Sorting  XXXXXXX
	public List<String> getAllCategoryName()
	{
		JdbcTemplate temp = getTemplate();
		List<String> list = temp.queryForList("Select categoryName from ctgry_tbl", String.class);
		return list;
	}
//	
	
//------------------------- insert, delete, update
//	public void insertNewCategory(int pid,String pname,int pprice, int pcategory, String pcompany, String pdateReleased, int pstock, int psalesNum, String pdescription, String pimage)
//	{
//		JdbcTemplate temp = getTemplate();	
//		temp.update("insert into Category_tbl values(?,?,?,?,?,(TO_DATE(?, 'yyyy/mm/dd hh24:mi:ss')),?,?,?,?)",new Object[] {pid, pname, pprice, pcategory, pcompany, pdateReleased, pstock, psalesNum, pdescription, pimage});
//	}
//	
//	public void updateCategory(int cid,int cbalance)
//	{
//		JdbcTemplate temp = getTemplate();	
//		temp.update("update customerInfo set caccbalance = ? where cid =?",new Object[] {cbalance,cid});
//	}
//	public void deleteCategory(int cid)
//	{
//		JdbcTemplate temp = getTemplate();	
//		temp.update("delete from customerinfo where cid =?",new Object[] {cid});
//	}	
//	
//	public void searchCategory(int pid)
//	{
//
//			JdbcTemplate temp = getTemplate();	
//			CategoryInfo Category = temp.queryForObject("Select * from Category_tbl where CategoryID = ?",
//											new Object [] {pid},new CategoryMapper());
//			Category.displayCategoryInfo();
//	}
//-----------------------------------
	
	public void countTotalCategory()
	{
		JdbcTemplate temp = getTemplate();
		Integer totalCategory = temp.queryForObject("select count(*) from Category_tbl",Integer.class);
		
		System.out.println("Total Categorory : " + totalCategory);
	}
	
	
	public static void main(String s[])
	{
		JdbcTemplateCategoryP obj = new JdbcTemplateCategoryP();
		Scanner sc = new Scanner(System.in);
			
		System.out.println(obj.getNewCategoryID());
	}

}


