package dao.viewaddbuyproduct;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class VABProductMapper implements RowMapper<VABProduct>{

	@Override
	public VABProduct mapRow(ResultSet result, int arg1) throws SQLException {
		
		
		VABProduct obj = new VABProduct();
		
		obj.setProductid(result.getInt(1));
		obj.setProductname(result.getString(2));
		obj.setPprice(result.getInt(3));
		obj.setCategoryid(result.getInt(4));
		obj.setCompanyname(result.getString(5));
		obj.setDateReleased(result.getString(6));	
		obj.setQOH(result.getInt(7));
		obj.setSalesNum(result.getInt(8));
		obj.setPdescription(result.getString(9));
		obj.setImagepath(result.getString(10));
		
		return obj;
	}
		
}