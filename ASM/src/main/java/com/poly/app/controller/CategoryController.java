package com.poly.app.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.app.entity.Category;
import com.poly.app.entity.Product;
import com.poly.app.entity.Users;
import com.poly.app.repository.CategoryRepository;
import com.poly.app.repository.ProductRepository;

import jakarta.validation.Valid;

@Controller
public class CategoryController {
    
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
   @ModelAttribute("categories")
	public List<Category> getAllCate() {
		return categoryRepository.findAll();

	}
   
   public void ListCt(Model model) {
	   
	   List<Category> list = categoryRepository.findAll();
	   model.addAttribute("listct",list);
   }
	
	@GetMapping("/category/{id}/product/list")
	 public String ProductList(Model model,@PathVariable("id") Long id,
			 @RequestParam(name = "pageNum",required = false, defaultValue = "1")Integer pageNum,
			 @RequestParam(name = "pageSize",required = false, defaultValue = "6")Integer pageSize
			 ) {
		 Pageable pageable = PageRequest.of(pageNum -1, pageSize);
		 
		 Category category = new Category();
		 category.setId(id);
		 Page<Product> page = productRepository.findByCategory(category, pageable);
		 
		 
		 model.addAttribute("product", page.getContent());
		 model.addAttribute("totalPage",page.getTotalPages());
		 
		 return "product";
	 }

	@GetMapping("/admin/category")
	public String showCategory(Model model, @Valid @ModelAttribute("category") Category category, BindingResult result) {
		model.addAttribute("catygory", new Category());
		ListCt(model);
		return "categoryad";
	}
	
	@PostMapping("/admin/category/create")
	public String createCategory(Model model, @ModelAttribute("category") Category category,
			BindingResult result,RedirectAttributes attributes) {
		    try {
		    	categoryRepository.save(category);
		    	attributes.addFlashAttribute("successMessage", "Thêm thành công!");
				return"redirect:/admin/category";
			} catch (Exception e) {
				e.printStackTrace();
			}
		    attributes.addFlashAttribute("successMessage", "Thêm thất bại!");
		    return"redirect:/admin/category";
	}
	@PostMapping("/admin/category/update")
	public String updateCategory(Model model,Category category,
			RedirectAttributes attributes) {
		try {
			categoryRepository.save(category);
			ListCt(model);
			attributes.addFlashAttribute("successMessage", "Update thành công!");
			return"redirect:/admin/category/edit/" + category.getId();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		attributes.addFlashAttribute("successMessage", "Update thất bại!");
		return"redirect:/admin/category";
	}
	
	@GetMapping("/admin/category/edit/{id}")
	public String editCategory(Model model, @PathVariable("id")Integer id) {
	Optional<Category> listcate = categoryRepository.findById(id);
	model.addAttribute("category",listcate);
	ListCt(model);
	return"/categoryad";
		
	}
	@GetMapping("/admin/category/delete/{id}")
	public String deleteCategory(Model model, @PathVariable("id")Integer id) {
	categoryRepository.deleteById(id);
	ListCt(model);
	return"redirect:/admin/category";
		
	}
	
	
}
