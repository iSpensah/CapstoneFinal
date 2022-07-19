package dao.viewaddbuyproduct;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ViewCartMapper implements RowMapper<ViewCart>{

	@Override
	public ViewCart mapRow(ResultSet result, int arg1) throws SQLException {
		
		
		ViewCart obj = new ViewCart();
		
		obj.setCartid(result.getInt(1));
		obj.setUserid(result.getInt(2));
		obj.setProductid(result.getInt(3));
		obj.setProductname(result.getString(8));
		obj.setQuantity(result.getInt(5));
		obj.setPprice(result.getInt(9));
		obj.setcompanyName(result.getString(11));
		obj.setQOH(result.getInt(13));
		obj.setImageDashboard(result.getString(16));
		
		return obj;
	}
		
}