package dao.logreg;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class LogRegMapper implements RowMapper<LogReg>{
	
	@Override
	public LogReg mapRow(ResultSet result, int arg1) throws SQLException{
		
		LogReg obj = new LogReg();
		
		obj.setUserid(result.getInt(1));
		obj.setEmail(result.getString(4));
		obj.setPassword(result.getString(5));
		
		return obj;
	}

}
