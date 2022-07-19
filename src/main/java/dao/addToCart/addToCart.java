package dao.addToCart;

import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import dao.viewaddbuyproduct.VABProduct;

public class addToCart 
{
	public JdbcTemplate getTemplate()
	{
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
		return temp;
	}
	
	//Insert new item in cart
	public void addToCart(int cartid, int userid, int productid, String cartdate, int quantity, int isOnCart)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("insert into cart_tbl values(?,?,?,(TO_DATE(?, 'yyyy-mm-dd hh24-mi-ss')),?,?)",new Object[] {cartid,userid,productid,cartdate,quantity,isOnCart});
	}
	
	//Decreasing the value of quantity once added to cart
	public void updateQOH(int quantity, int productid, int qoh) {
		JdbcTemplate temp = getTemplate();	
		int total = qoh - quantity;
		temp.update("update product_tbl set qoh = ? where productid = ?",new Object[] {total,productid});
	}
	
	//Increasing the value of quantity once deleted to cart
	public void updateQOHDel(int quantity, int productid, int qoh) {
		JdbcTemplate temp = getTemplate();	

		int total = qoh + quantity;
		
		temp.update("update product_tbl set qoh = ? where productid = ?",new Object[] {total,productid});
	}
	
	//Generating new cart id
	public int newCartId()
	{
		JdbcTemplate temp = getTemplate();	
		Integer newCartId = temp.queryForObject("select max(cartid) + 1 from cart_tbl",Integer.class);
		return newCartId;
	}
	
	public static void main(String s[])
	{
		System.out.println("");
		
	}
}


