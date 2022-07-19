package pkg;

import dao.logreg.JDBCLogReg;
import dao.userdetails.JdbcUserTemplate;
import dao.userdetails.UserDetailsInfo;

import java.util.List;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserAccount {

	JdbcUserTemplate objtemplateuser = new JdbcUserTemplate();
	JDBCLogReg register = new JDBCLogReg();
	int userid=0;
	
	@RequestMapping("/useraccount")
	public String customerDashboard()
	{
		return "dashboard";
	}
	
	//Show User details
	@RequestMapping("/showUserDetails")
	public String showUserDetails(HttpServletRequest request, Model model)
	{
		userid = Integer.parseInt(request.getParameter("userid"));
		List<UserDetailsInfo> list = objtemplateuser.getAllUserDetails(userid);
		model.addAttribute("allcustomers",list);
		
		return "myaccount";
	}

	//Updating Password
	@RequestMapping("/updateUserPass")
	public String updateUserPass(HttpServletRequest request)
	{
		String newpass = request.getParameter("new_pword");
		
		objtemplateuser.updatePassword(newpass, userid);
		return "redirect:/showUserDetails?userid="+userid+"&updated=1#tab1";  
	}
		
	//Register new account
	@RequestMapping("/register")
	public String saveUser(HttpServletRequest request, Model model) {
		
		int userid = register.getNewUserID();
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String userpass = request.getParameter("userpass");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String phonenumber = request.getParameter("phonenumber");
	
		register.insertNewUser(userid, firstname, lastname, email, userpass, gender, address, phonenumber);

		return "redirect:/?register="+1;
	}


}
