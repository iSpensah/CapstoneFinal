package pkg;
import dao.logreg.JDBCLogReg;
import dao.logreg.LogReg;
import dao.showallproduct.ProductInfo;
import dao.showallproduct.ProductJdbcTemplate;
import dao.viewaddbuyproduct.*;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.addToCart.*;
@Controller
public class UserController {
	
	int userID;

	JdbcTemplateVABProduct objtemplate = new JdbcTemplateVABProduct();
	JDBCLogReg log = new JDBCLogReg();
	ProductJdbcTemplate product = new 	ProductJdbcTemplate();
	addToCart atc = new addToCart();
	
	//Index
	@RequestMapping("/")
	public String customerDashboard(HttpServletRequest request, Model model, RedirectAttributes redirAttrs)
	{
		
		List<ProductInfo> sproduct = product.getAllProducts();
		model.addAttribute("allproducts", sproduct);
		
		List<String> categories = product.getAllCategories();
		model.addAttribute("procat", categories);
		
		return "LoginPage";
 
	}
	
	//Login User
	@RequestMapping("/loginregister")
	public String login(HttpServletRequest request, Model model) {
		
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
	
		if (isUserValid(email, password)) {
			return "redirect:/user-dashboard?login="+1+ "&userid="+userID;
		} else
			return "redirect:/?login=" + 1;

	}
	
	//Login Validation
	private boolean isUserValid(String email, String userpass) {

		// get user table
		List<LogReg> login = log.login();

		boolean isvalid = false;

		for (int i = 0; i < login.size(); i++) {
			String emaildb = login.get(i).getEmail();
			String userpassdb = login.get(i).getPassword();
			int userIDdb = login.get(i).getUserid();

			if (emaildb.equals(email)) {
				if (userpassdb.equals(userpass)) {
					userID = userIDdb;
					isvalid = true;
					break;
				}
				break;
			}
		}
		return isvalid;
	}
	
	//User Dashboard After Login
	@RequestMapping("/user-dashboard")
	public String userdashboard (HttpServletRequest request, Model model)
	{	

		int userid = Integer.parseInt(request.getParameter("userid"));	
		int count = objtemplate.totalCart(userid);
		model.addAttribute("count", count);
		List<ViewCart> cart = objtemplate.viewCart(userid);
		model.addAttribute("cart", cart);

		List<String> categories = product.getAllCategories();
		model.addAttribute("procat", categories);
		
		List<CouponInfo> clist = objtemplate.getAllCoupon();
		model.addAttribute("allcoupon",clist);
		
		List<CouponInfo> upcoming = objtemplate.getAllCouponUpcoming();
		model.addAttribute("upcoming",upcoming);
		
		model.addAttribute("userid", userid);
		List<ProductInfo> sproduct = product.getAllProducts();

		model.addAttribute("allproducts", sproduct);
		
		return "user-dashboard";

	}
	
