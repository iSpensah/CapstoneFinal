package dao.coupon;


import java.util.List;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.category.CategoryInfoP;
import dao.category.CategoryMapperP;
import dao.product.ProductInfo;
import dao.product.ProductMapper;

public class JdbcTemplateCoupon {

	public JdbcTemplate getTemplate()
	{
	ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
	JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
	return temp;
	}
	
	public int getNewCouponID()
	{

	JdbcTemplate temp = getTemplate();
	Integer newcid = temp.queryForObject("select max(cid) + 1 from coupon_tbl",Integer.class);
	return newcid;
	}
	
	public List<CouponInfo> getAllCoupons()
	{
	JdbcTemplate temp = getTemplate();
	List<CouponInfo> list = temp.query("select cid, coupname, coupdesc, eventname, discount from promotionalEvent_tbl e INNER JOIN coupon_tbl c ON e.pid = c.pid",new CouponMapper());

	return list;
}
	public void insertNewCoupon(int cid,String coupname,String coupdesc,int pid, int discount)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("insert into coupon_tbl values(?,?,?,?,?)",new Object[] {cid,coupname,coupdesc,pid,discount});
		System.out.println("----------row inserted");
	}
	
	public CouponInfo searchCoupon(int cid)
	{
		JdbcTemplate temp = getTemplate();	
		CouponInfo coupon = temp.queryForObject("select cid,coupname, coupdesc, eventname, discount from promotionalEvent_tbl e INNER JOIN coupon_tbl c ON e.pid = c.pid where cid = ?",
		new Object [] {cid},new CouponMapper());
		return coupon;
	}


	public void updateCoupon(int cid,String coupname, String coupdesc, int pid, int discount)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("update coupon_tbl set coupname=?, coupdesc=?, pid=?, discount=? where cid =?",
		new Object[] {coupname,coupdesc,pid,discount,cid});
		
	}
	
	public void deleteCoupon (int cid)
	{
	JdbcTemplate temp = getTemplate();
	temp.update("delete from coupon_tbl where cid =?",new Object[] {cid});
	System.out.println("----------row deleted");


	}
	 public Integer countTotalCoupons()
	 {
	 JdbcTemplate temp = getTemplate();
	 Integer totalcoupons = temp.queryForObject("select count(*) as totalcoupons from Coupon_tbl ",Integer.class);
	
	 return totalcoupons;
	 }
	 
		/* testing */
		public List<String> getAllCategoryName()
		{
			JdbcTemplate temp = getTemplate();
			List<String> list = temp.queryForList("Select categoryName from ctgry_tbl", String.class);
			return list;
		}
		
		public List<ProductInfo> getAllProduct(String ecategory) {
			JdbcTemplate temp = getTemplate();
			List<CategoryInfoP> listC = temp.query("Select * from ctgry_tbl where categoryName=?",
					new Object[] { ecategory }, new CategoryMapperP());

			List<ProductInfo> list = temp.query("Select * from product_tbl where categoryID=?",
					new Object[] { listC.get(0).getCategoryID() }, new ProductMapper());
			return list;
		}
	 
	 
}