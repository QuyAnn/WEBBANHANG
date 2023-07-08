package com.poly.app.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.app.entity.Category;
import com.poly.app.entity.Product;
import com.poly.app.entity.Users;
import com.poly.app.repository.CategoryRepository;
import com.poly.app.repository.ProductRepository;
import com.poly.app.repository.UseradRepository;

import ch.qos.logback.core.Context;
import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;



@Controller
public class HomeController {
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private UseradRepository useradRepository;
    
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	ServletContext context;
	
	@Value("${upload.path}")
	private String pathFolder;
	
	public void List(Model model) {
		
		List<Users> list= useradRepository.findAll();
		model.addAttribute("listad",list);
	}
	
	@GetMapping("/home")
	public String Home(Model model) {
	   model.addAttribute("user",new Users());
       return "home";
	}
	@GetMapping("/contact")
	public String Contact(Model model) {
	   
       return "contact";
	}
	
	
	@GetMapping("/admin/user")
	public String Home(Model model,
			@Valid @ModelAttribute("user")
         Users user, BindingResult result) {
	   model.addAttribute("user",new Users());
	   List(model);
		return "homeadmin";
	}
	
	@PostMapping("admin/user/create")
	public String createUser(Model model, @ModelAttribute("user") Users users,
			BindingResult result
			,RedirectAttributes attributes,
			@RequestParam("image") MultipartFile file) {
		
		try {
			if (!file.isEmpty()) {
		    byte [] bytes =file.getBytes();
		    Path path = Paths.get(pathFolder + file.getOriginalFilename());
		    Files.write(path, bytes);
		    users.setImage("images/" + file.getOriginalFilename());
		    useradRepository.save(users);
		    List(model);
			return"redirect:/admin/user";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return"redirect:/admin/user";
	}
	@GetMapping("admin/user/delete/{username}")
	public String deleteUser(Model model,@PathVariable("username")String username) {
		useradRepository.delete(useradRepository.findByUsername(username));
		List(model);
		return"redirect:/admin/user";
	}
	@GetMapping("admin/user/edit/{username}")
	public String edit(Model model,@PathVariable("username") String username) {
		Users user =useradRepository.findByUsername(username);
		model.addAttribute("user",user );
		List(model);
		return"/homeadmin";
	}
	
	@PostMapping("admin/user/update")
	public String updateUser(Model model,Users item,
			BindingResult result
			,RedirectAttributes attributes,
			@RequestParam("image") MultipartFile file) {
		
		try {
			if (!file.isEmpty()) {
		    byte [] bytes =file.getBytes();
		    Path path = Paths.get(pathFolder + file.getOriginalFilename());
		    Files.write(path, bytes);
		    item.setImage("images/" + file.getOriginalFilename());
		    useradRepository.save(item);
		    List(model);
		    return"redirect:/admin/user/edit/"+ item.getUsername();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	     
		return"redirect:/admin/user/edit/"+ item.getUsername();
	}
	
	public void ListPro(Model model) {
		List<Product> listpr = productRepository.findAll();
		model.addAttribute("listpr",listpr);
	}
	
	@GetMapping("/admin/product")
	public String Home(Model model,
			@Valid @ModelAttribute("product")
       Product product, BindingResult result) {
	   model.addAttribute("product",new Product());
	   List<Category> categories = categoryRepository.findAll();
	   model.addAttribute("categories", categories);
	   ListPro(model);
	   return "productad";
	}
	
	@PostMapping("/admin/product/create")
	public String createProduct(Model model, @ModelAttribute("product") Product product,
	                            BindingResult result, RedirectAttributes attributes,
	                            @RequestParam("image") MultipartFile file) {
	    Date date = new Date();
	    product.setCreateDate(date);
	    try {
	        if (!file.isEmpty()) {
	            byte[] bytes = file.getBytes();
	            Path path = Paths.get(pathFolder + file.getOriginalFilename());
	            Files.write(path, bytes);
	            product.setImage("images/" + file.getOriginalFilename());
	            productRepository.save(product);

	            ListPro(model);
	            attributes.addFlashAttribute("successMessage", "Thêm sản phẩm thành công!");
	            return "redirect:/admin/product";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    attributes.addFlashAttribute("successMessage", "Thêm sản phẩm không thành công!");
	    return "redirect:/admin/product";
	}

	
	@PostMapping("/admin/product/update")
	public String updateProduct(Model model,Product item,
			BindingResult result
			,RedirectAttributes attributes,
			@RequestParam("image") MultipartFile file) {
		Date date = new Date();
		item.setCreateDate(date);
		
		try {
			if (!file.isEmpty()) {
		    byte [] bytes =file.getBytes();
		    Path path = Paths.get(pathFolder + file.getOriginalFilename());
		    Files.write(path, bytes);
		    item.setImage("images/" + file.getOriginalFilename());
		    productRepository.save(item);
			ListPro(model);
			attributes.addFlashAttribute("successMessage", "Update sản phẩm thành công!");
			return"redirect:/admin/product/edit/"+ item.getId();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		attributes.addFlashAttribute("successMessage", "Update sản phẩm thất bại!");
		return"redirect:/admin/product/edit/"+ item.getId();
		
	}
	
	@GetMapping("/admin/product/delete/{id}")
	public String deleteProduct(Model model, @PathVariable("id") Integer id,
			RedirectAttributes attributes) {
		
		productRepository.deleteById(id);
		ListPro(model);
		attributes.addFlashAttribute("successMessage", "Xoá sản phẩm thành công!");
		return"redirect:/admin/product";
	}
	
	@GetMapping("/admin/product/edit/{id}")
	public String editProduct(Model model, @PathVariable("id")Integer id) {
		
		Optional<Product> listp =  productRepository.findById(id);
		model.addAttribute("product",listp);
		 List<Category> categories = categoryRepository.findAll();
		   model.addAttribute("categories", categories);
		ListPro(model);
		return"/productad";
	}
	
	
		
	
	
}
