package dao.viewaddbuyproduct;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CouponMapper implements RowMapper<CouponInfo>{

	@Override
	public CouponInfo mapRow(ResultSet result, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		CouponInfo coupon = new CouponInfo();
		coupon.setCid(result.getInt(1));	
		coupon.setCoupname(result.getString(2));
		coupon.setCoupdesc(result.getString(3));
		coupon.setPid(result.getInt(4));
		coupon.setDiscount(result.getInt(5));
		coupon.setEventname(result.getString(7));
		coupon.setEventstartdate(result.getString(8));
		coupon.setEventenddate(result.getString(9));
		
		return coupon;
	}

}
