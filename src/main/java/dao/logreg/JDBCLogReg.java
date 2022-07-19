package dao.logreg;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class JDBCLogReg {
	
	//

	public JdbcTemplate getTemplate()
	{
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
		return temp;
	}
	
	//Selecting all rows from User Table
	public List<LogReg> login() {
		
		JdbcTemplate temp = getTemplate();	
		
		List<LogReg> log = temp.query("Select * from user_tbl",new LogRegMapper());
		
		return log;
    }
	
	
	public LogReg login(String email, String password) {
		LogReg log = null;
		JdbcTemplate temp = getTemplate();	
		log = temp.queryForObject("select * from user_tbl where email = ? and userpass = ?", new Object[] {email, password} , new LogRegMapper());
		return log;
	}
	
	//Generating new User ID
	public int getNewUserID()
	{
		JdbcTemplate temp = getTemplate();	
		Integer newuid = temp.queryForObject("select max(userid) + 1 from user_tbl",Integer.class);
		return newuid;
	}

	//Inserting new user after register
	public void insertNewUser (int userid, String firstname, String lastname, String email, String userpass, String gender, String address, String phonenumber)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("insert into user_tbl values(?,?,?,?,?,?,?,?)",new Object[] {userid, firstname, lastname, email, userpass, gender, address, phonenumber});
	}
	
	public static void main (String[] args ) {
		
		JDBCLogReg log = new JDBCLogReg();		
		System.out.println("Enter User and Password");
		
			LogReg User = log.login("ReyMysterio@gmail.com","rmysterio");
			String user = User.getEmail().toString();	
			
			System.out.println(user +"ReyMysterio@gmail.com");
	}
}
