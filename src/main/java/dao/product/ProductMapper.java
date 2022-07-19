package dao.product;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProductMapper implements RowMapper<ProductInfo>{

	@Override
	public ProductInfo mapRow(ResultSet result, int arg1) throws SQLException {
		
		ProductInfo obj = new ProductInfo();
		
		obj.setPid(result.getInt(1));
		obj.setPname(result.getString(2));
		obj.setPprice(result.getInt(3));
		obj.setPcategory(result.getInt(4));
		obj.setPcompany(result.getString(5));
		obj.setPdateReleased(result.getDate(6));
		obj.setPstock(result.getInt(7));
		obj.setPsalesNum(result.getInt(8));
		obj.setPdescription(result.getString(9));
		obj.setImageDashboard(result.getString(10));
		obj.setImageProduct(result.getString(11));
		obj.setImageIcon(result.getString(12));
		obj.setCategoryName(result.getString(14));
		

		return obj;
	}

	
	
}