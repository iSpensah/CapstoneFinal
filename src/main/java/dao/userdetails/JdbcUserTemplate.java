package dao.userdetails;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcUserTemplate 
{
	public JdbcTemplate getTemplate()
	{
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
		return temp;
	}

	//Selecting User Information from User Table
	public List<UserDetailsInfo> getAllUserDetails(int userid)
	{
		JdbcTemplate temp = getTemplate();
		List<UserDetailsInfo> list = temp.query("Select * from user_tbl where userid = ?", new Object[] {userid}, new UserDetailsMapper());
		System.out.println(list.size());
		return list;
		//for(CustomerInfo customer : list)
		//	customer.displayCustomerInfo();
		
	}
	
	//Update Password
	public void updatePassword(String newpass, int userid)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("update user_tbl set userpass = ? where userid = ?", new Object[] {newpass, userid});
		
	}
	
	//Getting old password
	public String getPassword(int userid) {
		JdbcTemplate temp = getTemplate();
		UserDetailsInfo getPassword = temp.queryForObject("select * from user_tbl where userid = ?", new Object [] {userid},new UserDetailsMapper());
		return getPassword.getUserpass();
	}	
	
	
	public void countTotalUserDetails()
	{
		JdbcTemplate temp = getTemplate();
		Integer totalUserDetails = temp.queryForObject("select count(*) from user_tbl",Integer.class);
		
		System.out.println("Total UserDetails : " + totalUserDetails);
	}
	
}


