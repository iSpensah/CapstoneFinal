package dao.userdetails;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserDetailsMapper implements RowMapper<UserDetailsInfo>{

	@Override
	public UserDetailsInfo mapRow(ResultSet result, int arg1) throws SQLException {
		
		
		UserDetailsInfo obj = new UserDetailsInfo();
		
		obj.setUserid(result.getInt(1));
		obj.setFirstname(result.getString(2));
		obj.setLastname(result.getString(3));
		obj.setEmail(result.getString(4));
		obj.setUserpass(result.getString(5));
		obj.setGender(result.getString(6));
		obj.setAddress(result.getString(7));
		obj.setContact(result.getLong(8));
								
		return obj;
	}
	
}