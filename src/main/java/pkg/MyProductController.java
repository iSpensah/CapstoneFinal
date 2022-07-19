package pkg;

import java.io.BufferedOutputStream;
import java.util.Locale;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dao.category.CategoryInfoP;
import dao.category.JdbcTemplateCategoryP;
import dao.product.JdbcTemplateProduct;
import dao.product.ProductInfo;

@Controller
public class MyProductController {

	JdbcTemplateProduct objtemplate = new JdbcTemplateProduct();
	JdbcTemplateCategoryP objtemplateC = new JdbcTemplateCategoryP();

	@Autowired
	ServletContext context;

	private static final String UPLOAD_DIRECTORY = "/resources/CSSJSIMG/images/";

	@RequestMapping("/admin-product")
	public String showAllProductDetails(Model model) {
		List<ProductInfo> list = objtemplate.displayAllProduct();
		List<CategoryInfoP> listC = objtemplateC.getAllCategory();
		List<String> listCS = objtemplateC.getAllCategoryName();

		model.addAttribute("allproduct", list);
		model.addAttribute("allcategory", listC);
		model.addAttribute("allcategoryname", listCS);
		return "admin-product";
	}

	@RequestMapping("/admin-product/addNewProductForm")
	public String productDashboard(Model model) {
		List<ProductInfo> list = objtemplate.displayAllProduct();
		List<CategoryInfoP> listC = objtemplateC.getAllCategory();
		List<String> listCS = objtemplateC.getAllCategoryName();

		model.addAttribute("allproduct", list);
		model.addAttribute("allcategory", listC);
		model.addAttribute("allcategoryname", listCS);
		return "admin-product/addNewProductForm";
	}

	
	@RequestMapping(value = "admin-product/saveNewProduct", method = RequestMethod.POST)
	public String saveNewProduct(@RequestParam CommonsMultipartFile fileID,@RequestParam CommonsMultipartFile fileIP,@RequestParam CommonsMultipartFile fileII, HttpSession session,
			HttpServletRequest request) throws Exception {

		int pid = objtemplate.getNewProductID();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		
		String pname = request.getParameter("pname");
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		int pcategory = Integer.parseInt(request.getParameter("pcategory"));
		String pcompany = request.getParameter("pcompany");
		Date pdateReleased = formatter.parse(request.getParameter("pdateReleased"));
		int pstock = Integer.parseInt(request.getParameter("pstock"));
		int psalesNum = Integer.parseInt(request.getParameter("psalesNum"));
		String pdescription = request.getParameter("pdescription");
		String imageDashboard = fileID.getOriginalFilename();
		String imageProduct = fileIP.getOriginalFilename();
		String imageIcon = fileII.getOriginalFilename();

		
		
		objtemplate.insertNewProduct(pid, pname, pprice, pcategory, pcompany, pdateReleased, pstock, psalesNum,
				pdescription, imageDashboard,imageProduct,imageIcon);
		System.out.println("row inserted");

		ServletContext context = session.getServletContext();
		String pathID = context.getRealPath(UPLOAD_DIRECTORY);
	    String filenameID = fileID.getOriginalFilename();
	    
	    System.out.println(pathID+" "+filenameID);  
	    
		byte[] bytesID = fileID.getBytes();
		BufferedOutputStream streamID = new BufferedOutputStream(
				new FileOutputStream(new File(pathID + File.separator + filenameID)));
		streamID.write(bytesID);
		streamID.flush();
		streamID.close();
		
		String pathIP = context.getRealPath(UPLOAD_DIRECTORY);
	    String filenameIP = fileIP.getOriginalFilename();
	    
	    System.out.println(pathIP+" "+filenameIP);  
	    
		byte[] bytesIP = fileIP.getBytes();
		BufferedOutputStream streamIP = new BufferedOutputStream(
				new FileOutputStream(new File(pathIP + File.separator + filenameIP)));
		streamIP.write(bytesIP);
		streamIP.flush();
		streamIP.close();
		
		String pathII = context.getRealPath(UPLOAD_DIRECTORY);
	    String filenameII = fileII.getOriginalFilename();
	    
	    System.out.println(pathII+" "+filenameII);  
	    
		byte[] bytesII = fileII.getBytes();
		BufferedOutputStream streamII = new BufferedOutputStream(
				new FileOutputStream(new File(pathII + File.separator + filenameII)));
		streamII.write(bytesII);
		streamII.flush();
		streamII.close();
		
		
		


		return "redirect:/admin-product?add="+1;
	}

	@RequestMapping("/deleteProduct/{anyword}")
	public String saveNewProduct(@PathVariable int anyword) {
		objtemplate.deleteProduct(anyword);
		return "redirect:/admin-product?remove="+1;
	}

