package pkg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.adminlogin.AdminInfo;
import dao.adminlogin.JdbcTemplateAdmin;




@Controller
public class MyAdminController {
    public int isvalid= 0;

    
    JdbcTemplateAdmin objtemplate = new JdbcTemplateAdmin();

@RequestMapping("/admin")
public String adminLogin(HttpServletRequest request,Model model)
{

//    if(isvalid == 0) {
//        String Notification = "Input AdminID and password";
//        
//        model.addAttribute("loginNotification", Notification);
//        
//    }
//    else if(isvalid == 1) {
//        String totalevent = "test display ajsdiasfg(1)";
//        
//        model.addAttribute("totalevents", totalevent);
//        
//    }
    if(isvalid == 2) {
        String Notification2 = "Incorect AdminID or password";

        model.addAttribute("IncorrectNotify", Notification2);

    }

    return "admin-login";

}

@RequestMapping("/signin")
public String adminSignin(HttpServletRequest request, Model model)
{
    String adminid = request.getParameter("adminid");
    String adminpass = request.getParameter("adminpass"); 

    if(isvalid(adminid, adminpass, model) == 1) {

    return "redirect:/admin-overview?login="+1;    
    }
    else {

        return "redirect:/admin";

    }

}

public int isvalid(String adminid, String adminpass, Model model) {

    // get user table
    List<AdminInfo> list = objtemplate.getAllAdmin();


    for (int i = 0; i < list.size(); i++ ) {

        String admindb = list.get(i).getAdminid();
        String passdb = list.get(i).getAdminpass();

        if (admindb.equals(adminid)) {
            if (passdb.equals(adminpass)) {

                isvalid = 1;

                break;
            } break;

        }
        else {
            isvalid = 2;
        }


    }
    return isvalid;





}
}