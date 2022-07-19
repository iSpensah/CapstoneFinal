package pkg;

import dao.category.JdbcTemplateCategoryP;
import dao.coupon.*;
import dao.event.EventInfo;
import dao.event.JdbcTemplateEvent;

import java.util.List;

    import javax.servlet.http.HttpServletRequest;

    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.PathVariable;
    import org.springframework.web.bind.annotation.RequestMapping;

    @Controller
    public class MyCouponController {
        JdbcTemplateEvent objtemplateE = new JdbcTemplateEvent();
        JdbcTemplateCategoryP objtemplateC = new JdbcTemplateCategoryP();

        JdbcTemplateCoupon objtemplate = new JdbcTemplateCoupon();

        @RequestMapping("/admin-coupon")
        public String showAllCouponsDetails(Model model)
        {
            List<CouponInfo> list = objtemplate.getAllCoupons();

            model.addAttribute("allcoupons",list);

            return "admin-coupon";
        }

        @RequestMapping("/admin-coupon/addNewCouponForm")
        public String insertNewCouponForm(Model model)
        {

//            List<CategoryInfoP> listC = objtemplateC.getAllCategory();
//            List<String> listCS = objtemplateC.getAllCategoryName();
//
//            
//            model.addAttribute("allcategory", listC);
//            model.addAttribute("allcategoryname", listCS);
            List<EventInfo> list = objtemplateE.getAllEvents();

            model.addAttribute("allevents",list);
            return "admin-coupon/addNewCouponForm";
        }
        @RequestMapping("/admin-coupon/saveNewCoupon")
        public String saveNewCoupon (HttpServletRequest request,Model model)
        {
            int cid =  objtemplate.getNewCouponID();

            String coupname = request.getParameter("coupname");
            String coupdesc = request.getParameter("coupdesc");
            int  pid = Integer.parseInt(request.getParameter("pid"));
            int  discount = Integer.parseInt(request.getParameter("discount"));
            objtemplate.insertNewCoupon(cid, coupname, coupdesc, pid, discount);

            return "redirect:/admin-coupon?coupon="+1;
        }

        @RequestMapping("/admin-coupon/deleteCoupon/{cid}")
        public String saveNewCoupon(@PathVariable int cid)
        {
        objtemplate.deleteCoupon(cid);
        return "redirect:/admin-coupon?remove="+1;
        }


        @RequestMapping("/admin-coupon/editCouponForm/{cid}")
        public String editEventForm(@PathVariable int cid, Model model)
        {
            List<EventInfo> list = objtemplateE.getAllEvents(); 
            model.addAttribute("allevents",list);

            CouponInfo objCoupon = objtemplate.searchCoupon(cid);

            model.addAttribute("coupon",objCoupon);
            return "admin-coupon/editCouponForm";  
        }    

    @RequestMapping("/admin-coupon/updateCouponDetails")
        public String updateCouponDetails(HttpServletRequest request)
        {

            
            int cid = Integer.parseInt(request.getParameter("cid"));
            String coupname = request.getParameter("coupname");
            String coupdesc = request.getParameter("coupdesc");
            int pid = Integer.parseInt(request.getParameter("pid"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            objtemplate.updateCoupon(cid, coupname, coupdesc,pid, discount);

            return "redirect:/admin-coupon?edit="+1;  

        }

}