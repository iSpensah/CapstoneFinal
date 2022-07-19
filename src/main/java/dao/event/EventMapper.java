package dao.event;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class EventMapper implements RowMapper<EventInfo>{

	@Override
	public EventInfo mapRow(ResultSet result, int arg1) throws SQLException {
		
		
		EventInfo obj = new EventInfo();
		
		
		
		obj.setPid(result.getInt(1));
		obj.setEventname(result.getString(2));
		obj.setEventstartdate(result.getDate(3));
		obj.setEventenddate(result.getDate(4));
		obj.setEventdesc(result.getString(5));
		
		return obj;
	}

	
	
}