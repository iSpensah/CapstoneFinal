package dao.viewaddbuyproduct;

import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
public class JdbcTemplateVABProduct 
{
	public JdbcTemplate getTemplate()
	{
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
		return temp;
	}
	
	//Counting total items in Cart
	public int totalCart(int userid)
	{
		JdbcTemplate temp = getTemplate();	
		Integer totalCart = temp.queryForObject("select count(isoncart) from cart_tbl c inner join user_tbl u ON c.userid = u.userid WHERE u.userid = ? AND c.isoncart = 1",new Object[] {userid} ,Integer.class);
		return totalCart;
	}
	
	//Selecting quantity for deleting
	public int quantityForDelete(int productid)
	{
		JdbcTemplate temp = getTemplate();	
		Integer quantityForDelete = temp.queryForObject("select QOH from product_tbl where productid = ?",new Object[] {productid} ,Integer.class);
		return quantityForDelete;
	}
	
	//Selecting all cart of one user
	public List<ViewCart> viewCart(int userid)
	{
		JdbcTemplate temp = getTemplate();
		List<ViewCart> list = temp.query("SELECT * FROM cart_tbl c INNER JOIN product_tbl p ON p.productid = c.productid where c.userid =  ? AND c.isoncart = 1 order by cartdate desc",new Object[] {userid}, new ViewCartMapper());
		
		return list;
	}
	
	//Checking if there is existing cart for selected Product ID
	public List<ViewCart> getOneCart(int userid, int productid)
	{
		JdbcTemplate temp = getTemplate();
		List<ViewCart> list = temp.query("SELECT * FROM cart_tbl c INNER JOIN product_tbl p ON p.productid = c.productid where c.userid =  ? AND c.productid = ? AND c.isoncart = 1",new Object[] {userid,productid}, new ViewCartMapper());
		
		return list;
	}
	
	//Updating cart quantity if product already exists in cart
	public void updateDuplicateCart(int quantity, int userid, int productid)
	{
		JdbcTemplate temp = getTemplate();
		temp.update("update cart_tbl set quantity = ? where userid = ? and productid = ?", new Object[] {quantity,userid,productid});
	}
	
	//Deleting cart
	public void deleteCart(int cartid)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("delete from cart_tbl where cartid =?",new Object[] {cartid});

	}

	//Selecting all coupons
	public List<CouponInfo> getAllCoupon()
	{
		JdbcTemplate temp = getTemplate();
		List<CouponInfo> list = temp.query("select * from coupon_tbl c inner join promotionalevent_tbl p ON p.pid = c.pid where eventstartdate < current_date AND eventenddate > current_date", new CouponMapper());
		return list;
	}
	
	//Selecting all upcoming events
	public List<CouponInfo> getAllCouponUpcoming()
	{
		JdbcTemplate temp = getTemplate();
		List<CouponInfo> list = temp.query("select * from coupon_tbl c inner join promotionalevent_tbl p ON p.pid = c.pid where eventstartdate > current_date", new CouponMapper());
		return list;
	}
	
	//Generating new Payment ID
	public int getNewPaymentID()
	{

		JdbcTemplate temp = getTemplate();
		Integer payId = temp.queryForObject("select max(payId) + 1 from payment_tbl",Integer.class);
		return payId;
	}

	//Inserting payment 
	public void saveCustomerPayment(int payId, int userid, double tBillAmount,double totalDiscount, String cHolderName, String cardNum, int cardCvv, String cardExp, String paymentStatus)
	{
		JdbcTemplate temp = getTemplate();
		temp.update("insert into payment_tbl values(?,?,?,?,?,?,?,(TO_DATE(?, 'yyyy/mm/dd')),?)",new Object[] {payId, userid, tBillAmount,totalDiscount,cHolderName,cardNum,cardCvv,cardExp, paymentStatus});
	}
	
	//Updating isOnCart after payment
	public void updateIsOnCart(int userid)
	{
		JdbcTemplate temp = getTemplate();
		temp.update("update cart_tbl set isoncart = 0 where userid = ?", new Object[] {userid});
	}

	
}


