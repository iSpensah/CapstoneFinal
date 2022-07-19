package pkg;
	import dao.category.CategoryInfoP;
import dao.category.JdbcTemplateCategoryP;
import dao.coupon.*;
import dao.event.EventInfo;
import dao.event.JdbcTemplateEvent;
import dao.product.JdbcTemplateProduct;
import dao.product.ProductInfo;

import java.util.List;

	import javax.servlet.http.HttpServletRequest;

	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.RequestMapping;

	@Controller
	public class MyDashboardController {

		JdbcTemplateEvent objEvent = new JdbcTemplateEvent();
		JdbcTemplateProduct objProduct = new JdbcTemplateProduct();
		JdbcTemplateCoupon objCoupon = new JdbcTemplateCoupon();

		JdbcTemplateCategoryP objtemplateC = new JdbcTemplateCategoryP();
		
		@RequestMapping("/admin-overview")
		public String showAllCoupon(Model model)
		{
			Integer totalcoupon = objCoupon.countTotalCoupons();
			Integer totalproduct = objProduct.countTotalProducts();
			Integer totalevent = objEvent.countTotalEvents();
			
			model.addAttribute("totalcoupons", totalcoupon);
			model.addAttribute("totalproducts", totalproduct);
			model.addAttribute("totalevents", totalevent);
			
			//COUPON
			List<CouponInfo> couponlist = objCoupon.getAllCoupons();
			
			model.addAttribute("allcoupons",couponlist);
			
			//EVENTS
			List<EventInfo> eventlist = objEvent.getAllEvents();
			 
			model.addAttribute("allevents",eventlist);
			
			//PRODUCT
			List<ProductInfo> productlist = objProduct.displayAllProduct();
			List<CategoryInfoP> productlistC = objtemplateC.getAllCategory();
			List<String> productlistCS = objtemplateC.getAllCategoryName();

			model.addAttribute("allproduct", productlist);
			model.addAttribute("allcategory", productlistC);
			model.addAttribute("allcategoryname", productlistCS);
			
			return "admin-dashboard";
		}
}