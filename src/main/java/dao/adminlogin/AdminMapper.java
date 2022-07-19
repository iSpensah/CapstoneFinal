package dao.adminlogin;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;



public class AdminMapper implements RowMapper<AdminInfo> {
	
	
	@Override
	public AdminInfo mapRow(ResultSet result, int arg1) throws SQLException {
		
		AdminInfo adlog = new AdminInfo();
		
		adlog.setAdminid(result.getString(1));
		adlog.setAdminpass(result.getString(2));
		
		return adlog;
	}
	
}
