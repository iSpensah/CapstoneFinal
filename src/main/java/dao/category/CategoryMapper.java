package dao.category;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CategoryMapper implements RowMapper<CategoryInfo>{

	@Override
	public CategoryInfo mapRow(ResultSet result, int arg1) throws SQLException {
		
		
		CategoryInfo obj = new CategoryInfo();
		
		obj.setCategoryId(result.getInt(1));
		obj.setCategoryName(result.getString(2));
		obj.setCategoryDesc(result.getString(3));
		
		return obj;
	}

	
	
}