	@RequestMapping("admin-product/editProductForm/{pid}")
	public String editProductForm(@PathVariable int pid, Model model) {
		List<CategoryInfoP> listC = objtemplateC.getAllCategory();

		List<ProductInfo> list = objtemplate.displayAllProduct();

		ProductInfo objProduct = objtemplate.searchProduct(pid);
		model.addAttribute("allproduct", list);
		model.addAttribute("allcategory", listC);
		model.addAttribute("product", objProduct);

		return "admin-product/editProductForm";
	}

	@RequestMapping(value = "/admin-product/updateProductDetails", method = RequestMethod.POST)
	public String updateProductDetails(@RequestParam CommonsMultipartFile fileID, @RequestParam CommonsMultipartFile fileIP,@RequestParam CommonsMultipartFile fileII, HttpServletRequest request, HttpSession session) throws Exception {

		ServletContext context = session.getServletContext();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		ProductInfo objProduct = objtemplate.searchProduct(pid);
		
		String pname = request.getParameter("pname");
		int pcategory = Integer.parseInt(request.getParameter("pcategory"));
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		String pcompany = request.getParameter("pcompany");
		Date pdateReleased = formatter.parse(request.getParameter("pdateReleased"));
		int pstock = Integer.parseInt(request.getParameter("pstock"));
		int psalesNum = Integer.parseInt(request.getParameter("psalesNum"));
		String pdescription = request.getParameter("pdescription");
		String imageDashboard = fileID.getOriginalFilename();
		String imageProduct = fileIP.getOriginalFilename();
		String imageIcon = fileII.getOriginalFilename();
		
		if(imageDashboard == "") {
			imageDashboard = objProduct.getImageDashboard();
		}else {
			
			String pathID = context.getRealPath(UPLOAD_DIRECTORY);
		    String filenameID = fileID.getOriginalFilename();
		    
			byte[] bytesID = fileID.getBytes();
			BufferedOutputStream streamID = new BufferedOutputStream(
					new FileOutputStream(new File(pathID + File.separator + filenameID)));
			streamID.write(bytesID);
			streamID.flush();
			streamID.close();
		}
		
		if(imageProduct == "") {
			imageProduct = objProduct.getImageProduct();
		}else {

			
			String pathIP = context.getRealPath(UPLOAD_DIRECTORY);
		    String filenameIP = fileIP.getOriginalFilename();
		    
			byte[] bytesIP = fileIP.getBytes();
			BufferedOutputStream streamIP = new BufferedOutputStream(
					new FileOutputStream(new File(pathIP + File.separator + filenameIP)));
			streamIP.write(bytesIP);
			streamIP.flush();
			streamIP.close();
		}
		
		if(imageIcon == "") {
			imageIcon = objProduct.getImageIcon();
		}else {

			
			String pathII = context.getRealPath(UPLOAD_DIRECTORY);
		    String filenameII = fileII.getOriginalFilename();
		    
			byte[] bytesII = fileII.getBytes();
			BufferedOutputStream streamII = new BufferedOutputStream(
					new FileOutputStream(new File(pathII + File.separator + filenameII)));
			streamII.write(bytesII);
			streamII.flush();
			streamII.close();
			
		}
				
		objtemplate.updateProduct(pid, pname, pcategory, pprice, pcompany, pdateReleased, pstock, psalesNum,
				pdescription, imageDashboard, imageProduct, imageIcon);

		

		return "redirect:/admin-product?edit="+1;
	}

	@RequestMapping("/admin-product/moreProductDetails/{pid}")
	public String moreProductForm(@PathVariable int pid, Model model) {
		List<CategoryInfoP> listC = objtemplateC.getAllCategory();

		List<ProductInfo> list = objtemplate.displayAllProduct();

		ProductInfo objProduct = objtemplate.searchProduct(pid);
		model.addAttribute("allproduct", list);
		model.addAttribute("allcategory", listC);
		model.addAttribute("product", objProduct);

		return "admin-product/detailProductForm";
	}

	@RequestMapping("/viewFilterCategory")
	public String showFilterProductDetails(HttpServletRequest request, Model model) {
		List<String> listCS = objtemplateC.getAllCategoryName();
		String filterCategory = request.getParameter("filterCategory");

		List<ProductInfo> list = null;

		if (!filterCategory.equals("ShowAll")) {
			list = objtemplate.getAllProduct(filterCategory);
		} else {
			list = objtemplate.getAllProduct();
		}
		model.addAttribute("allproduct", list);
		model.addAttribute("allcategoryname", listCS);
		model.addAttribute("tc", list.size());

		return "admin-product";
	}

}
