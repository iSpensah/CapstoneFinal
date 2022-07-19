package dao.coupon;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class CouponMapper implements RowMapper<CouponInfo> {

	@Override
	public CouponInfo mapRow(ResultSet result, int arg1) throws SQLException {
		
		CouponInfo obj = new CouponInfo();
		
		obj.setCid(result.getInt(1));
		obj.setCoupname(result.getString(2));
		obj.setCoupdesc(result.getString(3));
		obj.setEventame(result.getString(4));
		obj.setDiscount(result.getInt(5));
		

		
		
		
		return obj;
	}

}
