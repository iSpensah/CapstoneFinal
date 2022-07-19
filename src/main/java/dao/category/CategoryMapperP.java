package dao.category;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CategoryMapperP implements RowMapper<CategoryInfoP>{

	@Override
	public CategoryInfoP mapRow(ResultSet result, int arg1) throws SQLException {
		
		CategoryInfoP obj = new CategoryInfoP();
		
		obj.setCategoryID(result.getInt(1));
		obj.setCategoryName(result.getString(2));
		obj.setCategroyDesc(result.getString(3));


		return obj;
	}

	
	
}