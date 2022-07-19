package pkg;
import dao.adminlogin.AdminInfo;
import dao.adminlogin.JdbcTemplateAdmin;
import dao.category.*;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyCategoryController {

	JdbcTemplateCategory objtemplate = new JdbcTemplateCategory();
	
	////////SHOW ALL CATEGORY//////////
	@RequestMapping("/admin-category")
	public String showAllCategory(Model model)
	{
		List<CategoryInfo> list = objtemplate.getAllCategory();
		
		model.addAttribute("allcategory",list);
		
		
		return "admin-category";
	}
	
	////////ADD NEW CATEGORY//////////
	@RequestMapping("/admin-category/addNewCategoryForm")
	public String addNewCategoryForm()
	{
		return "admin-category/addNewCategoryForm";
	}
	
	////////ADD NEW CATEGORY FUNCTION//////////
	@RequestMapping("/admin-category/addNewCategory")
	public String addNewCategory(HttpServletRequest request,Model model)
	{
		int categoryId = objtemplate.getNewCategoryId();
		String categoryName = request.getParameter("categoryName");
		String categoryDesc = request.getParameter("categoryDesc");
		
		objtemplate.addNewCategory(categoryId, categoryName, categoryDesc);
		
		return "redirect:/admin-category?event="+1;  
	}
	
	////////UPDATE CATEGORY//////////
	@RequestMapping("/admin-category/editCategoryForm/{categoryId}")
	public String editCategoryForm(@PathVariable int categoryId, Model model)
	{
		CategoryInfo objCategory = objtemplate.searchCategory(categoryId);
		
				
		model.addAttribute("category",objCategory);
		return "admin-category/editCategoryForm";  
	}
	
	@RequestMapping("/admin-category/updateCategoryDetails")	
	public String updateCategoryDetails(HttpServletRequest request)
	{

		
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("categoryName");
		String categoryDesc = request.getParameter("categoryDesc");
		
		objtemplate.updateCategory(categoryId, categoryName, categoryDesc);
		
		return "redirect:/admin-category?edit="+1;  
			
	}
	
	////////DELETE CATEGORY//////////
	@RequestMapping("/deleteCategory/{categoryId}")
	public String deleteCategory(@PathVariable int categoryId)
	{
		objtemplate.deleteCategory(categoryId);
		
		
		
		return "redirect:/admin-category?remove="+1;  
	}
	
	
	
}