	//Adding items to cart from dashboard
	@RequestMapping("/addtocart")
	public String addToCart(HttpServletRequest request, Model model)
	{
		
		int cartid = atc.newCartId();
		int userid =  Integer.parseInt(request.getParameter("userid"));
		int productid =  Integer.parseInt(request.getParameter("productid"));
		
		List<ViewCart> getcart = objtemplate.getOneCart(userid, productid);
		boolean ans = getcart.isEmpty();
		String cartdate = request.getParameter("date");
		int quantity =  Integer.parseInt(request.getParameter("qoh"));
		int qoh = Integer.parseInt(request.getParameter("tot"));
		int isOnCart =  Integer.parseInt(request.getParameter("isOnCart"));
		model.addAttribute("userid", userid);
		
		if(ans == true) {	
			atc.addToCart(cartid, userid, productid, cartdate, quantity, isOnCart);
		}else {
			int quantity2 = getcart.get(0).getQuantity();
			int newqua = quantity + quantity2;
			objtemplate.updateDuplicateCart(newqua, userid, productid);
		}
		
		atc.updateQOH(quantity, productid, qoh);
		
		return "redirect:/user-dashboard?cart="+1;  
	}
	
	
	//Adding items to cart from viewproduct
	@RequestMapping("/addtocartview/{productid}")
	public String addToCartView(@PathVariable int productid, HttpServletRequest request, Model model)
	{
		int cartid = atc.newCartId();
		int userid =  Integer.parseInt(request.getParameter("userid"));
		int productidd =  Integer.parseInt(request.getParameter("productid"));
		int buy = Integer.parseInt(request.getParameter("buy"));
		
		List<ViewCart> getcart = objtemplate.getOneCart(userid, productid);
		
		boolean ans = getcart.isEmpty();
		String cartdate = request.getParameter("date");
		int quantity =  Integer.parseInt(request.getParameter("qoh"));
		int qoh = Integer.parseInt(request.getParameter("tot"));
		int isOnCart =  Integer.parseInt(request.getParameter("isOnCart"));
		model.addAttribute("userid", userid);

		
		if(ans == true) {	
			atc.addToCart(cartid, userid, productidd, cartdate, quantity, isOnCart);		
		}else {
			int quantity2 = getcart.get(0).getQuantity();
			int newqua = quantity + quantity2;
			objtemplate.updateDuplicateCart(newqua, userid, productidd);
		}
		
		atc.updateQOH(quantity, productid, qoh);
		
		System.out.println(buy);
		
		if(buy == 1) {
			return "redirect:/usercheckout?userid="+userid+"&buy="+1;  
		}else {
			return "redirect:/viewproduct/"+productidd+"?userid="+userid+"&cart="+1;  
		}
		
	}	
	
	
	//Deleting items from cart from dashboard
	@RequestMapping("/deleteCart/{cartid}")
	public String saveNewCustomer(@PathVariable int cartid, HttpServletRequest request)
	{
		int userid = Integer.parseInt(request.getParameter("userid"));
		int productid = Integer.parseInt(request.getParameter("productid"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		int qoh = objtemplate.quantityForDelete(productid);
		objtemplate.deleteCart(cartid);
		atc.updateQOHDel(quantity, productid, qoh);
		
		return "redirect:/user-dashboard?userid="+userid+"&delete="+1;  
	}
	
	//Deleting items from cart from checkout page
	@RequestMapping("/deleteViewCart/{cartid}")
	public String deleteView(@PathVariable int cartid, HttpServletRequest request)
	{
		int userid = Integer.parseInt(request.getParameter("userid"));
		int productid = Integer.parseInt(request.getParameter("productid"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		int qoh = objtemplate.quantityForDelete(productid);
		objtemplate.deleteCart(cartid);
		atc.updateQOHDel(quantity, productid, qoh);
		
		
		return "redirect:/usercheckout?userid="+userid+"&delete="+1;  
	}
	
	
	//Deleting items from cart from viewproduct
	@RequestMapping("/deleteViewCartProd/{cartid}")
	public String deleteViewProd(@PathVariable int cartid, HttpServletRequest request)
	{
		int userid = Integer.parseInt(request.getParameter("userid"));
		int productid = Integer.parseInt(request.getParameter("productid"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		int qoh = objtemplate.quantityForDelete(productid);
		atc.updateQOHDel(quantity, productid, qoh);
		objtemplate.deleteCart(cartid);
		
		return "redirect:/viewproduct/"+productid+"?userid="+userid+"&remove="+1;  
	}
	
	
	//Viewing selected product
	@RequestMapping("viewproduct/{productid}")
	public String showAllProducts(HttpServletRequest request, @PathVariable int productid, Model model) {
		
		int userid = Integer.parseInt(request.getParameter("userid"));
		model.addAttribute("userid",userid);
		int count = objtemplate.totalCart(userid);
		model.addAttribute("count", count);
		List<ViewCart> cart = objtemplate.viewCart(userid);
		model.addAttribute("cart", cart);
		ProductInfo view = product.viewProduct(productid);
		model.addAttribute("view", view);
		
		List<CouponInfo> upcoming = objtemplate.getAllCouponUpcoming();
		model.addAttribute("upcoming",upcoming);

		List<CouponInfo> clist = objtemplate.getAllCoupon();
		model.addAttribute("allcoupon",clist);
		
		
		return "view-product";
	}

	
	//Checkout page
	@RequestMapping("/usercheckout")
	public String showAllCustomerDetails(HttpServletRequest request, Model model)
	{
		int userid = Integer.parseInt(request.getParameter("userid"));
		model.addAttribute("userid", userid);
		List<ViewCart> list = objtemplate.viewCart(userid);
	
		model.addAttribute("cart", list);

		List<CouponInfo> upcoming = objtemplate.getAllCouponUpcoming();
		model.addAttribute("upcoming",upcoming);
		
		int count = objtemplate.totalCart(userid);
		model.addAttribute("count", count);
		List<CouponInfo> clist = objtemplate.getAllCoupon();
		model.addAttribute("allcoupon",clist);
		
		return "user-checkout";
	}
	
	//Show all products
	@RequestMapping("/shopall")
	public String showAllProductHorizontally(HttpServletRequest request, Model model) {
		
		int userid = Integer.parseInt(request.getParameter("userid"));	
		model.addAttribute("userid", userid);
		List<String> categories = product.getAllCategories();
		List<ProductInfo> list = product.getAllProducts();
		int count = objtemplate.totalCart(userid);
		model.addAttribute("count", count);
		List<ViewCart> cart = objtemplate.viewCart(userid);
		model.addAttribute("cart", cart);
		
		List<CouponInfo> upcoming = objtemplate.getAllCouponUpcoming();
		model.addAttribute("upcoming",upcoming);

		List<CouponInfo> clist = objtemplate.getAllCoupon();
		model.addAttribute("allcoupon",clist);
		
		model.addAttribute("allproducts", list);
		model.addAttribute("procat",categories);
		return "view-all-product";
	}
	
	//Search by category
	@RequestMapping("/filtershopall") //updated page
	public String showFilterPoduct(HttpServletRequest request, Model model) {

		StringBuilder sb = new StringBuilder();
		String filter = "";
		String[] categoryname = request.getParameterValues("cat"); //gets the values of the checkboxes
		
		int userid = Integer.parseInt(request.getParameter("userid"));
		model.addAttribute("userid", userid);
		model.addAttribute("category", categoryname);
		if (categoryname != null && categoryname.length != 0) { //checks which checkboxes are checked and which is not
			for (int i = 0; i < categoryname.length; i++) {
				sb.append("'" + categoryname[i] + "',");
			}
			filter = sb.toString();
			filter = filter.substring(0, filter.length() - 1);
			System.out.println(filter);
			
			List<String> categories = product.getAllCategories();
			model.addAttribute("procat", categories);
			List<ProductInfo> list = product.getAllProducts(filter);
			model.addAttribute("allproducts", list);

			int count = objtemplate.totalCart(userid);
			model.addAttribute("count", count);
			List<ViewCart> cart = objtemplate.viewCart(userid);
			model.addAttribute("cart", cart);

			List<CouponInfo> clist = objtemplate.getAllCoupon();
			model.addAttribute("allcoupon",clist);
			
			List<CouponInfo> upcoming = objtemplate.getAllCouponUpcoming();
			model.addAttribute("upcoming",upcoming);
			
		}else if (categoryname == null) {
			return "redirect:/shopall?userid="+userid; 
		}

		return "view-all-product";
	}
	
	
	//Payment
	@RequestMapping("/insertpayment")
	public String savePayment(HttpServletRequest request,Model model)
	{
		
		int payId = objtemplate.getNewPaymentID();
		double tBillAmount = Double.parseDouble(request.getParameter("tBillAmount"));
		double totalDiscount =Double.parseDouble(request.getParameter("totalDiscount"));
		String cHolderName = request.getParameter("cHolderName");
		String cardNum = request.getParameter("cardNum");
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		String cardExp = request.getParameter("cardExp");
		String paymentStatus = "Paid";
		int userid = Integer.parseInt(request.getParameter("userid"));
		objtemplate.updateIsOnCart(userid);

		objtemplate.saveCustomerPayment(payId, userid, tBillAmount, totalDiscount, cHolderName, cardNum, cvv, cardExp, paymentStatus);

		return "redirect:/user-dashboard?userid="+userid+"&payment="+1;
	}
	
	
	//Add 1 quantity to checkout cart
	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		
		int userid =  Integer.parseInt(request.getParameter("userid"));
		int productid =  Integer.parseInt(request.getParameter("productid"));

		int oldquantity =  Integer.parseInt(request.getParameter("oldquantity"));
		int qoh = Integer.parseInt(request.getParameter("qoh"));
		
		int newqua = oldquantity + 1;
		int quantity = 1;
		
		objtemplate.updateDuplicateCart(newqua, userid, productid);
		
		atc.updateQOH(quantity, productid, qoh);
		
		return "redirect:/usercheckout?add="+1+"&userid="+userid; 
	}
	
	@RequestMapping("/minus")
	public String minus(HttpServletRequest request, Model model) {
		
		int userid =  Integer.parseInt(request.getParameter("userid"));
		int productid =  Integer.parseInt(request.getParameter("productid"));

		int oldquantity =  Integer.parseInt(request.getParameter("oldquantity"));
		int qoh = Integer.parseInt(request.getParameter("qoh"));
		
		int newquantity = oldquantity - 1;
		int quantity = 1;
		
		objtemplate.updateDuplicateCart(newquantity, userid, productid);
		
		atc.updateQOHDel(quantity, productid, qoh);
		
		return "redirect:/usercheckout?minus="+1+"&userid="+userid; 
	}
}
