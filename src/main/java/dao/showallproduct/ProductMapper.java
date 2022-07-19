package dao.showallproduct;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class ProductMapper implements RowMapper<ProductInfo> {
	@Override
	public ProductInfo mapRow(ResultSet result, int arg1) throws SQLException {
		ProductInfo obj = new ProductInfo();
		obj.setProductid(result.getInt(1));
		obj.setProductname(result.getString(2));
		obj.setPprice(result.getInt(3));
		obj.setCategoryid(result.getInt(4));
		obj.setCompanyname(result.getString(5));
		obj.setDateReleased(result.getString(6));
		obj.setQOH(result.getInt(7));
		obj.setSalesNum(result.getInt(8));
		obj.setPdescription(result.getString(9));
		obj.setImageDashboard(result.getString(10));
		obj.setImageProduct(result.getString(11));
		obj.setImageIcon(result.getString(12));
		obj.setCategoryname(result.getString(14));
		obj.setCategorydesc(result.getString(15));
	
		return obj;
	}
}
