package dao.adminlogin;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;



public class JdbcTemplateAdmin 
{
	public JdbcTemplate getTemplate()
	{
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
		return temp;
	}
	
	
	
	public List<AdminInfo> getAllAdmin()
	{
	
		JdbcTemplate temp = getTemplate();	
		
		List<AdminInfo> log = temp.query("Select * from admin_tbl", new AdminMapper());
		
		
		return log;  
	}
	
	/*
	 * public boolean isUserValid(String email, String password) { List<Login> list
	 * = getAllUsers(email, password);
	 * 
	 * if (list.getEmail() == email) {
	 * 
	 * 
	 * return true; } return false; }
	 */
}


